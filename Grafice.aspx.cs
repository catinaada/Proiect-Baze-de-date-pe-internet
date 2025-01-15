using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class Grafice : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               
                Dictionary<string, int> numarCartiPeGen = new Dictionary<string, int>();
                foreach (DataRowView rowView in ds.Select(DataSourceSelectArguments.Empty))
                {
                    string gen = rowView["gen"].ToString();
                    if (!numarCartiPeGen.ContainsKey(gen))
                    {
                        numarCartiPeGen.Add(gen, 0);
                    }
                    numarCartiPeGen[gen]++;
                }

                foreach (var entry in numarCartiPeGen)
                {
                    Chart2.Series["Series2"].Points.AddXY(entry.Key, entry.Value);
                }

                Chart2.Series["Series2"].ChartType = SeriesChartType.Pie;
                Chart2.Series["Series2"].Label = "#VALX - #PERCENT{P0}";
                Chart2.Series["Series2"].LegendText = "#VALX";
                Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;
                Label2.Text = "Distributia Genurilor Cartilor";

                Chart3.ChartAreas[0].AxisX.Title = "Rating";
                Chart3.ChartAreas[0].AxisY.Title = "Numar recenzii";
                Chart3.DataBind();

        }

        protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl1.SelectedIndex == 0)
            {
                Chart1.Series["Series1"].YValueMembers = "pret";
                Label1.Text = "Analiza Preturilor Cartilor";

            }
            else 
            {
                Chart1.Series["Series1"].YValueMembers =  "anPublicare";

                List<int> anPublicareValues = new List<int>();
                foreach (DataRowView rowView in ds.Select(DataSourceSelectArguments.Empty))
                {
                    DataRow row = rowView.Row;
                    anPublicareValues.Add(Convert.ToInt32(row["anPublicare"]));
                }

                anPublicareValues.Sort();
                int minYear = anPublicareValues[0];
                int maxYear = anPublicareValues[anPublicareValues.Count - 1];

                Chart1.ChartAreas["ChartArea1"].AxisY.Minimum = minYear-1;
                Chart1.ChartAreas["ChartArea1"].AxisY.Maximum = maxYear;
                Chart1.ChartAreas["ChartArea1"].AxisY.Interval = 2;
                Label1.Text = "Anii Publicarii Cartilor";

            }

        }

       
    }
}