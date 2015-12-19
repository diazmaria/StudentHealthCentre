using System;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class CRUD_Patient : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

        if (authCookie != null)
        {
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            if (ticket.Name == "000-000-0000")
                PageHeader.Text = string.Format("<h3 class='page-header-lg'>{0}</h3>", "Patient CRUD");
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
            Response.Redirect("CRUD_Patient.aspx");
        }
    }

    protected void GridView_RowDeleted(Object sender, GridViewDeletedEventArgs e)
    {
        //Managing exceptions when updating a row
        if (e.Exception != null)
        {
            Response.Redirect("CRUD_Patient.aspx");
        }
    }


    //Insert new Patient Method
    protected void MyInsertBtnHandler(object sender, EventArgs e)
        {
        try {
            SqlDataSource.InsertParameters["NhsNumber"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtNhsNumber")).Text;
            SqlDataSource.InsertParameters["Name"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtName")).Text;
            SqlDataSource.InsertParameters["Surname"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtSurname")).Text;
            SqlDataSource.InsertParameters["DateOfBirth"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtBirth")).Text;
            SqlDataSource.InsertParameters["Telephone"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtTelephone")).Text;
            SqlDataSource.InsertParameters["Address"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtAddress")).Text;
            SqlDataSource.InsertParameters["Status"].DefaultValue = ((CheckBox)GridView.FooterRow.FindControl("chkStatus")).Checked.ToString();
            SqlDataSource.InsertParameters["GPFk"].DefaultValue = ((TextBox)GridView.FooterRow.FindControl("txtGPFk")).Text;
            SqlDataSource.Insert();
        }
        catch(Exception) {}
    }
}