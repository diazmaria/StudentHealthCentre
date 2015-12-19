<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRUD_GP.aspx.cs" Inherits="CRUD_GP" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <!-- Custom Validation plugin -->
    <script type="text/javascript" src="js/jquery.customvalidation.js"></script>
</asp:Content>
    
<asp:Content ID="HeaderContent" ContentPlaceHolderID="header" runat="Server">
    <!-- Page Title -->
    <asp:Label ID="PageHeader" runat="server" CssClass="page-header-lg"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">
    <asp:Panel ID="GPCRUD" runat="server" CssClass="col-lg-12 background">

        <!-- GridView -->
        <asp:GridView ID="GridView" runat="server" OnRowDeleted="GridView_RowDeleted" OnRowUpdated="GridView_RowUpdated" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" HorizontalAlign="Center" DataSourceID="SqlDataSource" PageSize="5" ShowFooter="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" EditText="Edit" DeleteText="Delete" CancelText="Cancel" UpdateText="Update" ButtonType="Image" EditImageUrl="http://s4.postimg.org/4o4nl7weh/edit.png" UpdateImageUrl="http://s12.postimg.org/cm979m2jt/update.png" CancelImageUrl="http://s27.postimg.org/ctsdwiei7/cancel.png" DeleteImageUrl="http://s30.postimg.org/weli8wiot/delete.png" />
                
                <%-- Id (invisible) --%>
                <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="false">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <%-- Name --%>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:Panel ID="TextBox1_div" runat="server">
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NameRequiredUpdate" runat="server" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Name Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtName_div" runat="server">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NameRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Surname --%>
                <asp:TemplateField HeaderText="Surname" SortExpression="Surname">
                    <EditItemTemplate>
                        <asp:Panel ID="TextBox2_div" runat="server">
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Surname") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="SurnameRequiredUpdate" runat="server" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Surname Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtSurname_div" runat="server">
                            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="SurnameRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtSurname"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Status --%>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <div class="SingleCheckbox">
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' />
                            <asp:Label ID="Labell" AssociatedControlID="CheckBox1" runat="server" CssClass="CheckBox1"></asp:Label>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="SingleCheckbox">
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' />
                            <asp:Label ID="Labelll" AssociatedControlID="CheckBox1" runat="server" CssClass="unable"></asp:Label>
                        </div>
                    </ItemTemplate>
                    <%-- Status Footer Template --%>
                    <FooterTemplate>
                        <div class="SingleCheckbox">
                            <asp:CheckBox ID="chkStatus" runat="server" Checked="true"></asp:CheckBox>
                            <asp:Label ID="Labell" AssociatedControlID="chkStatus" runat="server" CssClass="CheckBox1"></asp:Label>
                        </div>
                    </FooterTemplate>
                </asp:TemplateField>

            </Columns>
            <EditRowStyle Wrap="True" />
            <FooterStyle CssClass="GridViewFooter" />
        </asp:GridView>

        <%-- GridView Parameters --%>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHealthCentreConnectionString %>" DeleteCommand="DELETE FROM [GP] WHERE [Id] = @Id" InsertCommand="INSERT INTO [GP] ([Name], [Surname], [Status]) VALUES (@Name, @Surname, @Status)" SelectCommand="SELECT * FROM [GP]" UpdateCommand="UPDATE [GP] SET [Name] = @Name, [Surname] = @Surname, [Status] = @Status WHERE [Id] = @Id" OnSelected="SqlDataSource_Selected">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="Status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="Status" Type="Boolean" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- Insert Button -->
        <asp:Panel ID="InsertBtn" runat="server" CssClass="col-lg-1 insertGPButton">
            <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-success" OnClick="MyInsertBtnHandler" ValidationGroup="INSERT">Insert</asp:LinkButton>
        </asp:Panel>

    </asp:Panel>

</asp:Content>