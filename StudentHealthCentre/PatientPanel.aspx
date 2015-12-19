<%@ Page Title="Patient Panel" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PatientPanel.aspx.cs" Inherits="PatientPanel" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="header">
    <!-- Page Title -->
    <asp:Label ID="PageHeader" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="body">
    <div class="col-lg-12 background">
        <div class="patient-panel">

            <!-- Patient Panel Headers -->
            <asp:Label ID="PanelHeader1" runat="server" CssClass="h4" Font-Size="21px"></asp:Label>
            <asp:Label ID="PanelHeader2" runat="server" CssClass="h4" ForeColor="#3F3F3F" Font-Size="20px"></asp:Label>
            <br><br>
            <!-- Page Content -->
            <asp:Label ID="Text1" runat="server" CssClass="col-lg-1 text-panel float" Font-Bold="true"></asp:Label>
            <asp:Label ID="Text2" runat="server" CssClass="col-lg-11 text-panel"></asp:Label>

            <div class="clearfix" style="margin-bottom: 15px"></div>


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <!-- Confirmation Message for Cancelling the Appointment -->
            <asp:Label ID="ConfirmationMessage" runat="server" CssClass="error-message" Text="Do you really want to cancel this appointment?" ForeColor="#E30000" Visible="false"></asp:Label>

            <!-- Book/Cancel Appointment buttons -->
            <asp:LinkButton ID="CancelButton" runat="server" CssClass="btn btn-danger" OnClick="MyCancelBtnHandler" Visible="false">Cancel Appointment</asp:LinkButton>
            <asp:LinkButton ID="BookButton" runat="server" CssClass="btn btn-success" OnClick="MyBookBtnHandler">Book An Appointment</asp:LinkButton>
            <br style="margin-bottom: 35px" />

            <!-- Cancel Appointment Yes/No buttons -->
            <asp:LinkButton ID="Yes" runat="server" CssClass="col-lg-1 btn btn-danger" OnClick="YesHandler" Visible="false">Yes</asp:LinkButton>
            <asp:LinkButton ID="No" runat="server" CssClass="col-lg-1 btn btn-success" Visible="false" OnClick="NoHandler">No</asp:LinkButton>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>