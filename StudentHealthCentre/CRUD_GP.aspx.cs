using System;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class CRUD_GP : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        if (authCookie != null)
        {
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            if (ticket.Name == "000-000-0000")
                PageHeader.Text = string.Format("<h3 class='page-header-lg'>{0}</h3>", "GP CRUD");
            else
                Response.Redirect("Index.aspx");
        }
        else
            Response.Redirect("Login.aspx");
    }


    protected void SqlDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //Change the position of the Insert Button and the HyperLink depending on the Paging Control
        int rowCount = e.AffectedRows;

        //Paging Control is not displayed
        if (rowCount == 0)
        {
            InsertBtn.Visible = false;
        }
        else if (rowCount < 6)
        {
            InsertBtn.Style.Add("margin-top", "-50px !important");

        }
        //Paging Control is displayed
        else
        {
            InsertBtn.Style.Add("margin-top", "-100px !important");
        }
    }


    protected void GridView_RowUpdated(Object sender, GridViewUpdatedEventArgs e)
    {
        //Managing exceptions when updating a row
        if (e.Exception != null)
        {
            Response.Redirect("Crud_GP.aspx");
        }
    }


    protected void GridView_RowDeleted(Object sender, GridViewDeletedEventArgs e)
    {
        //Managing exceptions when updating a row
        if (e.Exception != null)
        {
            Response.Redirect("CRUD_GP.aspx");
        }
    }


    //Insert new GP Method
    protected void MyInsertBtnHandler(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource.InsertParameters["Name"].DefaultValue     = ((TextBox)GridView.FooterRow.FindControl("txtName")).Text;
            SqlDataSource.InsertParameters["Surname"].DefaultValue  = ((TextBox)GridView.FooterRow.FindControl("txtSurname")).Text;
            SqlDataSource.InsertParameters["Status"].DefaultValue   = ((CheckBox)GridView.FooterRow.FindControl("chkStatus")).Checked.ToString();
            SqlDataSource.Insert();
        }
        catch (Exception) {};
    }
}