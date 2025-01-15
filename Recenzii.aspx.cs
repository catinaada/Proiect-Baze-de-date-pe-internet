using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Recenzii : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRating_Click(object sender, EventArgs e)
        {
            tb_mesaj.Text = "";
            int rating ;
            if (!int.TryParse(tb_prag.Text, out rating))
            {
                // Tratează cazul în care valoarea introdusă nu este un număr întreg valid
                tb_mesaj.Text = "Va rugam sa introduceti un rating valid (numar intreg).";
                return;
            }
            else
            {
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-0VLD95I;Initial Catalog=bd_ada;Persist Security Info=True;User ID=adadb;Password=adadb");
                SqlCommand cmd = new SqlCommand("AfisareReviewsRating", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@prating", System.Data.SqlDbType.Int).Value = int.Parse(tb_prag.Text);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (!dr.HasRows) tb_mesaj.Text = "Nu exista reviews!";
                else
                {
                    while (dr.Read())
                    {
                        string s = string.Format("Id Carte:{0,-25}|Rating:{1,-30}|Comentariu:{2,-6}",
                                                      dr["idCarte"],
                                                      dr["rating"],
                                                      dr["comentariu"]);
                        tb_mesaj.Text += s + Environment.NewLine;
                    }
                }
                con.Close();

            }
        }
    }
}