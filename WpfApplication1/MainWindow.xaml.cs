using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data;  
using System.Data.SqlClient; 


namespace WpfApplication1
{
   
    public partial class MainWindow : Window
    {
       
        DataTable dt = new DataTable();      
        
        public MainWindow()
        {
            InitializeComponent();
            refreshdata();
        }
               
        public void refreshdata()
        {           

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;Initial Catalog=tempdb;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT Name, Price, Kod from Stock", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            dt.Clear();
            con.Close();
               
            tbType.Text = "Продажа (открыт)";
            tbNum.Text = "00000005";                    
        }


        public void Enter()
        {                    

            //проверка есть ли такой продукт
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\v11.0;Initial Catalog=tempdb;Integrated Security=True");
            con.Open();
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();
            string strNames = tbInput.Text;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from Stock where name in(@strNames)";
            cmd.Parameters.AddWithValue("@strNames", strNames);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.SelectCommand.CommandTimeout = 0;
            da.Fill(dt2);
            con.Close();

            if (dt2.Rows.Count > 0)
            {
                DataRow drr = dt.NewRow();
                DataRow row = dt2.Rows[0];

                drr["Name"]    = row.ItemArray[1].ToString();
                drr["Price"]   = row.ItemArray[2].ToString(); 
                drr["Kod"]     = row.ItemArray[3].ToString();

                dt.Rows.Add(drr);
                                                              
                var query = from dr in dt.AsEnumerable()
                            group dr by new { name = dr.Field<string>("Name"),price = dr.Field<decimal>("Price"), kod = dr.Field<string>("Kod") } into grp
                            select new
                            {
                                Name = grp.Key.name,                              
                                Sum = grp.Sum(r => Convert.ToDecimal(r.ItemArray[1])),
                                Count = grp.Count()                               
                            };

                dt1 = dt.Clone();
              
                foreach (var x in query)
                {
                    DataRow dtRow   = dt1.NewRow();
                    dtRow["Name"]   = x.Name;
                    dtRow["Price"]  = x.Count;
                    dtRow["Kod"]    = x.Sum;
                    dt1.Rows.Add(dtRow);
                }

                DataGridCassa.ItemsSource = dt1.DefaultView;
                tbCount.Text = dt1.Rows.Count.ToString();
                sumTotal.Text = dt.Compute("SUM(Price)","").ToString();

            }
          
        }

        private void Row_MouseEnter(object sender, MouseEventArgs e)
        {            
            if (((System.Windows.Controls.DataGridRow)(sender)).Item is System.Data.DataRowView)
            {
                gtb1.Text = ((System.Data.DataRowView)(((DataGridRow)sender).Item)).Row.ItemArray[1].ToString(); //kod              
                
                decimal col  = Convert.ToDecimal(((System.Data.DataRowView)(((DataGridRow)sender).Item)).Row.ItemArray[1]); //кол-во             
                decimal col1 =  Convert.ToDecimal(string.Format("{0:n3}", col));

                gtb3.Text = col1.ToString();
                
                gtb4.Text = ((System.Data.DataRowView)(((DataGridRow)sender).Item)).Row.ItemArray[2].ToString(); //сумма
                gtb5.Text = ((System.Data.DataRowView)(((DataGridRow)sender).Item)).Row.ItemArray[0].ToString();
              
                decimal sum = Convert.ToDecimal(gtb4.Text);

                gtb2.Text = (sum/col).ToString() ; //цена                             

            }
        }              

        private void tbInput_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Enter();
        }

    }
}
