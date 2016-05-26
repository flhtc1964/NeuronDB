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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }


        private void Form2_Load(object sender, EventArgs e)
        {

            /////-------------------------------------------------------------------------
            //G.WK_Form1_USE_SWICH_FLG = "D_ID";
            //G.WK_Form1_USE_SHIKIBETU_ID = dataGridView1.Rows[0].Cells[9].Value.ToString();
            //G.WK_Form1_USE_UNIT = dataGridView1.Rows[ht.RowIndex].Cells[5].Value.ToString();
            //G.WK_Form1_USE_F_ID = dataGridView1.Rows[ht.RowIndex].Cells[6].Value.ToString();
            //G.WK_Form1_USE_F_ID_WORDS = dataGridView1.Rows[ht.RowIndex].Cells[8].Value.ToString();
            //G.WK_Form1_USE_D_ID_WORDS = dataGridView1.Rows[ht.RowIndex].Cells[11].Value.ToString();
            /////-------------------------------------------------------------------------

            textBox1.Text = G.WK_Form1_USE_D_ID_WORDS;

            STERT_LIST();

        }





        private void button1_Click(object sender, EventArgs e)
        {

            STERT_LIST();

        }

        private void button2_Click(object sender, EventArgs e)
        {

            //datagridviewの列リセット
            this.dataGridView1.Columns.Clear();

            //一旦クリア
            this.dataGridView1.DataSource = null;


            textBox1.Text = "";

            button1.PerformClick();

            textBox1.Focus();



        }







        public void STERT_LIST()
        {

            G.WK_Form1_USE_D_ID_WORDS = textBox1.Text;

            switch (G.WK_Form1_USE_SWICH_FLG)
            {
                case "D_ID":

                    //カラー設定
                    dataGridView1.DefaultCellStyle.BackColor = Color.Moccasin;
                    //dataGridView1.DefaultCellStyle.BackColor = Color.LightGoldenrodYellow;


                    //P1は使用するストアド番号（1000より小さい数字ならなんでも良いのだが）
                    string WK_P1 = "901";
                    string WK_P2 = G.WK_Form1_USE_SHIKIBETU_ID;
                    string WK_P3 = G.WK_Form1_USE_UNIT;

                    if (textBox1.Text.Length > 0)
                    {
                        WK_P3 = G.WK_Form1_USE_UNIT + "," + textBox1.Text;
                    }

                    LIST_VIEW(WK_P1, WK_P2, WK_P3);

                    break;


                default:
                    // 初期設定
                    break;
            }

        }

        public void LIST_VIEW(string foo_P1, string foo_P2, string foo_P3)
        {


            try
            {



                //◆これを追加しておく◆：using System.Data.SqlClient;





                label1.Text = "【" + G.WK_Form1_USE_SWICH_FLG + "】";



                //マウスカーソル待機状態
                Cursor.Current = Cursors.WaitCursor;



                //datagridviewの列リセット
                this.dataGridView1.Columns.Clear();

                //一旦クリア
                this.dataGridView1.DataSource = null;


                //DataGridView1にユーザーが新しい行を追加できないようにする
                dataGridView1.AllowUserToAddRows = false;


                //これをOFFにしないと表示が遅くなる
                //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する　→　OFF
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.None;

                //これをOFFにしないと表示が遅くなる
                //ヘッダーとすべてのセルの内容に合わせて、行の高さを自動調整する　→　OFF
                dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.None;



                // 接続文字列を生成する
                string connectstring = string.Empty;

                //connectstring += "Data Source         = " + G.WK_DB_SERVER_NAME_MEMO + ";";
                //connectstring += "Initial Catalog     = " + G.WK_DB_NAME_MEMO + ";";
                //connectstring += "Integrated Security = SSPI;";


                // SQL Server への接続を作成する。


                SqlConnection cnnct = new SqlConnection(G.WK_SQL_connectstring);

                // ストアドプロシージャの名前を指定してDataAdapterのインスタンスを作成する。
                SqlDataAdapter AddTableDataAdapter = new SqlDataAdapter(@"dbo.S_KENSAKU_SUB", cnnct);

                // コマンドの種類をStoredProcedureに設定する。
                AddTableDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                // 【重要】
                AddTableDataAdapter.SelectCommand.Parameters.Clear();


                // パラメータを作成し、ストアドプロシージャの Parameters コレクションに追加する。
                AddTableDataAdapter.SelectCommand.Parameters.Add(
                   new SqlParameter(@"@P1", SqlDbType.Int));
                AddTableDataAdapter.SelectCommand.Parameters.Add(
                   new SqlParameter(@"@P2", SqlDbType.Int));
                AddTableDataAdapter.SelectCommand.Parameters.Add(
                   new SqlParameter(@"@P3", SqlDbType.NVarChar));



                // 検索する値をパラメータに代入する。
                AddTableDataAdapter.SelectCommand.Parameters[@"@P1"].Value = int.Parse(foo_P1);
                AddTableDataAdapter.SelectCommand.Parameters[@"@P2"].Value = int.Parse(foo_P2);

                // 検索する値をパラメータに代入する。                        将来に備えて　 FLG = 2 現在のデータ
                AddTableDataAdapter.SelectCommand.Parameters[@"@P3"].Value = "2" + ":" + foo_P3;


                // レコードを保存するための新しい DataSet を作成する。
                DataSet DS = new DataSet();



                // DataSet に返される行を設定する。
                AddTableDataAdapter.Fill(DS);



                this.dataGridView1.DataSource = DS.Tables[0];




                // コネクションクローズ
                cnnct.Close();



                //dataGridView1.RowsDefaultCellStyle.BackColor = Properties.Settings.Default.Form1_C_BOX_MAIN_BC;
                //dataGridView1.RowsDefaultCellStyle.ForeColor = Properties.Settings.Default.Form1_C_BOX_FC;
                //dataGridView1.RowsDefaultCellStyle.Font = Properties.Settings.Default.Form1_Button_Font_Size;



                string connectstring3 = string.Empty;

                //connectstring3 += "Data Source         = " + G.WK_DB_SERVER_NAME_MEMO + ";";
                //connectstring3 += "Initial Catalog     = " + G.WK_DB_NAME_MEMO + ";";
                //connectstring3 += "Integrated Security = SSPI;";

                // SQL Server への接続を作成する。
                SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);

                string selectString3 = "";

                //text_2を使い該当識別IDの　【列名】　を取得
                //string selectString3 = @"SELECT dbo.Identify_Entity_tbl.F_ID_WORDS FROM dbo.Identify_Entity_tbl WHERE [識別ID] = (SELECT MIN([識別ID]) AS Expr1 FROM dbo.Identify_Entity_tbl AS Identify_Entity_tbl_2 WHERE [F_ID] = 4 AND [D_ID] = " + textBox2.Text.ToString() + ") ORDER BY dbo.Identify_Entity_tbl.ソート";

                if (foo_P3.IndexOf(",") > 0)
                {
                    //MessageBox.Show(foo_P3.IndexOf(",").ToString());

                    int foo_sub1 = foo_P3.IndexOf(",");
                    int foo_sub2 = foo_P3.Length - foo_sub1 - 1;


                    string WK_P3_1 = foo_P3.Substring(0, foo_sub1);

                    //MessageBox.Show(foo_sub1.ToString());
                    //MessageBox.Show(foo_sub2.ToString());

                    string WK_P3_2 = @foo_P3.Substring(foo_sub1 + 1, foo_sub2);

                    //MessageBox.Show(WK_P3_2);


                    selectString3 = @"SELECT ISNULL(dbo.Identify_Entity_tbl.F_ID_WORDS,'') FROM dbo.Identify_Entity_tbl WHERE [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = " + foo_P2 + " ) and [識別ID] IN  ( select MIN([識別ID]) AS Expr1 from dbo.Identify_Entity_tbl where [D_ID_WORDS] like '%" + WK_P3_2 + "%' ) AND [T_ID] = 2 AND [ユニット] = " + WK_P3_1 + " ORDER BY dbo.Identify_Entity_tbl.識別ID, dbo.Identify_Entity_tbl.T_ID, dbo.Identify_Entity_tbl.ソート";

                    //MessageBox.Show(selectString3);
                }
                else
                {
                    selectString3 = @"SELECT ISNULL(dbo.Identify_Entity_tbl.F_ID_WORDS,'') FROM dbo.Identify_Entity_tbl WHERE [識別ID] = (SELECT MIN([識別ID]) AS Expr1 FROM dbo.Identify_Entity_tbl AS Identify_Entity_tbl_2 WHERE [F_ID] = 4 AND [D_ID] = " + foo_P2 + " ) AND [T_ID] = 2 AND [ユニット] = " + foo_P3 + " ORDER BY dbo.Identify_Entity_tbl.識別ID, dbo.Identify_Entity_tbl.T_ID, dbo.Identify_Entity_tbl.ソート";

                }



                SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                cnnct3.Open();

                SqlDataReader reader3 = command3.ExecuteReader();

                int WK_KUBUN = 0;
                int WK_S_UP = 0;
                int WK_S_DOWN = 0;

                int foo_i = 0;


                while (reader3.Read())
                {

                    //MessageBox.Show(@reader3.GetValue(0).ToString());
                    //MessageBox.Show(dataGridView1.Columns[foo_i].HeaderText);
                    //MessageBox.Show(reader3.GetValue(0).ToString());



                    //DataGridView1の列名テキストを変更する
                    dataGridView1.Columns[foo_i].HeaderText = @reader3.GetValue(0).ToString();



                    switch (dataGridView1.Columns[foo_i].HeaderText)
                    {
                        case "リンク":
                            dataGridView1.Columns[foo_i].DefaultCellStyle.BackColor = Color.LightYellow;
                            break;

                        case "リンク先":
                            dataGridView1.Columns[foo_i].DefaultCellStyle.BackColor = Color.LightYellow;
                            break;


                        case "区分":
                            dataGridView1.Columns[foo_i].DefaultCellStyle.ForeColor = Color.DarkMagenta;

                            WK_KUBUN = foo_i;

                            break;



                        ////これ以降はソート用の処理

                        case "昇順":
                            WK_S_UP = foo_i;
                            break;

                        case "降順":
                            WK_S_DOWN = foo_i;
                            break;


                        default:
                            // 初期設定
                            break;
                    }



                    foo_i += 1;

                }

                reader3.Close();
                cnnct3.Close();



                if (WK_KUBUN > 0)
                {
                    //区分があれば表示順指定、降順、昇順が無い場合は有効
                    dataGridView1.Sort(dataGridView1.Columns[WK_KUBUN], ListSortDirection.Ascending);
                }

                if (WK_S_DOWN > 0)
                {
                    //表示順
                    dataGridView1.Sort(dataGridView1.Columns[WK_S_DOWN], ListSortDirection.Descending);
                }


                if (WK_S_UP > 0)
                {
                    //表示順
                    dataGridView1.Sort(dataGridView1.Columns[WK_S_UP], ListSortDirection.Ascending);
                }

                //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

                //ヘッダーとすべてのセルの内容に合わせて、行の高さを自動調整する
                dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;



                ///マウスカーソル元に戻す
                Cursor.Current = Cursors.Default;

                cnnct.Close();




                /////-------------------------------------------------------------------------




            }
            catch
            {
                MessageBox.Show("該当する表示データがありませんでした！");

                this.Close();
            }
        }


        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == -1)
            {

                //MessageBox.Show("行ヘッダーがクリックされました。");
                //MessageBox.Show("row:" + e.RowIndex + " col:" + e.ColumnIndex);

                if (dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString() != null)
                {

                    //////////////////////////////////////////////////////////
                    //データ◆縦◆詳細参照　引数（　識別ID　と　表示モード　）


                    string connectstring2 = string.Empty;

                    //connectstring2 += "Data Source         = " + G.WK_DB_SERVER_NAME_MEMO + ";";
                    //connectstring2 += "Initial Catalog     = " + G.WK_DB_NAME_MEMO + ";";
                    //connectstring2 += "Integrated Security = SSPI;";

                    System.Data.SqlClient.SqlConnection sqlConnection2 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


                    System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
                    cmd2.CommandType = System.Data.CommandType.Text;
                    cmd2.Connection = sqlConnection2;


                    sqlConnection2.Open();


                    G.WK_Form2_RETURN_SU = 0;

                    //MessageBox.Show(foo_koumoku + "|" + foo_shikibetsu_id + "|" + foo_t_id + "|" + foo_sort + "|" + foo_unit + "|" + foo_f_id + "|" + foo_f_id_words + "|" + foo_new_data);


                    switch (G.WK_Form1_USE_SWICH_FLG)
                    {
                        case @"D_ID":

                            G.WK_Form2_RETURN = "";

                            //
                            for (int r = 0; r <= this.dataGridView1.Columns.Count - 2; r++)
                            {
                                //MessageBox.Show(dataGridView1.Columns[r].HeaderCell.Value.ToString());


                                if (dataGridView1.Rows[e.RowIndex].Cells[r].Value.ToString().Length > 0)
                                {

                                    //cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl SET [D_ID] = '' , [D_ID_WORDS] = '" + dataGridView1.Rows[e.RowIndex].Cells[r].Value.ToString() + "' where [識別ID] = " + G.WK_Form1_MY_SHIKIBETU_ID + " and [T_ID] = " + G.WK_Form1_USE_T_ID + " and [ユニット] = " + G.WK_Form1_USE_UNIT + " and [F_ID_WORDS] = '" + dataGridView1.Columns[r].HeaderCell.Value.ToString() + "'";

                                    //MessageBox.Show(cmd2.CommandText);


                                    G.WK_Form2_RETURN = G.WK_Form2_RETURN + dataGridView1.Columns[r].HeaderCell.Value.ToString() + '\t' + dataGridView1.Rows[e.RowIndex].Cells[r].Value.ToString() + '|';

                                    //cmd2.ExecuteNonQuery();

                                    G.WK_Form2_RETURN_SU = G.WK_Form2_RETURN_SU + 1;
                                }

                            }

                            sqlConnection2.Close();

                            //MessageBox.Show("処理件数：　" + G.WK_Form2_RETURN_SU.ToString());
                            MessageBox.Show("使用データ：　" + G.WK_Form2_RETURN);

                            this.Close();

                            break;

                        default:
                            // 初期設定
                            break;
                    }







                }
                else
                {
                    MessageBox.Show("空白行です！");
                }

            }
        }


    }
}
