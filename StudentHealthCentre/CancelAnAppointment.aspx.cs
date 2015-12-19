using System;
using System.Linq;
using System.Web;
using System.Web.Security;

public partial class CancelAnAppointment : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        if (authCookie != null)
        {
            //Check if the patient confirmed the cancelling in Patient Panel
            if (Request.QueryString["cancel"] != null)
            {
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                //Cancel the Appointment (Update Appointment Status to False)
                try
                {
                    var patient = (from p in db.Patient
                                   where p.NhsNumber == ticket.Name
                                   select p).First();

                    var appointment = (from a in db.Appointment
                                       where a.PatientFk == patient.Id && a.Date >= DateTime.Now && a.Status == true
                                       select a).First();

                    appointment.Status = false;

                    db.SubmitChanges();
                }
                catch (Exception)
                {
                    Response.Redirect("PatientPanel.aspx");
                }

                Response.Redirect("PatientPanel.aspx");
            }
            else
                Response.Redirect("PatientPanel.aspx");
        }
        else
            Response.Redirect("Login.aspx");
    }
}