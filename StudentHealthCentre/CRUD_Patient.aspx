<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRUD_Patient.aspx.cs" Inherits="CRUD_Patient" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <!-- Custom Validation plugin -->
    <script type="text/javascript" src="js/jquery.customvalidation.js"></script>
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="header" runat="Server">
    <!-- Page Title -->
    <asp:Label ID="PageHeader" runat="server" CssClass="page-header-lg"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">

    <asp:Panel ID="PatientCRUD" runat="server" CssClass="col-lg-12 background">
        <asp:GridView ID="GridView" runat="server" OnRowUpdated="GridView_RowUpdated" OnRowDeleted="GridView_RowDeleted" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource" PageSize="4" ShowFooter="True" CssClass="GridViewPatient">
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

                <%-- NHS Number --%>
                <asp:TemplateField HeaderText="NHS Number" SortExpression="NhsNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NhsNumber") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NhsNumber") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- NHS Number Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtNhsNumber_div" runat="server">
                            <asp:TextBox ID="txtNhsNumber" runat="server" Font-Size="14px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NhsRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtNhsNumber"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Name --%>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>

                    <%-- Name Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtName_div" runat="server">
                            <asp:TextBox ID="txtName" runat="server" Font-Size="14px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NameRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Surname --%>
                <asp:TemplateField HeaderText="Surname" SortExpression="Surname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Surname") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Surname Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtSurname_div" runat="server">
                            <asp:TextBox ID="txtSurname" runat="server" Font-Size="14px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="SurnameRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtSurname"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Date Of Birth --%>
                <asp:TemplateField HeaderText="Date Of Birth" SortExpression="DateOfBirth">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DateOfBirth", "{0:dd/MM/yyyy}") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DateOfBirth", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Date Of Birth Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtBirth_div" runat="server">
                            <asp:TextBox ID="txtBirth" runat="server" Font-Size="14px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="BirthRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtBirth"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Address --%>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Address") %>' Width="150px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Address Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtAddress_div" runat="server">
                            <asp:TextBox ID="txtAddress" runat="server" Font-Size="14px" Width="150px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AddressRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Telephone --%>
                <asp:TemplateField HeaderText="Telephone" SortExpression="Telephone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Telephone") %>' CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Telephone Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtTelephone_div" runat="server">
                            <asp:TextBox ID="txtTelephone" runat="server" Font-Size="14px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="TelephoneRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtTelephone"></asp:RequiredFieldValidator>
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

                <%-- GPFk --%>
                <asp:TemplateField HeaderText="GPFk" SortExpression="GPFk">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("GPFk") %>' Width="40px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("GPFk") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- GPFk Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtGPFk_div" runat="server">
                            <asp:TextBox ID="txtGPFk" runat="server" Width="40px" Font-Size="14px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="GPFkRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtGPFk"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle CssClass="GridViewFooter" />

        </asp:GridView>

        <!-- GridView Parameters -->
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHealthCentreConnectionString %>" DeleteCommand="DELETE FROM [Patient] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Patient] ([NhsNumber], [Name], [Surname], [DateOfBirth], [Address], [Telephone], [Status], [GPFk]) VALUES (@NhsNumber, @Name, @Surname, @DateOfBirth, @Address, @Telephone, @Status, @GPFk)" SelectCommand="SELECT * FROM [Patient] ORDER BY [Name]" UpdateCommand="UPDATE [Patient] SET [NhsNumber] = @NhsNumber, [Name] = @Name, [Surname] = @Surname, [DateOfBirth] = @DateOfBirth, [Address] = @Address, [Telephone] = @Telephone, [Status] = @Status, [GPFk] = @GPFk WHERE [Id] = @Id" OnSelected="SqlDataSource_Selected">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NhsNumber" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfBirth" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="Status" Type="Boolean" />
                <asp:Parameter Name="GPFk" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NhsNumber" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfBirth" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="Status" Type="Boolean" />
                <asp:Parameter Name="GPFk" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- Insert Button -->
        <asp:Panel ID="InsertBtn" runat="server" CssClass="col-lg-1 insertPatientButton">
            <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-success" OnClick="MyInsertBtnHandler" ValidationGroup="INSERT">Insert</asp:LinkButton>
        </asp:Panel>

    </asp:Panel>

</asp:Content>