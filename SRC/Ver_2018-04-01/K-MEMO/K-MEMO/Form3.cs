using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


using System.Data.SqlClient;

namespace K_MEMO
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

            if (G.WK_DB_USER_PASS != @"入力不要")
            {
                // Set to no text.
                textBox5.Text = "";
                // The password character is an asterisk.
                textBox5.PasswordChar = '*';
                // The control will allow no more than 14 characters.
                textBox5.MaxLength = 14;
            }

            textBox1.Text = G.WK_DB_SERVER_NAME_MEMO;
            textBox2.Text = G.WK_DB_SERVER_IP_MEMO;
            textBox3.Text = G.WK_DB_NAME_MEMO;
            textBox4.Text = G.WK_DB_USER_NAME;
            textBox5.Text = G.WK_DB_USER_PASS;

            if (textBox1.Text == @"入力不要")
            {
                textBox1.Visible = false;
            }

            if (textBox2.Text == @"入力不要")
            {
                textBox2.Visible = false;
            }

            if (textBox3.Text == @"入力不要")
            {
                textBox3.Visible = false;
            }

            if (textBox4.Text == @"入力不要")
            {
                textBox4.Visible = false;
            }

            if (textBox5.Text == @"入力不要")
            {
                textBox5.Visible = false;
            }



        }



        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("【登録内容です】" + Environment.NewLine + Environment.NewLine + textBox5.Text.ToString());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            G.WK_Form3_RETURN = "";
            this.Close();
        }

        private void Form3_FormClosed(object sender, FormClosedEventArgs e)
        {
            G.WK_DB_SERVER_NAME_MEMO = textBox1.Text;
            G.WK_DB_SERVER_IP_MEMO = textBox2.Text;
            G.WK_DB_NAME_MEMO = textBox3.Text;
            G.WK_DB_USER_NAME = textBox4.Text;
            G.WK_DB_USER_PASS = textBox5.Text;



        }

        private void label9_DoubleClick(object sender, EventArgs e)
        {
            textBox2.Text = "192.168.1.68";
        }

        private void label7_DoubleClick(object sender, EventArgs e)
        {
            textBox4.Text = "skojima";
        }

        private void label12_DoubleClick(object sender, EventArgs e)
        {
            textBox4.Text = "kmemo";
        }

        private void label10_DoubleClick(object sender, EventArgs e)
        {
            textBox1.Text = "kuhen";
        }

        private void label6_DoubleClick(object sender, EventArgs e)
        {
            textBox5.Text = "KMemo";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            G.WK_Form3_RETURN = "Cancel";
            this.Close();
        }
    }
}
