using System;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;

public partial class PatientPanel : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        //Check if the patient is logged in
        if (authCookie != null)
        {
            PageHeader.Text = string.Format("<h3 class='page-header-lg'>{0}</h3>", "Patient Panel");

            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            try
            {
                //Check if the patient has any pendant appointment
                var patient = (from p in db.Patient
                               where p.NhsNumber == ticket.Name
                               select p).First();

                var appointment = (from a in db.Appointment
                                   where a.PatientFk == patient.Id && a.Date >= DateTime.Now && a.Status == true
                                   select a);

                //Check if the patient has a pendant appointment
                if (appointment.Any())
                {
                    var a = appointment.First();

                    //Check if the patient appointment is up to date
                    if ((a.Date == DateTime.Now && a.Time > DateTime.Now.TimeOfDay && a.Status == true) || (DateTime.Now < a.Date && a.Status == true))
                    {
                        CultureInfo ci = new CultureInfo("en-US");

                        //Check if the patient has just booked the appointment
                        if (Request.QueryString["success"] != null)
                        {
                            PanelHeader1.Text = "Your Appointment has been succesfully booked!<br><br>";
                            PanelHeader1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00b160");
                        }
                        //Else check if the patient tried to book more than one appointment
                        else if (Request.QueryString["error"] != null)
                        {
                            PanelHeader1.Text = "Sorry, you are not allowed to book more than one appointment!<br><br>";
                            PanelHeader1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F54E4E");
                        }

                        //Show the appointment details
                        PanelHeader2.Text = "You have a pendant appointment for";
                        Text1.Text = "<p>Date</p> <p>Time</p> <p>Dotor</p>";
                        Text2.Text = "<p>" + a.Date.ToString("dddd d MMMM", ci) + "</p><p>" + a.Time.ToString(@"hh\:mm") + "</p><p>" + patient.GP.Name + " " + patient.GP.Surname + "</p>";
                    }

                    CancelButton.Visible = true;
                }
                //Else the patient does not have any pendant appointment
                else
                {
                    CultureInfo ci = new CultureInfo("en-US");
                    PanelHeader1.Text = "You can now book an Appointment with your GP";
                    Text1.Text = "<p>Dotor</p>";
                    Text2.Text = "<p> " + patient.GP.Name + " " + patient.GP.Surname + "</p>";
                }
            }
            catch (Exception) {}
        }
        else Response.Redirect("Login.aspx");
    }



    protected void MyBookBtnHandler(object sender, EventArgs e)
    {
        //Redirect to Book An Appointment
        Response.Redirect("BookAnAppointment.aspx");
    }


    protected void MyCancelBtnHandler(object sender, EventArgs e)
    {
        //Show confirmation message before cancelling the appointment
        ConfirmationMessage.Visible = true;

        Yes.Visible = true;
        No.Visible = true;

        CancelButton.Visible = false;
        BookButton.Visible = false;
    }


    protected void YesHandler(object sender, EventArgs e)
    {
        Response.Redirect("CancelAnAppointment.aspx?cancel=yes");
    }


    protected void NoHandler(object sender, EventArgs e)
    {
        No.Visible = false;
        Yes.Visible = false;
        ConfirmationMessage.Visible = false;
        BookButton.Visible = true;
    }
}