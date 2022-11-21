using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayrollWebforms.WebForms
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection sqlconnection = new SqlConnection("data source = (localdb)\\MSSQLLocalDB; initial catalog = EmpPayrollWebform; integrated security=true;");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked)
            {
                TextBox4.TextMode = TextBoxMode.SingleLine;
                TextBox5.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                TextBox4.TextMode = TextBoxMode.Password;
                TextBox5.TextMode = TextBoxMode.Password;
            }
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("SignUpDetails", this.sqlconnection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@FirstName", TextBox2.Text);
            command.Parameters.AddWithValue("@LastName", TextBox3.Text);
            command.Parameters.AddWithValue("@Email", TextBox1.Text);
            command.Parameters.AddWithValue("@Phone", TextBox6.Text);
            command.Parameters.AddWithValue("@Password", TextBox4.Text);
            this.sqlconnection.Open();
            int ReturnCode = (int)command.ExecuteScalar();

            Response.Redirect("Login.aspx");
            
            this.sqlconnection.Close();
        }


    }
}
