<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="EmployeeManager.EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mb-4">Employee List</h2>

                <!-- Filter/Search Form -->
                <div class="form-inline mb-4">
                    <div class="form-group mr-2 mb-2">
                        <asp:Label ID="lblSearch" runat="server" Text="Search by Name or Email:" CssClass="mr-2" />
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" />
                    </div>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mr-2" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClearSearch" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClearSearch_Click" />
                </div>

                <!-- Employee GridView -->
                <asp:GridView ID="GridViewEmployees" runat="server" AutoGenerateColumns="false" DataKeyNames="EmployeeID"
                    CssClass="table table-striped table-bordered"
                    OnRowEditing="GridViewEmployees_RowEditing"
                    OnRowUpdating="GridViewEmployees_RowUpdating"
                    OnRowCancelingEdit="GridViewEmployees_CancelEditing"
                    OnRowDeleting="GridViewEmployees_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxLastName" runat="server" Text='<%# Bind("LastName") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelLastName" runat="server" Text='<%# Bind("LastName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelEmail" runat="server" Text='<%# Bind("Email") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxPhone" runat="server" Text='<%# Bind("Phone") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelPhone" runat="server" Text='<%# Bind("Phone") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hire Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxHireDate" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelHireDate" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>

                <asp:Button ID="btnAddNewEmployee" runat="server" Text="Add New Employee" CssClass="btn btn-success mt-3" PostBackUrl="~/EmployeeForm.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
