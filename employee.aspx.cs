using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Employee_CRUD
{
	public partial class employee : System.Web.UI.Page
	{
		static string SqlConnection = "data source=DESKTOP-IKP0E8K\\SQLEXPRESS;initial catalog=employee_126;integrated security=true;";

		SqlConnection con = new SqlConnection(SqlConnection);
		protected void Page_Load(object sender, EventArgs e)
		{
			ShowData();


        }

		//Showing Data on WebSite

		public void ShowData()
		{
			con.Open();
			string SqlQuery = $"select * from employee";
			SqlCommand cmd = new SqlCommand(SqlQuery, con);
			SqlDataAdapter sda = new SqlDataAdapter(cmd);
			DataTable dt = new DataTable();

			sda.Fill(dt);

			con.Close();
			// binding with Grid View
			GridViewEmp.DataSource = dt;
			GridViewEmp.DataBind();

		}

		//clearing the data
		public void ClearData()
		{
			txtempname.Text = "";
			txtempage.Text = "";
			txtempmail.Text = "";
			txtemppass.Text = "";
			txtempphone.Text = "";
		}

		// Inserting Data into database
        protected void btnsubmit_Click(object sender, EventArgs e)
		{

			if (btnsubmit.Text == "Save")
			{

				string SqlQuery = $"insert into employee(emp_name,emp_age,emp_email,emp_pass,emp_phone) values('{txtempname.Text}','{txtempage.Text}','{txtempmail.Text}','{txtemppass.Text}','{txtempphone.Text}')";

				con.Open();
				SqlCommand cmd = new SqlCommand(SqlQuery, con);
				cmd.ExecuteNonQuery();

				con.Close();

				// after inserting the data, the data will be shown on display
				ShowData();

				ClearData();

			}



			else if (btnsubmit.Text == "Update")
			{

				string SqlQuery = $"update employee set emp_name='{txtempname.Text}',emp_age='{txtempage.Text}', emp_email='{txtempmail.Text}', emp_pass='{txtemppass.Text}', emp_phone='{txtempphone.Text}' where emp_id={ViewState["Global"]}";

				con.Open();
				SqlCommand cmd = new SqlCommand(SqlQuery, con);
				cmd.ExecuteNonQuery();
				con.Close();

				//showdata after updation
				ShowData();

                ClearData();

				btnsubmit.Text = "Save";

            }




		}

		protected void GridViewEmp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
			if(e.CommandName== "remove")
			{

                string SqlQuery = $"delete from employee where emp_id='{e.CommandArgument}'";

                con.Open();
                SqlCommand cmd = new SqlCommand(SqlQuery, con);
                cmd.ExecuteNonQuery();

				con.Close();


            }

			else if (e.CommandName == "omit")
			{
                string SqlQuery = $"select * from employee where emp_id='{e.CommandArgument}'";

                con.Open();
                SqlCommand cmd = new SqlCommand(SqlQuery, con);
				SqlDataAdapter sda = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				sda.Fill(dt);
				con.Close();

                txtempname.Text = dt.Rows[0]["emp_name"].ToString();
                txtempage.Text = dt.Rows[0]["emp_age"].ToString();
				txtempmail.Text = dt.Rows[0]["emp_email"].ToString();
				txtemppass.Text = dt.Rows[0]["emp_pass"].ToString();
				txtempphone.Text = dt.Rows[0]["emp_phone"].ToString();



				btnsubmit.Text = "Update";

				ViewState["Global"] = e.CommandArgument;


            }

			// after Deleting the data, the data will be shown on display
			ShowData();


        }
    }
}