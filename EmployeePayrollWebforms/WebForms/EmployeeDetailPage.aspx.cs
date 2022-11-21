using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayrollWebforms.WebForms
{
    public partial class EmployeeDetailPage : System.Web.UI.Page
    {
        SqlConnection sqlconnection = new SqlConnection("data source = (localdb)\\MSSQLLocalDB; initial catalog = EmpPayrollWebform; integrated security=true;");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {           
         Response.Redirect("EmployeeForm.aspx");        
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            sqlconnection.Open();
            SqlCommand command = new SqlCommand("delete from EmpPayrollDetails where ID='" + id + "'", sqlconnection);
            int t = command.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Employee detail is Deleted')</script>");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
        }
    }
}