using EmployeeManager.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmployeeManager.Models;

namespace EmployeeManager
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        private EmployeeContext db = new EmployeeContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string searchQuery = null)
        {
            var employees = db.Employees.AsQueryable();

            if (!string.IsNullOrEmpty(searchQuery))
            {
                employees = employees.Where(emp => emp.FirstName.Contains(searchQuery) || 
                                                   emp.LastName.Contains(searchQuery) || 
                                                   emp.Email.Contains(searchQuery));
            }

            var data = employees.ToList();
            GridViewEmployees.DataSource = data;
            GridViewEmployees.DataBind();
        }

        protected void GridViewEmployees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewEmployees.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridViewEmployees_CancelEditing(object sender, GridViewCancelEditEventArgs e)
        {
            // Rebind the GridView to refresh the data
            GridViewEmployees.EditIndex = -1;
            BindGrid();
        }

        protected void GridViewEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieve the EmployeeID from the DataKey
            int employeeId = Convert.ToInt32(GridViewEmployees.DataKeys[e.RowIndex].Value);

            // Find the row being edited
            GridViewRow row = GridViewEmployees.Rows[e.RowIndex];

            // Extract values from the textboxes
            string firstName = (row.FindControl("TextBoxFirstName") as TextBox).Text;
            string lastName = (row.FindControl("TextBoxLastName") as TextBox).Text;
            string email = (row.FindControl("TextBoxEmail") as TextBox).Text;
            string phone = (row.FindControl("TextBoxPhone") as TextBox).Text;
            DateTime hireDate = Convert.ToDateTime((row.FindControl("TextBoxHireDate") as TextBox).Text);

            // Update the employee in the database
            using (var context = new EmployeeContext())
            {
                var employee = context.Employees.Find(employeeId);
                if (employee != null)
                {
                    employee.FirstName = firstName;
                    employee.LastName = lastName;
                    employee.Email = email;
                    employee.Phone = phone;
                    employee.HireDate = hireDate;

                    context.SaveChanges();
                }
            }

            // Exit edit mode and rebind data
            GridViewEmployees.EditIndex = -1;
            BindGrid();
        }

        protected void GridViewEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int employeeId = Convert.ToInt32(GridViewEmployees.DataKeys[e.RowIndex].Value);
            var employee = db.Employees.Find(employeeId);
            if(employee == null) return;
            db.Employees.Remove(employee);
            db.SaveChanges();
            BindGrid();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            BindGrid(searchQuery);
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            BindGrid();
        }
    }
}