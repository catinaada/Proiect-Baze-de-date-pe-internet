using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Utilizatori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdauga_Click(object sender, EventArgs e)
        {

            string nume = tb_nume.Text;
            string email = tb_email.Text;
            string parola = tb_parola.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["bd_adaConnectionString"].ConnectionString);
            string query = "INSERT INTO Utilizatori  VALUES (@numeUser, @email, @parola)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@numeUser", nume);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@parola", parola);

            con.Open();
            cmd.ExecuteNonQuery();
            mesaj.Text = $"S-a adăugat utilizatorul cu numele: {nume}, și email-ul: {email}";


        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}