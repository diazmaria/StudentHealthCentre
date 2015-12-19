<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CRUD_Appointment.aspx.cs" Inherits="CRUD_Appointment" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <!-- Custom Validation plugin -->
    <script type="text/javascript" src="js/jquery.customvalidation.js"></script>
</asp:Content>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="header" runat="Server">
    <!-- Page Title -->
    <asp:Label ID="PageHeader" runat="server" CssClass="page-header-lg"></asp:Label>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">
    <asp:Panel ID="AppointmentCRUD" runat="server" CssClass="col-lg-12 background">
        
        <!-- GridView -->
        <asp:GridView ID="GridView" runat="server" OnRowDeleted="GridView_RowDeleted" OnRowUpdated="GridView_RowUpdated" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource" PageSize="5" ShowFooter="True" HorizontalAlign="Center" CssClass="GridViewAppointment">
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

                <%-- Date --%>
                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date", "{0:dd/MM/yyyy}") %>' CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DateRequiredUpdate" runat="server" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Date Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtDate_div" runat="server">
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="DateRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>

                <%-- Time --%>
                <asp:TemplateField HeaderText="Time" SortExpression="Time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Time") %>' CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeRequiredUpdate" runat="server" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                    </ItemTemplate>
                    <%-- Time Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtTime_div" runat="server">
                            <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="TimeRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtTime"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>

                <%-- Booking Date/Time --%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Booking Date/Time" SortExpression="BookingDateTime">
                    <EditItemTemplate>
                        <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("BookingDateTime") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("BookingDateTime") %>'></asp:Label>
                    </ItemTemplate>
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

                <%-- PatientFk --%>
                <asp:TemplateField HeaderText="PatientFk" SortExpression="PatientFk">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PatientFk") %>' Width="70px" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PatientFkRequiredUpdate" runat="server" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("PatientFk") %>'></asp:Label>
                    </ItemTemplate>

                    <%-- PatientFk Footer Template --%>
                    <FooterTemplate>
                        <asp:Panel ID="txtPatientFk_div" runat="server">
                            <asp:TextBox ID="txtPatientFk" runat="server" Width="70px" CssClass="form-control" OnFocus="validationOnFocus(event)" OnBlur="validationOnBlur(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PatientFkRequiredInsert" ValidationGroup="INSERT" runat="server" ControlToValidate="txtPatientFk"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </FooterTemplate>
                </asp:TemplateField>
            
            </Columns>
            <FooterStyle CssClass="GridViewFooter" />
        </asp:GridView>

        <%-- GridView Parameters --%>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHealthCentreConnectionString %>" DeleteCommand="DELETE FROM [Appointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Appointment] ([Date], [Time], [BookingDateTime], [Status], [PatientFk]) VALUES (@Date, @Time, @BookingDateTime, @Status, @PatientFk)" SelectCommand="SELECT * FROM [Appointment] ORDER BY [Status] DESC, [Date] ASC, [Time] ASC" UpdateCommand="UPDATE [Appointment] SET [Date] = @Date, [Time] = @Time, [BookingDateTime] = @BookingDateTime, [Status] = @Status, [PatientFk] = @PatientFk WHERE [Id] = @Id" OnSelected="SqlDataSource_Selected">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter DbType="Time" Name="Time" />
                <asp:Parameter Name="BookingDateTime" Type="DateTime" />
                <asp:Parameter Name="Status" Type="Boolean" />
                <asp:Parameter Name="PatientFk" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter DbType="Time" Name="Time" />
                <asp:Parameter Name="BookingDateTime" Type="DateTime" />
                <asp:Parameter Name="Status" Type="Boolean" />
                <asp:Parameter Name="PatientFk" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- Insert Button -->
        <asp:Panel ID="InsertBtn" runat="server" CssClass="col-lg-1 insertAppointmentButton">
            <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-success" OnClick="MyInsertBtnHandler" ValidationGroup="INSERT">Insert</asp:LinkButton>
        </asp:Panel>

    </asp:Panel>

</asp:Content>