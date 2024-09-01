using EmployeeManager.EF;
using EmployeeManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManager
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        private EmployeeContext db = new EmployeeContext();
        private int? EmployeeID => string.IsNullOrEmpty(Request.QueryString["id"]) ? (int?)null : int.Parse(Request.QueryString["id"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (EmployeeID.HasValue)
                {
                    LoadEmployeeData();
                }
            }
        }

        private void LoadEmployeeData()
        {
            var employee = db.Employees.Find(EmployeeID);
            if (employee != null)
            {
                txtFirstName.Text = employee.FirstName;
                txtLastName.Text = employee.LastName;
                txtEmail.Text = employee.Email;
                txtPhone.Text = employee.Phone;
                txtHireDate.Text = employee.HireDate.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Employee employee;
            if (EmployeeID.HasValue)
            {
                employee = db.Employees.Find(EmployeeID);
            }
            else
            {
                employee = new Employee();
                db.Employees.Add(employee);
            }

            employee.FirstName = txtFirstName.Text;
            employee.LastName = txtLastName.Text;
            employee.Email = txtEmail.Text;
            employee.Phone = txtPhone.Text;
            employee.HireDate = DateTime.Parse(txtHireDate.Text);

            db.SaveChanges();
            Response.Redirect("EmployeeList.aspx");
        }
    }
}