using System;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MyPatientPanelBtnHandler(object sender, EventArgs e) {

        //Redirect to the login page
        Response.Redirect("Login.aspx");
    }
}