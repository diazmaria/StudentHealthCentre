using System;
using System.Web;
using System.Web.Security;
using System.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        //If the user is logged in then show her/his patient info and the logout button
        if (authCookie != null)
        {
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            try{
                var query = (from p in db.Patient
                             where p.NhsNumber == ticket.Name
                             select p).First();

                LogoutButton.Visible = true;
                PatientLabel.Visible = true;

                //Check if the user is the administrator
                if (ticket.Name == "000-000-0000")
                {
                    query.Name = "Administrator";
                    query.Surname = "";
                    HyperLink.Visible = true;
                }
                //Display Patient Name and NHS Number
                PatientLabel.Text = "<strong>Patient:</strong>&nbsp" + query.Name + " " + query.Surname + "&nbsp&nbsp&nbsp" + "<strong>NHS Number:</strong>&nbsp" + ticket.Name;
            }
            catch (Exception) { }
        }
    }

    protected void MyBtnHandler(object sender, EventArgs e)
    {
        //SingOut
        FormsAuthentication.SignOut();
        Session.Abandon();

        //Clear Authentication Cookie
        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        authCookie.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(authCookie);

        Response.Redirect("Index.aspx");
    }
}