<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookAnAppointment.aspx.cs" Inherits="BookAnAppointment" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="header">
    <!-- Page Title -->
    <asp:Label ID="PageHeader" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">

    <!-- Days of the following week RadioButtonList -->
    <asp:Panel ID="days_div" runat="server" cssclass="col-lg-4 background">
        <div class="ListControl">
            <asp:RadioButtonList ID="RadioButtonList" runat="server"></asp:RadioButtonList>
        </div>
    </asp:Panel>

    <!-- Update Panel -->
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <asp:Updatepanel ID="UpdatePanel" runat="server"> 
        <ContentTemplate>

            <!-- Available Hours Table -->
            <div class="col-lg-8 background">
                <asp:Panel ID="HoursPanel" runat="server" CssClass="hourspanel">   
                    <asp:Table ID="Table" runat="server"></asp:Table>
                </asp:Panel>
            </div>

            <!-- Check Available Hours LinkButton -->
            <asp:Panel ID="PanelContinue" runat="server" CssClass="col-lg-3 CheckButtonPanel">   
                <asp:LinkButton ID="Check" runat="server" CssClass="btn btn-success btn-check">Check</asp:LinkButton>
            </asp:Panel>

             <!-- Booking Error Message -->
             <div class="col-lg-9 center CheckButtonPanel">
                <asp:Label ID="BookingErrorMessage" runat="server" Class="error-message" Visible="false"></asp:Label>
             </div>

            <div class="clearfix"></div>

        </ContentTemplate>
    </asp:Updatepanel>

</asp:Content>