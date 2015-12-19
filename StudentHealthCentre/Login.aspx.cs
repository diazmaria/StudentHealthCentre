using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;

public partial class Login : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        //If patient is not authenticated then show login form
        if (authCookie == null)
        {
            PageHeader.Text = string.Format("<h3 class='page-header-lg'>{0}</h3>", "Login");
            nhs_div.Visible = true;
            birth_div.Visible = true;
        }
        //Else redirect patient to Patient Panel
        else
        {
            Response.Redirect("PatientPanel.aspx");
        } 
    }

    protected void MyLoginBtnHandler(object sender, EventArgs e)
    {
        //Check RequiredFieldValidators and RegularExpressionValidators
        if (Page.IsValid)
        {
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

            //If patient is not logged in then check if the credentials entered are correct
            if (authCookie == null)
            {
                DateTime dt = Convert.ToDateTime(birth.Text);

                try
                {
                    var query = from p in db.Patient
                                where p.NhsNumber == nhs.Text && p.DateOfBirth == dt && p.Status == true
                                select p;

                    //If the patient exists then set AuthCookie 
                    if (query.Count() > 0)
                    {
                        FormsAuthentication.SetAuthCookie(nhs.Text, false);
                        HttpCookie myCookie = FormsAuthentication.GetAuthCookie(nhs.Text, false);
                        myCookie.Expires = DateTime.Now.AddMinutes(45.0);
                        myCookie.Path = "/";
                        HttpContext.Current.Response.Cookies.Add(myCookie);

                        authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

                        if (ticket.Name == "000-000-0000")
                            Response.Redirect("AdminPanel.aspx");
                        else
                            Response.Redirect("PatientPanel.aspx");
                    }
                    //Else show login error message
                    else
                    {
                        LoginErrorPanel.Visible = true;
                        LoginError.Text = "Sorry, the data entered does not match any registered patient";
                    }
                }
                catch (Exception)
                {
                    LoginError.Text = "Sorry, error while tried to login. Try it later.";
                }
            }
        }
    }
}