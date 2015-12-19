using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookAnAppointment : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    //Concurency Control for the booking with Mutex synchronization
    private static Mutex mutex = new Mutex();

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        if (authCookie != null)
        {
            PageHeader.Text = string.Format("<h3 class='page-header-lg'>{0}</h3>", "Book an Appointment");

            Label label = (Label)UpdatePanel.FindControl("BookingErrorMessage");
            label.Visible = false;

            //Check if the page has not been posted back
            if (!IsPostBack)
            {
                DateTime today = DateTime.Today;
                DateTime nextDay = today.AddDays(1);

                CultureInfo ci = new CultureInfo("en-US");

                //Fill the RadioButtonList with the 5 following days of the week except Saturday and Sunday
                for (int i = 0; i < 5; i++)
                {
                    ListItem item = new ListItem();

                    if (nextDay.ToString("dddd", ci) == DayOfWeek.Saturday.ToString())
                    {
                        nextDay = nextDay.AddDays(2);
                        item.Text = nextDay.ToString("dddd d MMMM", ci);
                        item.Value = nextDay.ToString("yyyy-MM-dd");
                        RadioButtonList.Items.Add(item);
                    }

                    else if (nextDay.ToString("dddd", ci) == DayOfWeek.Sunday.ToString())
                    {
                        nextDay = nextDay.AddDays(1);
                        item.Text = nextDay.ToString("dddd d MMMM", ci);
                        item.Value = nextDay.ToString("yyyy-MM-dd");
                        RadioButtonList.Items.Add(item);
                    }
                    else
                    {
                        item.Text = nextDay.ToString("dddd d MMMM", ci);
                        item.Value = nextDay.ToString("yyyy-MM-dd");
                        RadioButtonList.Items.Add(item);
                    }
                    nextDay = nextDay.AddDays(1);
                }
            }

            //Else show Available Hours Table located in the Update Panel (AJAX)
            else
            {
                var selectedDate = RadioButtonList.SelectedValue;

                //Check if the patient has already selected a day
                if (selectedDate != "")
                {
                    int rowCtr, cellCtr;
                    TimeSpan time;
                    DateTime date = Convert.ToDateTime(selectedDate);

                    for (rowCtr = -15; rowCtr <= 45; rowCtr = rowCtr + 15)
                    {
                        TableRow tRow = new TableRow();
                        Table.Rows.Add(tRow);

                        for (cellCtr = 8; cellCtr <= 18; cellCtr++)
                        {
                            TableCell tCell = new TableCell();
                            tRow.Cells.Add(tCell);

                            ImageButton btn = new ImageButton();
                            Image img = new Image();
                            img.ImageUrl = "NULL";

                            if (rowCtr == -15)
                            {
                                if (cellCtr != 18)
                                {
                                    img.ImageUrl = "./img/" + cellCtr + ".png";
                                    img.CssClass = "img-hour";
                                }
                                else
                                    img = new Image();
                            }
                            else
                            {
                                if (cellCtr == 18)
                                {
                                    if (rowCtr == 15)
                                        img.ImageUrl = "./img/15'.png";

                                    else
                                    {
                                        img.ImageUrl = "./img/" + rowCtr + ".png";
                                        img.CssClass = "img-hour";
                                    }
                                }
                                else
                                {
                                    time = new TimeSpan(cellCtr, rowCtr, 0);

                                    var query = from a in db.Appointment
                                                where a.Date == date && a.Time == time && a.Status == true
                                                select a;

                                    if (query.Count() <= 0)
                                    {
                                        btn.ImageUrl = "./img/book.png";
                                        btn.Attributes.Add("class", "btn-img");
                                        btn.ID = cellCtr + "-" + rowCtr;

                                        date = date.Date + time;
                                        btn.CommandArgument = date.ToString();
                                        btn.Click += MyBookingBtnHanlder;
                                    }
                                    else
                                    {
                                        img.ImageUrl = "./img/booked.png";
                                        img.Attributes.Add("class", "img-hour");
                                    }
                                }
                            }

                            if (img.ImageUrl != "NULL")
                                tCell.Controls.Add(img);
                            else
                                tCell.Controls.Add(btn);
                        }
                    }
                }
            }
        }
        else
            Response.Redirect("Login.aspx");
    }


    //Method for Booking An Appointment
    public void MyBookingBtnHanlder(object sender, ImageClickEventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        if (authCookie != null)
        {
            //Check if the patient already have any up to date appointment
            if (CheckPendantBookings() == false)
            {
                ImageButton imgbtn = (ImageButton)sender;
                CultureInfo ci = new CultureInfo("en-US");
                DateTime date = Convert.ToDateTime(imgbtn.CommandArgument);

                TimeSpan time = date.TimeOfDay;
                date = date.Date;
                int result = 0;

                try
                {
                    var query = from a in db.Appointment
                                where a.Date == date && a.Time == time && a.Status == true
                                select a;

                    result = query.Count();
                }
                catch (Exception) { }

                //Check if some other patient booked that time before the current patient selected it
                if (result > 0)
                {
                    Label label = (Label)UpdatePanel.FindControl("BookingErrorMessage");
                    label.Text = "Sorry, someone came ahead of you and has booked that time";
                    label.Visible = true;
                }
                //Else book the appointment
                else
                {
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                    //Wait until is safe to enter
                    mutex.WaitOne();

                    try
                    {
                        var patient = (from p in db.Patient
                                       where p.NhsNumber == ticket.Name
                                       select p).First();

                        Appointment appointment = new Appointment
                        {
                            Date = date,
                            Time = time,
                            BookingDateTime = DateTime.Now,
                            Status = true,
                            PatientFk = patient.Id
                        };

                        db.Appointment.InsertOnSubmit(appointment);
                        db.SubmitChanges();
                    }
                    catch(Exception) { }

                    //Release the Mutex
                    mutex.ReleaseMutex();
                    Response.Redirect("PatientPanel.aspx?success=yes");
                }
            }
            //Else if the patient already has a pendant appointment
            else
                Response.Redirect("PatientPanel.aspx?error=yes");
        }
        else
            Response.Redirect("Login.aspx");
    }

    //Auxiliar method to check if the patient has already an appointment booked or not
    protected bool CheckPendantBookings()
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

        try
        {
            var patient = (from p in db.Patient
                           where p.NhsNumber == ticket.Name
                           select p).First();

            var appointment = from a in db.Appointment
                              where a.PatientFk == patient.Id && a.Date >= DateTime.Now && a.Status == true
                              select a;

            if (appointment.Count() <= 0)
                return false;
            else
                return true;
        }
        catch (Exception) {
            return true;
        }
    }
}