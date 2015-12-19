<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="js/jquery.customvalidation.js"></script>
    <script type="text/javascript" src="js/jquery.maskedinput.js"></script>
    <script>
        function pageLoad() {
            $(<%=nhs.ClientID%>).mask("999-999-9999");
            $(<%=birth.ClientID%>).mask("99 / 99 / 9999");
        }
    </script>
</asp:Content>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="header">
    <!-- Page Title -->
    <asp:Label ID="PageHeader" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="body">
    <!-- Login form -->
    <asp:Panel ID="LoginForm" runat="server" class="col-lg-12 form-horizontal background">

        <!-- Script Manager required for Masked Input plugin-->
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

        <!-- NHS Number Form Group -->
        <asp:Panel ID="nhs_div" runat="server" CssClass="form-group">
            <!-- NHS Number Label -->
            <label class="control-label col-lg-2">NHS Number</label>
            <div class="col-lg-4">
                <!-- NHS Number TextBox -->
                <asp:TextBox ID="nhs" runat="server" CssClass="form-control" Placeholder="NHS Number" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNhs" runat="server" ControlToValidate="nhs"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorNhs" runat="server" ControlToValidate="nhs" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}$"></asp:RegularExpressionValidator>
                <asp:Label ID="nhs_icon" runat="server" CssClass="glyphicon form-control-feedback"></asp:Label>
                <asp:Label ID="nhs_message" runat="server" Text="Invalid NHS Number" CssClass="no_message"></asp:Label><br>
            </div>   
        </asp:Panel>

        <!-- Date Of Birth Form Group-->
         <asp:Panel ID="birth_div" runat="server" CssClass="form-group">
            <!-- Date Of Birth Label -->
            <label class="control-label col-lg-2">Date of birth</label>
                <div class="col-lg-4">
                    <!-- Date Of Birth TextBox -->
                    <asp:TextBox ID="birth" runat="server" CssClass="form-control" Placeholder="Date of birth" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBirth" runat="server" ControlToValidate="birth"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBirth" runat="server" ControlToValidate="birth" ValidationExpression="^\b(0?[1-9]|[12][0-9]|3[01])\s[/]\s(0?[1-9]|1[012])\s[/]\s(19|20)?[0-9]{2}\b$"></asp:RegularExpressionValidator>
                    <asp:Label ID="birth_icon" runat="server" CssClass="glyphicon form-control-feedback"></asp:Label>
                    <asp:Label ID="birth_message" runat="server" Text="Invalid date of birth" CssClass="no_message"></asp:Label><br><br>
                </div>
        </asp:Panel>

        <!-- Login Error Panel -->
        <div class="col-lg-4">
            <asp:Panel ID="LoginErrorPanel" runat="server" CssClass="error-message" Visible="false">
                <asp:Label ID="LoginError" runat="server"></asp:Label>
            </asp:Panel>
        </div>

        <div class="clearfix"></div>

        <!-- Login ImageButton -->
        <asp:ImageButton ID="LoginButton" runat="server" ImageUrl="./img/login.png" OnClick="MyLoginBtnHandler" CssClass="btn-img btn-login" />
       
    </asp:Panel>
</asp:Content>