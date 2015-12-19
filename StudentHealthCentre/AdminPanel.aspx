<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="header">
    <asp:Label ID="PageHeader" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="body">
    <div class="col-lg-12 background" style="text-align: center">

        <!-- Welcome to Admin Panel Message -->
        <div style="text-align: center">
             <asp:Label ID="AdminPanelLabel" runat="server" Text="Welcome to the Administration Interface" CssClass="h4" ForeColor="#3F3F3F" Font-Size="22px"></asp:Label>
        </div>

        <br><br>
        <!-- Buttons to manage GPs, Patients and Appointments through a CRUD interface -->
        <asp:LinkButton ID="Patient" runat="server" CssClass="btn btn-success btn-crud" OnClick="MyBtnHandler">Patient CRUD</asp:LinkButton>
        <asp:LinkButton ID="Appointment" runat="server" CssClass="btn btn-success btn-crud" OnClick="MyBtnHandler">Appointment CRUD</asp:LinkButton>
        <asp:LinkButton ID="GP" runat="server" CssClass="btn btn-success btn-crud" OnClick="MyBtnHandler">GP CRUD</asp:LinkButton>
        
        <br style="margin-bottom:80px">
        <!-- Go to the Fordward Page (Admin Panel) Hyperlink -->
        <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/PatientPanel.aspx" ForeColor="#036E4F" CssClass="col-lg-4 col-lg-offset-4 center link">Book An Appointment</asp:HyperLink>


    </div>
</asp:Content>