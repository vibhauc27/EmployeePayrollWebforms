using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayrollWebforms.WebForms
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection sqlconnection = new SqlConnection("data source = (localdb)\\MSSQLLocalDB; initial catalog = EmpPayrollWebform; integrated security=true;");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(TextBox1.Text, TextBox2.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, CheckBox1.Checked);
            }
            else
            {
                Response.Redirect("EmployeeDetailPage.aspx");
                
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
       

        protected bool AuthenticateUser(string Email, string Password)
        {
            SqlCommand command = new SqlCommand("LogInCredentials", this.sqlconnection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter parameterEmail = new SqlParameter("@Email", Email);
            SqlParameter parameterPassword = new SqlParameter("@Password", Password);
            command.Parameters.Add(parameterEmail);
            command.Parameters.Add(parameterPassword);
            this.sqlconnection.Open();
            int ReturnCode = (int)command.ExecuteScalar();
            return ReturnCode == 1;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}