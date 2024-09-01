<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="EmployeeManager.EmployeeForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div  class="container mt-4">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="mb-4">Employee Form</h2>

                <div class="form-group">
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name:" CssClass="control-label" />
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name:" CssClass="control-label" />
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="control-label" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ValidationExpression="\w+@\w+\.\w+" CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone:" CssClass="control-label" />
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblHireDate" runat="server" Text="Hire Date:" CssClass="control-label" />
                    <asp:TextBox ID="txtHireDate" runat="server" TextMode="Date" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvHireDate" runat="server" ControlToValidate="txtHireDate" ErrorMessage="Hire Date is required" CssClass="text-danger" />
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary ml-2" PostBackUrl="~/EmployeeList.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
