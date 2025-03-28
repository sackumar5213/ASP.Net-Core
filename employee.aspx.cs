﻿using System;
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
			//string SqlQuery = $"select * from employee";

			//with sql procedure
			string SqlQuery = "EMPLOYEE_PROCEDURE";

            SqlCommand cmd = new SqlCommand(SqlQuery, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "showData");
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
				// with Sql Query
				//string SqlQuery = $"insert into employee(emp_name,emp_age,emp_email,emp_pass,emp_phone) values('{txtempname.Text}','{txtempage.Text}','{txtempmail.Text}','{txtemppass.Text}','{txtempphone.Text}')";

				// with SQL Procedure
				string SqlQuery = "EMPLOYEE_PROCEDURE";

                con.Open();
				SqlCommand cmd = new SqlCommand(SqlQuery, con);
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insertData");
                cmd.Parameters.AddWithValue("@name", txtempname.Text);
				cmd.Parameters.AddWithValue("@email", txtempmail.Text);
				cmd.Parameters.AddWithValue("@pass", txtemppass.Text);
				cmd.Parameters.AddWithValue("@phone", txtempphone.Text);
				cmd.Parameters.AddWithValue("@age", txtempage.Text);
				cmd.ExecuteNonQuery();

				con.Close();

				// after inserting the data, the data will be shown on display
				ShowData();

				ClearData();

			}



			else if (btnsubmit.Text == "Update")
			{
				// with SQL Query
				//string SqlQuery = $"update employee set emp_name='{txtempname.Text}',emp_age='{txtempage.Text}', emp_email='{txtempmail.Text}', emp_pass='{txtemppass.Text}', emp_phone='{txtempphone.Text}' where emp_id={ViewState["Global"]}";

				//SQL Procedure
				string SqlQuery = "EMPLOYEE_PROCEDURE";


                con.Open();
				SqlCommand cmd = new SqlCommand(SqlQuery, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "updateData");
                cmd.Parameters.AddWithValue("@name", txtempname.Text);
                cmd.Parameters.AddWithValue("@email", txtempmail.Text);
                cmd.Parameters.AddWithValue("@pass", txtemppass.Text);
                cmd.Parameters.AddWithValue("@phone", txtempphone.Text);
                cmd.Parameters.AddWithValue("@age", txtempage.Text);
                cmd.Parameters.AddWithValue("@command_argument", ViewState["Global"]);

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
				// with SQL Query
				//string SqlQuery = $"delete from employee where emp_id='{e.CommandArgument}'";

				// With SQL Procedure
				string SqlQuery = "EMPLOYEE_PROCEDURE";
                con.Open();
                SqlCommand cmd = new SqlCommand(SqlQuery, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "deleteData");
                cmd.Parameters.AddWithValue("@command_argument", e.CommandArgument);

                cmd.ExecuteNonQuery();

				con.Close();


            }

			else if (e.CommandName == "omit")
			{
                // with SQL Query
                //string SqlQuery = $"select * from employee where emp_id='{e.CommandArgument}'";

                // With SQL Procedure
                string SqlQuery = "EMPLOYEE_PROCEDURE";
                con.Open();
                SqlCommand cmd = new SqlCommand(SqlQuery, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "editData");
                cmd.Parameters.AddWithValue("@command_argument", e.CommandArgument);
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

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
			//with SQL Query
            string SqlQuery = $"select * from employee where emp_name like '{txtSearch.Text}%'";


            con.Open();
            SqlCommand cmd = new SqlCommand(SqlQuery, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            sda.Fill(dt);

            con.Close();
            // binding with Grid View
            GridViewEmp.DataSource = dt;
            GridViewEmp.DataBind();

        }
    }
}