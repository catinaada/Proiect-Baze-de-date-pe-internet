using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{

	public partial class EditCarti : System.Web.UI.Page
	{
		int idCarte;

		protected void Page_Load(object sender, EventArgs e)
		{
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["idCarte"] != null)
                {
                    idCarte = Convert.ToInt32(Request.QueryString["idCarte"]);
                    tb_id.Text = idCarte.ToString();
                    SqlConnection conn = new SqlConnection(System.Configuration.
                        ConfigurationManager.ConnectionStrings["bd_adaConnectionString"].ConnectionString);

                    conn.Open();
                    SqlCommand sql = new SqlCommand("select idCarte,titlu,autor,gen,pret,anPublicare from carti where idCarte=@idCarte", conn);
                    SqlParameter parameter = new SqlParameter();
                    parameter.ParameterName = "idCarte";
                    parameter.Value = idCarte;
                    sql.Parameters.Add(parameter);

                    SqlDataReader dr = sql.ExecuteReader();

                    if (dr.Read())
                    {
                        tb_titlu.Text = dr["titlu"].ToString();
                        tb_autor.Text = dr["autor"].ToString();
                        tb_gen.Text = dr["gen"].ToString();
                        tb_pret.Text = dr["pret"].ToString();
                        tb_an.Text = dr["anPublicare"].ToString();
                    }

                    conn.Close();

                }
            }
            else
            {
                tb_titlu.Visible = false;
                tb_autor.Visible = false;
                tb_gen.Visible = false;
                tb_pret.Visible = false;
                tb_an.Visible = false;
                HyperLink1.Visible = true;
            }
        }

        protected void btnSalveaza_Click(object sender, EventArgs e)
        {
			ds.Update();

            mesaj.Text = "Cartea a fost modificata!";


        }

        protected void tb_an_TextChanged(object sender, EventArgs e)
        {

        }
    }
}