using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "add")
            {

                string titlu = ((TextBox)GridView1.FooterRow.FindControl("tbf_titlu")).Text;
                string autor = ((TextBox)GridView1.FooterRow.FindControl("tbf_autor")).Text;
                string gen = ((TextBox)GridView1.FooterRow.FindControl("tbf_gen")).Text;
                int pret = int.Parse(((TextBox)GridView1.FooterRow.FindControl("tbf_pret")).Text);
                int anPublicare = int.Parse(((TextBox)GridView1.FooterRow.FindControl("tbf_an")).Text);

                
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["bd_adaConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("AdaugaCarte", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@titlu", SqlDbType.Char,100).Value=titlu;
                cmd.Parameters.Add("@autor", SqlDbType.Char,30).Value=autor;
                cmd.Parameters.Add("@gen", SqlDbType.Char,20).Value=gen;
                cmd.Parameters.Add("@pret", SqlDbType.Int).Value=pret;
                cmd.Parameters.Add("@anPublicare", SqlDbType.Int).Value=anPublicare;


                try
                {
                    cmd.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                     msj.Text = "alert('" + ex.Message + "')";

                }
                finally
                {
                    conn.Close();
                    GridView1.DataBind();


                    ((TextBox)GridView1.FooterRow.FindControl("tbf_titlu")).Text = string.Empty;
                    ((TextBox)GridView1.FooterRow.FindControl("tbf_autor")).Text = string.Empty;
                    ((TextBox)GridView1.FooterRow.FindControl("tbf_gen")).Text = string.Empty;
                    (((TextBox)GridView1.FooterRow.FindControl("tbf_pret")).Text) = string.Empty;
                    ((TextBox)GridView1.FooterRow.FindControl("tbf_an")).Text = string.Empty;
                }

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int idCarte = Convert.ToInt32(DropDownList1.SelectedValue);
            int idUser = Convert.ToInt32(DropDownList2.SelectedValue);
            int rating = Convert.ToInt32(tbRating.Text);
            string comentariu = tbCom.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["bd_adaConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Reviews (idCarte, idUser, rating, comentariu) VALUES (@idCarte, @idUser, @rating, @comentariu)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@idCarte", idCarte);
                    cmd.Parameters.AddWithValue("@idUser", idUser);
                    cmd.Parameters.AddWithValue("@rating", rating);
                    cmd.Parameters.AddWithValue("@comentariu", comentariu);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    msj.Text = "S-a adaugat o noua recenzie!";
                    tbCom.Text = "";
                    tbRating.Text = "";
                }
            }
        }
    }
}