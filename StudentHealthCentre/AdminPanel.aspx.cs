using System;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class AdminPanel : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        if(authCookie != null)
        {
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            if (ticket.Name == "000-000-0000")
                PageHeader.Text = string.Format("<h3 class='page-header-lg'>{0}</h3>", "Administration Panel");
            else
                Response.Redirect("Index.aspx");
        }
        else
            Response.Redirect("Login.aspx");
    }


    protected void MyBtnHandler(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        switch (btn.ID)
        {
            case "GP":
                Response.Redirect("CRUD_GP.aspx");
                break;

            case "Patient":
                Response.Redirect("CRUD_Patient.aspx");
                break;

            case "Appointment":
                Response.Redirect("CRUD_Appointment.aspx");
                break;
        }
    }
}