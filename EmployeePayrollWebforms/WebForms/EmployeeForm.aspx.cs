using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayrollWebforms.WebForms
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        SqlConnection sqlconnection = new SqlConnection("data source = (localdb)\\MSSQLLocalDB; initial catalog = EmpPayrollWebform; integrated security=true;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Fill Years
                for (int i = 2014; i <= 2022; i++)
                {
                    ddlYear.Items.Add(i.ToString());
                }
                ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;  //set current year as selected

                //Fill Months
                for (int i = 1; i <= 12; i++)
                {
                    ddlMonth.Items.Add(i.ToString());
                }
                ddlMonth.Items.FindByValue(System.DateTime.Now.Month.ToString()).Selected = true; // Set current month as selected

                //Fill days
                FillDays();
            }
        }
        public void FillDays()
        {
            ddlDay.Items.Clear();
            //getting numbner of days in selected month & year
            int noOfDays = DateTime.DaysInMonth(Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue));

            //Fill days
            for (int i = 1; i <= noOfDays; i++)
            {
                ddlDay.Items.Add(i.ToString());
            }
            ddlDay.Items.FindByValue(System.DateTime.Now.Day.ToString()).Selected = true;// Set current date as selected
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("EmployeePayrollCredential", sqlconnection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@NAME", TextBox1.Text);
            command.Parameters.AddWithValue("@IMG", RadioButtonList1.SelectedValue);
            command.Parameters.AddWithValue("@GENDER", RadioButtonList2.SelectedValue);
            string checkList = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    if (checkList == "")
                    {
                        checkList = CheckBoxList1.Items[i].Value;
                    }
                    else
                    {
                        checkList += " " + CheckBoxList1.Items[i].Value;
                    }
                }
            }
            command.Parameters.AddWithValue("@DEPARTMENT", checkList);
            command.Parameters.AddWithValue("@SALARY", DropDownList1.SelectedValue);
            command.Parameters.AddWithValue("@START_DATE", ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue);
            command.Parameters.AddWithValue("@NOTES", TextBox2.Text);
            sqlconnection.Open();
            var datareader = command.ExecuteReader();

            Session["data"] = datareader;
            Response.Redirect("EmployeeDetailPage.aspx");

            sqlconnection.Close();

        }
        
    }
}