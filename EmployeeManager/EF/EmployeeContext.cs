using EmployeeManager.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace EmployeeManager.EF
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext() : base(@"Data Source=(localdb)\mssqllocaldb;Initial Catalog=EmployeeManagement;Integrated Security=True;Connect Timeout=30;")
        {
        }

        public DbSet<Employee> Employees { get; set; }
    }
}