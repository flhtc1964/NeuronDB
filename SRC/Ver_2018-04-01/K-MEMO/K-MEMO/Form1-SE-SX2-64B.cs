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

    public partial class Form1 : Form
    {

       public Form1()
        {
            InitializeComponent();
        }



        private void Form1_Load(object sender, EventArgs e)
        {

            MessageBox.Show("このソフトは【無保証】です自己責任でお使い下さい！"+ Environment.NewLine+ Environment.NewLine +"http://kuhen.jp/ndb");

            //////////////
            ///  コンボボックス３
            ///  
            DataTable CMB3_SOURCE = new DataTable();

            CMB3_SOURCE.Columns.Add("ID", typeof(string));
            CMB3_SOURCE.Columns.Add("WORDS", typeof(string));



                    //新しい行作成
                    DataRow row1 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row1["ID"] = "1";
                    row1["WORDS"] = "【接続方法】を選択して下さい";
                    CMB3_SOURCE.Rows.Add(row1);

                    //新しい行作成
                    DataRow row2 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row2["ID"] = "2";
                    row2["WORDS"] = "【サーバの名前】Windows認証";
                    CMB3_SOURCE.Rows.Add(row2);

                    //新しい行作成
                    DataRow row3 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row3["ID"] = "3";
                    row3["WORDS"] = "【サーバのIP】Windows認証";
                    CMB3_SOURCE.Rows.Add(row3);

                    //新しい行作成
                    DataRow row4 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row4["ID"] = "4";
                    row4["WORDS"] = "【サーバの名前】SQLパスワード認証";
                    CMB3_SOURCE.Rows.Add(row4);

                    //新しい行作成
                    DataRow row5 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row5["ID"] = "5";
                    row5["WORDS"] = "【サーバのIP】SQLパスワード認証";
                    CMB3_SOURCE.Rows.Add(row5);

                    //新しい行作成
                    DataRow row6 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row6["ID"] = "6";
                    row6["WORDS"] = "【Azure】 ◆課金◆ SQLパスワード認証";
                    CMB3_SOURCE.Rows.Add(row6);


                    //新しい行作成
                    DataRow row7 = CMB3_SOURCE.NewRow();

                    //新しい行の各列にセット
                    row7["ID"] = "7";
                    row7["WORDS"] = "【VS2015_LocalDb】Windows認証";
                    CMB3_SOURCE.Rows.Add(row7);



            //CMB1_SOURCE.AcceptChanges();

            comboBox3.DataSource = CMB3_SOURCE;

            ///　表示は文字列、取得は、ID

            comboBox3.DisplayMember = "WORDS";

            comboBox3.ValueMember = "ID";

            comboBox3.MaxDropDownItems = 10;



            SET_SQL_CON();




            //各ボタンを隠す
            VISIBLE_OFF();

            if (G.WK_Form_Read_Key.Length > 0 || G.WK_Form_Read_Key2.Length > 0)
            {
                textBox2.Text = G.WK_Form_Read_SHIKIBETSU_ID;
                comboBox1.Text = G.WK_Form_Read_Key;
                textBox4.Text = G.WK_Form_Read_Key2;
                button3.PerformClick();

                //表示したらリセット
                G.WK_Form_Read_SHIKIBETSU_ID = "";
                G.WK_Form_Read_Key = "";
                G.WK_Form_Read_Key2 = "";

            }


            //参照モード
            if (G.WK_Form1_Read == 1)
            {
                label3.Visible = false;
                textBox3.Visible = false;
                button1.Visible = false;

                button12.Visible = false;
                button8.Visible = false;
                button7.Visible = false;

            }

        }


        private void VISIBLE_OFF()
        {


            button4.Visible = false;
            button5.Visible = false;
            button6.Visible = false;
            button7.Visible = false;
            button8.Visible = false;
            button9.Visible = false;
            button10.Visible = false;
            button11.Visible = false;
            button12.Visible = false;

            label5.Visible = false;
            label6.Visible = false;
            label8.Visible = false;
            label10.Visible = false;

            label13.Visible = false;
            label14.Visible = false;


            label4.Text = "";
            label12.Text = "";

            //新データ用ラベル
            label11.Visible = false;


            //新データ用
            textBox5.Visible = false;


            //datagridviewの列リセット
            this.dataGridView1.Columns.Clear();

            //一旦クリア
            this.dataGridView1.DataSource = null;

        }


        public void SET_SQL_CON()
        {


            G.WK_SQL_connectstring = string.Empty;







            switch (comboBox3.SelectedValue.ToString())
            {


                case "1":


                    // 初期設定
                    // SQL認証

                    MessageBox.Show("【接続方法】を選択してください！");

                    break;


                case "2":

                    G.WK_DB_SERVER_NAME_MEMO = "localhost"; //使えない
                    G.WK_DB_SERVER_IP_MEMO = "入力不要";
                    G.WK_DB_NAME_MEMO = "K-MEMO";
                    G.WK_DB_USER_NAME = "入力不要";
                    G.WK_DB_USER_PASS = "入力不要";



                    SET_SQL_CON_FM3();

                    G.WK_DB_USE_SERVER = G.WK_DB_SERVER_NAME_MEMO;

                    G.WK_SQL_connectstring += "Data Source=" + G.WK_DB_USE_SERVER + ";";
                    G.WK_SQL_connectstring += "Initial Catalog=" + G.WK_DB_NAME_MEMO + ";";
                    G.WK_SQL_connectstring += "Integrated Security=SSPI;";

                    label4.ForeColor = Color.Black;

                    label4.Text = "[" + G.WK_DB_USE_SERVER + "] " + G.WK_DB_NAME_MEMO;



                    break;


                case "3":


                    G.WK_DB_SERVER_NAME_MEMO = "入力不要";
                    G.WK_DB_SERVER_IP_MEMO = "127.0.0.1"; //使わない
                    G.WK_DB_NAME_MEMO = "K-MEMO";
                    G.WK_DB_USER_NAME = "入力不要";
                    G.WK_DB_USER_PASS = "入力不要";

                    SET_SQL_CON_FM3();

                    G.WK_DB_USE_SERVER = G.WK_DB_SERVER_IP_MEMO;

                    G.WK_SQL_connectstring += "Data Source=" + G.WK_DB_USE_SERVER + ";";
                    G.WK_SQL_connectstring += "Initial Catalog=" + G.WK_DB_NAME_MEMO + ";";
                    G.WK_SQL_connectstring += "Integrated Security=SSPI;";

                    label4.ForeColor = Color.Black;

                    label4.Text = "[" + G.WK_DB_USE_SERVER + "] " + G.WK_DB_NAME_MEMO;


                    break;


                case "4":



                    G.WK_DB_SERVER_NAME_MEMO = "";
                    G.WK_DB_SERVER_IP_MEMO = "入力不要"; //使わない
                    G.WK_DB_NAME_MEMO = "K-MEMO";
                    G.WK_DB_USER_NAME = "";
                    G.WK_DB_USER_PASS = "";


                    SET_SQL_CON_FM3();

                    G.WK_DB_USE_SERVER = G.WK_DB_SERVER_NAME_MEMO;

                    G.WK_SQL_connectstring += "Data Source=" + G.WK_DB_USE_SERVER + ";";
                    G.WK_SQL_connectstring += "Initial Catalog=" + G.WK_DB_NAME_MEMO + ";";
                    G.WK_SQL_connectstring += "User ID=" + G.WK_DB_USER_NAME + ";";
                    G.WK_SQL_connectstring += "Password=" + G.WK_DB_USER_PASS + ";";

                    label4.ForeColor = Color.Black;

                    label4.Text = "[" + G.WK_DB_USE_SERVER + "] " + G.WK_DB_NAME_MEMO;


                    break;


                case "5":



                    G.WK_DB_SERVER_NAME_MEMO = "入力不要";
                    G.WK_DB_SERVER_IP_MEMO = ""; //使わない
                    G.WK_DB_NAME_MEMO = "K-MEMO";
                    G.WK_DB_USER_NAME = "";
                    G.WK_DB_USER_PASS = "";


                    SET_SQL_CON_FM3();

                    G.WK_DB_USE_SERVER = G.WK_DB_SERVER_IP_MEMO;

                    G.WK_SQL_connectstring += "Data Source         = " + G.WK_DB_USE_SERVER + ";";
                    G.WK_SQL_connectstring += "Initial Catalog     = " + G.WK_DB_NAME_MEMO + ";";
                    G.WK_SQL_connectstring += "User ID=" + G.WK_DB_USER_NAME + ";";
                    G.WK_SQL_connectstring += "Password=" + G.WK_DB_USER_PASS + ";";

                    label4.ForeColor = Color.Black;

                    label4.Text = "[" + G.WK_DB_USE_SERVER + "] " + G.WK_DB_NAME_MEMO;


                    break;


                case "6":


                    //////////////////////////////////////////////////////
                    //////    Azure接続
                    //////////////////////////////////////////////////////

                    G.WK_DB_SERVER_NAME_MEMO = ""; //Azure SQLサーバネーム
                    G.WK_DB_SERVER_IP_MEMO = "入力不要"; //使わない
                    G.WK_DB_NAME_MEMO = "K-MEMO";
                    G.WK_DB_USER_NAME = ""; //SQL ID
                    G.WK_DB_USER_PASS = ""; //SQL PW
                    //////////////////////////////////////////////////////


                    SET_SQL_CON_FM3();

                    G.WK_DB_USE_SERVER = G.WK_DB_SERVER_NAME_MEMO;

                    G.WK_SQL_connectstring = "Server = tcp:" + G.WK_DB_USE_SERVER + ".database.windows.net,1433;Data Source=" + G.WK_DB_SERVER_NAME_MEMO + ".database.windows.net; Initial Catalog=" + G.WK_DB_NAME_MEMO + "; Persist Security Info = False; User ID =" + G.WK_DB_USER_NAME + "; Password=" + G.WK_DB_USER_PASS + "; Pooling=False;MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;";

                    label4.ForeColor = Color.Red;

                    label4.Text = "[" + G.WK_DB_USE_SERVER + "] " + G.WK_DB_NAME_MEMO;




                    MessageBox.Show("【重要】Azureを使用すると◆課金◆されますのでご注意下さい！");

                    break;

                case "7":

                    G.WK_DB_SERVER_NAME_MEMO = @"(LocalDb)\MSSQLLocalDB"; //使えない
                    G.WK_DB_SERVER_IP_MEMO = "入力不要";
                    G.WK_DB_NAME_MEMO = "K-MEMO";
                    G.WK_DB_USER_NAME = "入力不要";
                    G.WK_DB_USER_PASS = "入力不要";



                    SET_SQL_CON_FM3();

                    G.WK_DB_USE_SERVER = G.WK_DB_SERVER_NAME_MEMO;

                    G.WK_SQL_connectstring += "Data Source=" + G.WK_DB_USE_SERVER + ";";
                    G.WK_SQL_connectstring += "Initial Catalog=" + G.WK_DB_NAME_MEMO + ";";
                    G.WK_SQL_connectstring += "Integrated Security=SSPI;";

                    label4.ForeColor = Color.Black;

                    label4.Text = "[" + G.WK_DB_USE_SERVER + "] " + G.WK_DB_NAME_MEMO;



                    break;

                default:

                    MessageBox.Show("エラー：接続方法を選択してください！");

                    break;

            }



        }


        public void SET_SQL_CON_FM3()
        {


            Form3 Form3 = new Form3();

            //Form3_Read.WindowState = FormWindowState.Maximized;

            // モーダル表示
            Form3.ShowDialog();

            // モードレス表示
            //Form3_Read.Show();

            // Form3の解放
            //form3.Dispose();


            textBox6.Text = G.WK_DB_SERVER_NAME_MEMO;
            textBox7.Text = G.WK_DB_SERVER_IP_MEMO;
            textBox8.Text = G.WK_DB_USER_NAME;



            if (G.WK_DB_USER_NAME == @"入力不要")
            {
                label12.Text = System.Environment.UserName.ToString().ToLower();

            }
            else
            {
                label12.Text = G.WK_DB_USER_NAME;
            }

        }



        private void comboBox1_Enter(object sender, EventArgs e)
        {
            /////////////////////////////////////////////////////////////////////////////////////////////////////////
            ///
            ///
            /////////////////////////////////////////////////////////////////////////////////////////////////////////


            try
            {

                // SQL Server への接続を作成する。
                SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);

                string WK_WD = "";

                if (this.textBox1 == null)
                {
                    WK_WD = "%";
                }
                else
                {
                    WK_WD = @"%" + this.textBox1.Text + "%";
                }


                string selectString3 = @"SELECT ID, WORDS FROM dbo.Word_Entity_tbl WHERE ID IN (select DISTINCT D_ID from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID_WORDS like '" + WK_WD + "' ) and ID > 999";


                SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                cnnct3.Open();

                SqlDataReader reader3 = command3.ExecuteReader();


                DataTable CMB1_SOURCE = new DataTable();

                CMB1_SOURCE.Columns.Add("ID", typeof(string));
                CMB1_SOURCE.Columns.Add("WORDS", typeof(string));



                if (reader3.HasRows)
                {

                    while (reader3.Read())
                    {

                        //新しい行作成
                        DataRow row = CMB1_SOURCE.NewRow();

                        //新しい行の各列にセット
                        row["ID"] = reader3.GetValue(0).ToString();

                        row["WORDS"] = reader3.GetValue(1).ToString();

                        CMB1_SOURCE.Rows.Add(row);

                    }
                }




                comboBox1.DataSource = CMB1_SOURCE;

                ///　表示は文字列、取得は、ID

                comboBox1.DisplayMember = "WORDS";

                comboBox1.ValueMember = "ID";

                comboBox1.MaxDropDownItems = 80;

                reader3.Close();
                cnnct3.Close();

            }
            catch
            {
                MessageBox.Show("エラー：comboBox1セット");
            }


        }







        private void button1_Click(object sender, EventArgs e)
        {

            //入力モードに戻す
            G.WK_Form1_Read = 0;


            //DataGridView1にユーザーが新しい行を追加できないようにする
            dataGridView1.AllowUserToAddRows = false;

            button7.Visible = false;
            button8.Visible = false;

            comboBox1.Text = string.Empty;


            // SQL Server への接続を作成する。
            SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);

            string WK_WD = textBox3.Text;

            if (this.textBox3 == null || this.textBox3.ToString().Length == 0)
            {
                MessageBox.Show("エラー：今から追加する【識別名】が指定されていません！");

            }



            string selectString3 = @"SELECT count(WORDS) FROM dbo.Word_Entity_tbl WHERE ID IN (select DISTINCT D_ID from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID_WORDS = '" + WK_WD + "' COLLATE Japanese_CS_AS_KS_WS )";


            SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

            cnnct3.Open();

            SqlDataReader reader3 = command3.ExecuteReader();


            reader3.Read();

            string WK_UMU = reader3.GetValue(0).ToString();

            reader3.Close();
            cnnct3.Close();


            if (WK_UMU == "1")
            {
                MessageBox.Show("エラー：【識別名】 " + WK_WD + " は既に存在しています！");
            }
            else
            {



                // どのボタンを選択したかを判断する
                if (MessageBox.Show("今から【識別名】 " + WK_WD + " を新規作成しますか？", "【作成確認】", MessageBoxButtons.OKCancel) == DialogResult.OK)
                {


                    //MessageBox.Show("新規作成が選択されました");

                    button4.Visible = true;
                    button5.Visible = true;

                    ADD_NEW();


                }
                else
                {
                    MessageBox.Show("[キャンセル] ボタンを選択しましたので作成を中止します");
                }

            }


        }


        /// <summary>
        /// 新規　識別名　登録画面の準備
        /// </summary>
        public void ADD_NEW()
        {

            this.dataGridView1.DataSource = null;

            //datagridviewの列リセット
            this.dataGridView1.Columns.Clear();



            dataGridView1.Columns.Add("A", "主キー");
            dataGridView1.Columns.Add("B", "識別ID");
            dataGridView1.Columns.Add("C", "T_ID");
            dataGridView1.Columns.Add("D", "ソート順");
            dataGridView1.Columns.Add("E", "ユニット");
            dataGridView1.Columns.Add("F", "F_ID");
            dataGridView1.Columns.Add("G", "入力項目");
            dataGridView1.Columns.Add("H", "D_ID");
            dataGridView1.Columns.Add("I", "入力データ");

            string[] row1 = { "", "", "0", "0", "0", "4", "識別名", "", "" };
            string[] row2 = { "", "", "2", "100000", "10", "", "", "", "" };

            dataGridView1.Rows.Add(row1);
            dataGridView1.Rows.Add(row2);


            // datagridviewの先頭行や、指定列の書き込み禁止処理
            DATAGRIDVIEW_LOCK_CELLS(0);



        }




        /// <summary>
        /// datagridviewの先頭行や、指定列の書き込み禁止処理
        /// </summary>
        /// <param name="foo_view"></param>
        public void DATAGRIDVIEW_LOCK_CELLS(int foo_view)
        {


            //MID列は非表示に 
            for (int r = 0; r <= this.dataGridView1.Columns.Count - 1; r++)
            {
                //MessageBox.Show(dataGridView1.Columns[r].HeaderCell.Value.ToString());

                if (dataGridView1.Columns[r].HeaderCell.Value.ToString().Substring(0, 3) == "MID")
                {
                    dataGridView1.Columns[r].Visible = false;
                }


                //閲覧・削除モード
                if (foo_view == 1)
                {

                    switch (dataGridView1.Columns[r].HeaderCell.Value.ToString())
                    {
                        case @"主キー": // 0  ◆重要◆　これを true にしておかないと、修正モードで使いたい、主キー列が表示されない。
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"識別ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_識別ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"T_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"ソート":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"ユニット":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"F_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"F_ID_WORDS":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_F_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"D_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_D_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"D_ID_WORDS":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"識別IDリンク先":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_識別IDリンク先":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"識別IDリンク先使用数":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_識別IDリンク先使用数":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        default:
                            // 初期設定
                            break;
                    }
                }


                //入力修正モード
                if (foo_view == 2)
                {
                    switch (dataGridView1.Columns[r].HeaderCell.Value.ToString())
                    {
                        case @"主キー": // 0
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"識別ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_識別ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"T_ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"ソート":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"ユニット":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"F_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"F_ID_WORDS":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_F_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"D_ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_D_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"D_ID_WORDS":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"識別IDリンク先":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_識別IDリンク先":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"識別IDリンク先使用数":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_識別IDリンク先使用数":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        default:
                            // 初期設定
                            break;
                    }
                }
                //


                //メンテ　モード
                if (foo_view == 3)
                {
                    switch (dataGridView1.Columns[r].HeaderCell.Value.ToString())
                    {
                        case @"主キー": // 0
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"識別ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_識別ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"T_ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"ソート":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"ユニット":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"F_ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"F_ID_WORDS":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_F_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"D_ID":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"G_D_ID":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"D_ID_WORDS":
                            dataGridView1.Columns[r].Visible = true;
                            break;

                        case @"識別IDリンク先":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_識別IDリンク先":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"識別IDリンク先使用数":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        case @"G_識別IDリンク先使用数":
                            dataGridView1.Columns[r].Visible = false;
                            break;

                        default:
                            // 初期設定
                            break;
                    }
                }

            }





            //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            //ヘッダーとすべてのセルの内容に合わせて、行の高さを自動調整する
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;




            //◆重要◆　これはONにしてはいけない。列の表示、非表示の操作が出来なくなる
            //dataGridView1.AutoGenerateColumns = false;


            //DataGridView1の1行を読み取り専用にする
            dataGridView1.Rows[0].ReadOnly = true;



            //ライトグレイ色にする
            dataGridView1.Rows[0].DefaultCellStyle.BackColor = Color.LightGray;


            switch (foo_view)
            {

                case 0:  //識別ID　登録
                    //列書き込み禁止
                    dataGridView1.Columns[0].ReadOnly = true;
                    dataGridView1.Columns[1].ReadOnly = true;
                    dataGridView1.Columns[2].ReadOnly = true;
                    dataGridView1.Columns[5].ReadOnly = true;
                    dataGridView1.Columns[7].ReadOnly = true;
                    dataGridView1.Columns[8].ReadOnly = true;



                    //インデックス0の列のセルの背景色を水色にする
                    dataGridView1.Columns[0].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[1].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[2].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[5].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[7].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[8].DefaultCellStyle.BackColor = Color.LightGray;

                    break;

                case 1:  //参照


                    //DataGridView1にユーザーが新しい行を追加できないようにする
                    dataGridView1.AllowUserToAddRows = false;

                    //列書き込み禁止
                    dataGridView1.Columns[1].ReadOnly = true;
                    dataGridView1.Columns[8].ReadOnly = true;
                    dataGridView1.Columns[11].ReadOnly = true;


                    //インデックス0の列のセルの背景色を水色にする
                    dataGridView1.Columns[1].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[8].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[11].DefaultCellStyle.BackColor = Color.Moccasin;

                    //完全削除ボタンを表示
                    button7.Visible = true;

                    //入力・修正ボタンを表示
                    button8.Visible = true;

                    //行追加　ボタンを表示
                    button12.Visible = true;


                    //[T_ID]の説明を表示
                    label5.Visible = false;





                    //参照モード
                    if (G.WK_Form1_Read == 1)
                    {
                        label3.Visible = false;
                        textBox3.Visible = false;
                        button1.Visible = false;

                        button12.Visible = false;
                        button8.Visible = false;
                        button7.Visible = false;


                    }




                    break;


                case 2:  //修正時


                    //DataGridView1にユーザーが新しい行を追加できないようにする
                    dataGridView1.AllowUserToAddRows = false;

                    //列書き込み禁止
                    dataGridView1.Columns[0].ReadOnly = true;
                    dataGridView1.Columns[1].ReadOnly = true;
                    dataGridView1.Columns[3].ReadOnly = true;
                    dataGridView1.Columns[6].ReadOnly = true;
                    dataGridView1.Columns[8].ReadOnly = true;
                    dataGridView1.Columns[9].ReadOnly = true;
                    dataGridView1.Columns[11].ReadOnly = false;

                    //インデックス0の列のセルの背景色を水色にする
                    dataGridView1.Columns[0].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[1].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[3].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[6].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[9].DefaultCellStyle.BackColor = Color.LightBlue;  // D_ID
                    dataGridView1.Columns[11].DefaultCellStyle.BackColor = Color.LightYellow;



                    //実際に画面に見えているデータを表示する（使う）
                    //MessageBox.Show(dataGridView1.Rows[0].Cells[0].Value.ToString());



                    //完全削除ボタンを非表示
                    button7.Visible = false;

                    //[T_ID]の説明を表示
                    label5.Visible = true;

                    //新データ作成ボタンを表示
                    button11.Visible = true;

                    label8.Visible = true;

                    label8.Text = "";


                    //フォーカスセット
                    dataGridView1.CurrentCell = dataGridView1[11, 1];

                    break;


                case 3:  //メンテ時


                    //Wクリックで項目名を過去にする準備
                    G.WK_Form1_MOUSE_W_CLICK = 3;

                    //DataGridView1にユーザーが新しい行を追加できないようにする
                    dataGridView1.AllowUserToAddRows = true;

                    //列書き込み禁止
                    dataGridView1.Columns[0].ReadOnly = true;
                    dataGridView1.Columns[1].ReadOnly = true;
                    dataGridView1.Columns[2].ReadOnly = true;
                    dataGridView1.Columns[3].ReadOnly = true;
                    dataGridView1.Columns[6].ReadOnly = true;
                    dataGridView1.Columns[7].ReadOnly = true;
                    dataGridView1.Columns[9].ReadOnly = true;
                    dataGridView1.Columns[10].ReadOnly = true;
                    dataGridView1.Columns[11].ReadOnly = true;



                    //インデックス0の列のセルの背景色を水色にする
                    dataGridView1.Columns[0].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[1].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[3].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[6].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[7].DefaultCellStyle.BackColor = Color.LightGray;
                    dataGridView1.Columns[9].DefaultCellStyle.BackColor = Color.LightGray;  // D_ID
                    dataGridView1.Columns[11].DefaultCellStyle.BackColor = Color.LightGray;


                    //// 変更可能列の文字を指定
                    dataGridView1.Columns[3].DefaultCellStyle.ForeColor = Color.Maroon;
                    dataGridView1.Columns[4].DefaultCellStyle.ForeColor = Color.Maroon;
                    dataGridView1.Columns[5].DefaultCellStyle.ForeColor = Color.Maroon;
                    dataGridView1.Columns[8].DefaultCellStyle.ForeColor = Color.Maroon;


                    /// 先頭行　識別ID
                    dataGridView1.Rows[0].Cells[4].Style.ForeColor = Color.Black;
                    dataGridView1.Rows[0].Cells[5].Style.ForeColor = Color.Black;
                    dataGridView1.Rows[0].Cells[6].Style.ForeColor = Color.Black;
                    dataGridView1.Rows[0].Cells[11].Style.ForeColor = Color.Maroon;
                    dataGridView1.Rows[0].Cells[11].Style.BackColor = Color.LightYellow;



                    //実際に画面に見えているデータを表示する（使う）
                    //MessageBox.Show(dataGridView1.Rows[0].Cells[0].Value.ToString());



                    //総行数をカウント  ◆空白追加用行もカウントするので注意◆　セルのデータ指定用
                    //空白追加用行も カウントするので、行数は１から数える、カラムは０から指定なので -2
                    int foo_rows = dataGridView1.Rows.Count - 2;


                    //セルのスタイルは先頭が１から始まるので
                    //int foo_rows_style = dataGridView1.Rows.Count;




                    //既存データは、グリッド内では修正不可、新規のみ許可 
                    for (int rr = 1; rr <= foo_rows; rr++)
                    {

                        //MessageBox.Show(dataGridView1.Rows[rr].Cells[6].Value.ToString());

                        dataGridView1.Rows[rr].Cells[4].ReadOnly = true;
                        dataGridView1.Rows[rr].Cells[4].Style.BackColor = Color.LightGray;
                        dataGridView1.Rows[rr].Cells[5].ReadOnly = true;
                        dataGridView1.Rows[rr].Cells[5].Style.BackColor = Color.LightGray;
                        dataGridView1.Rows[rr].Cells[6].ReadOnly = true;
                        dataGridView1.Rows[rr].Cells[6].Style.BackColor = Color.LightGray;


                    }


                    dataGridView1.Rows[foo_rows + 1].Cells[1].Value = dataGridView1.Rows[foo_rows].Cells[1].Value;
                    dataGridView1.Rows[foo_rows + 1].Cells[3].Value = 2;


                    //フォーカスセット
                    dataGridView1.CurrentCell = dataGridView1[4, foo_rows + 1];


                    //完全削除ボタンを非表示
                    button7.Visible = false;

                    //D_ID ボタンを非表示
                    button9.Visible = false;


                    //[入力項目]追加 ボタンを非表示
                    button12.Visible = false;


                    //行追加説明　を表示
                    label6.Visible = true;

                    //行追加を表示
                    button4.Visible = false;

                    //行データチェックを表示
                    button5.Visible = true;



                    //新データ作成ボタンを表示
                    button11.Visible = false;



                    break;

                default:
                    break;

            }


        }


        /// <summary>
        /// データ行を追加
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        private void button4_Click(object sender, EventArgs e)
        {

            //SE入力モードに戻す
            G.WK_Form1_Read = 0;

            int foo_i = 0;

            int foo_s = 0;
            int foo_u = 0;

            // 
            for (int r = 0; r <= this.dataGridView1.Rows.Count - 1; r++)
            {

                if (dataGridView1.Rows[r].Cells[3].Value != null)
                {
                    if (Convert.ToInt32(dataGridView1.Rows[r].Cells[3].Value) > foo_s)
                    {
                        foo_s = Convert.ToInt32(dataGridView1.Rows[r].Cells[3].Value);
                    }

                }


                if (dataGridView1.Rows[r].Cells[4].Value != null)
                {
                    if (Convert.ToInt32(dataGridView1.Rows[r].Cells[4].Value) > foo_u)
                    {
                        foo_u = Convert.ToInt32(dataGridView1.Rows[r].Cells[4].Value);
                    }
                }

                foo_i = foo_i + 1;

            }

            foo_s = foo_s + 100;
            foo_u = foo_u + 10;

            string[] row3 = { "", "", "2", foo_s.ToString(), foo_u.ToString(), "", "", "", "" };

            dataGridView1.Rows.Add(row3);


            //フォーカスセット
            dataGridView1.CurrentCell = dataGridView1[6, foo_i];



        }


        /// <summary>
        /// 新規に追加しようとするデータをチェック
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button5_Click(object sender, EventArgs e)
        {

            //SE入力モードに戻す
            G.WK_Form1_Read = 0;

            int foo_rows = this.dataGridView1.Rows.Count;
            int foo_s = 0;
            int foo_t = 0;
            int foo_F_ID = 0;
            int foo_F_ID_W = 0;

            if (G.WK_Form1_GYO_CHECK == 0)
            {
                //新規ADD
                foo_rows = foo_rows - 1;
                foo_s = 3;
                foo_t = 2;
                foo_F_ID = 5;
                foo_F_ID_W = 6;

            }
            else
            {
                //追加ADD
                foo_rows = foo_rows - 2;
                foo_s = 4;
                foo_t = 3;
                foo_F_ID = 6;
                foo_F_ID_W = 8;
            }


            //MessageBox.Show(foo_rows.ToString());

            //先頭へ列へ移動
            dataGridView1.CurrentCell = dataGridView1[0, 0];


            int foo_c = 0;

            // 最後の空白追加行は除く
            for (int r = 0; r <= foo_rows; r++)
            {


                if (dataGridView1.Rows[r].Cells[foo_F_ID_W].ToString().Length == 0 || dataGridView1.Rows[r].Cells[foo_F_ID_W].Value == null)
                {
                    foo_c = foo_c + 1;
                }

            }

            if (foo_c > 0)
            {
                MessageBox.Show("[入力項目]に空白があります！");
            }
            else
            {

                // 列データを元に昇順でソート
                dataGridView1.Sort(dataGridView1.Columns[foo_s], ListSortDirection.Ascending);

                MessageBox.Show("列 [ " + dataGridView1.Columns[foo_s].HeaderText.ToString() + " ] でデータ行を昇順に並びかえました！");


                MessageBox.Show("[ユニット]でグループ化したい場合[入力項目]を同一番号に修正してください！");

                string WK_SORT_CHECK = "";




                // 最後の空白追加行は除く
                for (int rr = 0; rr <= foo_rows; rr++)
                {


                    if (dataGridView1.Rows[rr].Cells[1].Value.ToString().Length == 0 || dataGridView1.Rows[rr].Cells[1].Value == null)
                    {
                        //識別IDが空白なら、登録する
                        dataGridView1.Rows[rr].Cells[1].Value = dataGridView1.Rows[0].Cells[1].Value;
                    }


                    if (dataGridView1.Rows[rr].Cells[foo_t].Value.ToString().Length == 0 || dataGridView1.Rows[rr].Cells[foo_t].Value == null)
                    {
                        //T_IDが空白なら、登録する
                        dataGridView1.Rows[rr].Cells[foo_t].Value = 2;
                    }


                    //F_IDが空白ならば
                    if (dataGridView1.Rows[rr].Cells[foo_F_ID].Value.ToString().Length == 0 || dataGridView1.Rows[rr].Cells[foo_F_ID].Value == null)
                    {

                        //F_IDが空白なら、登録する

                        if (dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value.ToString().Length != dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value.ToString().Trim().Length)
                        {

                            MessageBox.Show("【" + dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value.ToString() + "】データ前後の空白を" + Environment.NewLine + Environment.NewLine + "【" + dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value.ToString().Trim() + "】に変更します！" + Environment.NewLine + Environment.NewLine + "　※半角のかわりにはアンダーバー等の記号をお使い下さい！");
                            dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value = dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value.ToString().Trim();


                        }



                        var F_ID = WORDS_ID_CHECK(dataGridView1.Rows[rr].Cells[foo_F_ID_W].Value.ToString());
                        dataGridView1.Rows[rr].Cells[foo_F_ID].Value = F_ID;


                        dataGridView1.Rows[rr].Cells[foo_F_ID].Style.ForeColor = Color.Blue;

                    }




                    if (rr > 0 && dataGridView1.Rows[rr].Cells[foo_s].Value.ToString() == WK_SORT_CHECK)
                    {
                        //識別IDが空白なら、登録する

                        MessageBox.Show("[ソート]キー　【　" + dataGridView1.Rows[rr].Cells[foo_s].Value.ToString() + "　】　が重複しています修正して下さい！");
                        dataGridView1.Rows[rr].Cells[foo_s].Style.ForeColor = Color.Red;

                    }

                    WK_SORT_CHECK = dataGridView1.Rows[rr].Cells[foo_s].Value.ToString();

                }



                button6.Visible = true;
                button6.Focus();
            }


        }


        /// <summary>
        /// 新規登録の実行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button6_Click(object sender, EventArgs e)
        {

            //SE入力モードに戻す
            G.WK_Form1_Read = 0;

            ///------------------------------------------------------------------------------------
            ///


            if (G.WK_Form1_GYO_CHECK == 0)
            {
                //新規ADD



                System.Data.SqlClient.SqlConnection sqlConnection1 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS]) VALUES (0,0,0,4,'識別名');SELECT CAST(SCOPE_IDENTITY() AS int)";
                cmd.Connection = sqlConnection1;


                sqlConnection1.Open();

                //主キー（識別ID）取得
                var SHIKIBETSU_ID = (int)cmd.ExecuteScalar();
                //MessageBox.Show("取得した【識別ID】　" + SHIKIBETSU_ID);




                //新規登録する【WORDS】のIDを取得し、登録が無ければID登録後取得
                var D_ID = WORDS_ID_CHECK(textBox3.Text.ToString());

                //MessageBox.Show("IDは" +D_ID.ToString());



                cmd.CommandText = @"UPDATE dbo.Identify_Entity_tbl set [識別ID] = " + SHIKIBETSU_ID + " , [D_ID] = " + D_ID + " , [D_ID_WORDS] = '" + textBox3.Text.ToString() + "' where [主キー] = " + SHIKIBETSU_ID;
                cmd.ExecuteNonQuery();

                sqlConnection1.Close();


                //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する
                this.dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

                //この↑までが先頭行の処理


                System.Data.SqlClient.SqlConnection sqlConnection2 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);

                System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
                cmd2.CommandType = System.Data.CommandType.Text;
                cmd2.Connection = sqlConnection2;


                sqlConnection2.Open();



                try {
                ///////////////

                    for (int r = 1; r <= this.dataGridView1.Rows.Count - 1; r++)
                {


                    var F_ID = WORDS_ID_CHECK(dataGridView1.Rows[r].Cells[6].Value.ToString());


                    cmd2.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([識別ID],[T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS]) VALUES (" + SHIKIBETSU_ID + " , ";
                    cmd2.CommandText = cmd2.CommandText + "2,";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[3].Value.ToString() + " , ";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[4].Value.ToString() + " , ";
                    cmd2.CommandText = cmd2.CommandText + F_ID + " , '";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[6].Value.ToString() + "' )";
                    cmd2.ExecuteNonQuery();

                }

                sqlConnection2.Close();


                    MessageBox.Show("識別名 【 " + textBox3.Text.ToString() + " 】 を登録しました！");


                    ///////////////
                }
                catch (Exception ex)
                {


                        MessageBox.Show("エラー：識別名 【 " + textBox3.Text.ToString() + " 】 登録失敗！");


                }
                ///////////////

            }
            else
            {


                // SQL Server への接続を作成する。
                SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);



                string selectString3 = @"SELECT DISTINCT [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = " + dataGridView1.Rows[0].Cells[9].Value.ToString() + " and D_ID > 999";


                SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                cnnct3.Open();

                SqlDataReader reader3 = command3.ExecuteReader();

                int foo_cunt = 0;


                if (reader3.HasRows)
                {

                    while (reader3.Read())
                    {

                        foo_cunt = foo_cunt + 1;

                        ///////-------------------------------------




                        System.Data.SqlClient.SqlConnection sqlConnection2 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


                        System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
                        cmd2.CommandType = System.Data.CommandType.Text;
                        cmd2.Connection = sqlConnection2;


                        sqlConnection2.Open();




                        try
                        {
                        ///////////////


                            for (int r = 1; r <= this.dataGridView1.Rows.Count - 2; r++)
                        {

                            //主キーが空白なら、新規追加対象
                            if (dataGridView1.Rows[r].Cells[0].Value.ToString().Length == 0 || dataGridView1.Rows[r].Cells[0].Value == null)
                            {
                                cmd2.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([識別ID],[T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS]) VALUES ( " + reader3.GetValue(0).ToString() + " , ";
                                cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[3].Value.ToString() + " , ";
                                cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[4].Value.ToString() + " , ";
                                cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[5].Value.ToString() + " , ";
                                cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[6].Value.ToString() + " , ";
                                cmd2.CommandText = cmd2.CommandText + "'" + dataGridView1.Rows[r].Cells[8].Value.ToString() + "' )";
                                cmd2.ExecuteNonQuery();

                            }
                        }

                        sqlConnection2.Close();



                            MessageBox.Show("識別名ID 【 " + dataGridView1.Rows[0].Cells[9].Value.ToString() + " 】 " + Environment.NewLine + Environment.NewLine + "処理した件数は　【 " + foo_cunt.ToString() + " 】件です" + Environment.NewLine + Environment.NewLine + "識別名 【 " + dataGridView1.Rows[0].Cells[11].Value.ToString() + " 】全てに【追加】処理をしました！");

                            ///////////////
                        }
                        catch (Exception ex)
                        {


                                MessageBox.Show("エラー：識別名 【 " + textBox3.Text.ToString() + " 】 登録失敗！");

                        }


                        ///////////////

                    }
                }


                reader3.Close();
                cnnct3.Close();





            }

            VISIBLE_OFF();

        }





        /// <summary>
        /// IDチェック、無ければ登録
        /// </summary>
        /// <param name="foo_wd"></param>
        /// <returns></returns>
        public int WORDS_ID_CHECK(string foo_wd)
        {

            string WK_ID = string.Empty;

            // SQL Server への接続を作成する。
            SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);

            //登録がるか確認
            // SELECT * FROM 【テーブル名】
            // WHERE 【項目名】 LIKE 【条件】 COLLATE Japanese_CS_AS_KS_WS
            // 
            // ※照合順序
            //  * CI：大文字、小文字を区別しない
            //  * CS：大文字、小文字を区別する
            //  * AI：アクセント、濁音、破裂音を区別しない
            //  * AS：アクセント、濁音、破裂音を区別する
            //  * KS：ひらがなとカタカナを区別する
            //  * WS：全角、半角を区別する

            string selectString3 = @"SELECT count(ID) FROM dbo.Word_Entity_tbl WHERE [WORDS] = '" + @foo_wd + "' COLLATE Japanese_CS_AS_KS_WS";


            SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

            cnnct3.Open();

            SqlDataReader reader3 = command3.ExecuteReader();


            reader3.Read();

            WK_ID = reader3.GetValue(0).ToString();

            reader3.Close();
            cnnct3.Close();



            //登録が無いなら追加
            if (WK_ID == "0")
            {

                if (foo_wd.Length > 0)
                {

                    System.Data.SqlClient.SqlConnection sqlConnection1 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = @"INSERT INTO  dbo.Word_Entity_tbl ([WORDS]) VALUES ('" + @foo_wd + "');SELECT CAST(SCOPE_IDENTITY() AS int)";
                    cmd.Connection = sqlConnection1;


                    sqlConnection1.Open();

                    //WordテーブルのIDを取得

                    var newId = (int)cmd.ExecuteScalar();

                    //MessageBox.Show("取得した【ID】　" + newId);

                    WK_ID = newId.ToString();


                    sqlConnection1.Close();
                }
                else
                {
                    WK_ID = "-1";

                }
            }
            else
            {

                //IDがあるので読込

                // SQL Server への接続を作成する。
                SqlConnection cnnct = new SqlConnection(G.WK_SQL_connectstring);


                string selectString = @"SELECT dbo.Word_Entity_tbl.ID FROM dbo.Word_Entity_tbl WHERE [WORDS] LIKE '" + @foo_wd + "' COLLATE Japanese_CS_AS_KS_WS";


                SqlCommand command = new SqlCommand(selectString, cnnct);

                cnnct.Open();

                SqlDataReader reader = command.ExecuteReader();


                reader.Read();

                WK_ID = reader.GetValue(0).ToString();

                reader.Close();
                cnnct.Close();

            }



            int foo_ID = Convert.ToInt32(WK_ID);



            return foo_ID;

        }




        /// <summary>
        /// 行で参照
        /// </summary>
        public void SUB_OPEN(string foo_view)
        {

            /// 取りあえず参照モードにセット
            G.WK_Form1_DataGridView_MOUSE_W_CLICK = 0;

            label14.Visible = false;

            // WIDE検索
            if (textBox4.Text.Length > 0 && comboBox1.Text.Length < 1)
            {

                try
                {

                    //◆これを追加しておく◆：using System.Data.SqlClient;


                    //各ボタンを隠す
                    VISIBLE_OFF();

                    label7.Text = "【全文検索文字】";

                    label10.Visible = true;

                    //グリッド先頭のWクリックイベントを許可
                    G.WK_Form1_MOUSE_W_CLICK = 0;



                    //マウスカーソル待機状態
                    Cursor.Current = Cursors.WaitCursor;


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



                    // SQL Server への接続を作成する。
                    SqlConnection cnnct = new SqlConnection(G.WK_SQL_connectstring);

                    // ストアドプロシージャの名前を指定してDataAdapterのインスタンスを作成する。
                    SqlDataAdapter AddTableDataAdapter = new SqlDataAdapter(@"dbo.S_KENSAKU_WIDE", cnnct);

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



                    // 検索する値をパラメータに代入する。 0以外で1000以下ならOKだが、ここはWIDEのシステムj辞書番号を指定
                    AddTableDataAdapter.SelectCommand.Parameters[@"@P1"].Value = 903;
                    AddTableDataAdapter.SelectCommand.Parameters[@"@P2"].Value = 903;

                    // 検索する値をパラメータに代入する。
                    AddTableDataAdapter.SelectCommand.Parameters[@"@P3"].Value = @textBox4.Text.ToString();


                    // レコードを保存するための新しい DataSet を作成する。
                    DataSet DS = new DataSet();



                    // DataSet に返される行を設定する。
                    AddTableDataAdapter.Fill(DS);



                    this.dataGridView1.DataSource = DS.Tables[0];




                    // コネクションクローズ
                    cnnct.Close();




                    //MID列は非表示に 
                    for (int r = 0; r <= this.dataGridView1.Columns.Count - 1; r += 2)
                    {
                        //MessageBox.Show(dataGridView1.Columns[r].HeaderCell.Value.ToString());


                        dataGridView1.Columns[r].Visible = false;

                    }


                    for (int r = 0; r <= this.dataGridView1.Rows.Count - 1; r++)
                    {


                        if (dataGridView1.Rows[r].Cells[3].Value.ToString() == @"識別名")
                        {
                            dataGridView1.Rows[r].DefaultCellStyle.BackColor = Color.LightBlue;
                        }


                    }


                    //主キーは非表示にする
                    dataGridView1.Columns[0].Visible = false;

                    if (textBox4.Text == "会議日程" && textBox2.Text == "")
                    {
                        //表示順 MDT2
                        //MessageBox.Show(dataGridView1.Columns[5].HeaderText);
                        dataGridView1.Sort(dataGridView1.Columns[5], ListSortDirection.Descending);
                    }


                    //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する
                    dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

                    //ヘッダーとすべてのセルの内容に合わせて、行の高さを自動調整する
                    dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;



                    ///マウスカーソル元に戻す
                    Cursor.Current = Cursors.Default;

                    cnnct.Close();

                    //MessageBox.Show("今からオレンジ色！");
                    //参照モード
                    if (G.WK_Form1_Read == 1)
                    {
                        dataGridView1.DefaultCellStyle.BackColor = Color.Moccasin;
                    }
                    else
                    {
                        dataGridView1.DefaultCellStyle.BackColor = Color.LightGoldenrodYellow;

                    }

                    label7.Visible = true;


                    /////-------------------------------------------------------------------------




                }
                catch
                {
                    MessageBox.Show("該当する表示データがありませんでした！");

                    // this.Close();
                }


            }
            else
            {

                try
                {

                    label10.Visible = false;

                    //◆これを追加しておく◆：using System.Data.SqlClient;


                    //各ボタンを隠す
                    VISIBLE_OFF();


                    label7.Text = "【絞込検索文字】";


                    //グリッド先頭のWクリックイベントを許可
                    G.WK_Form1_MOUSE_W_CLICK = 0;



                    //マウスカーソル待機状態
                    Cursor.Current = Cursors.WaitCursor;


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
                    AddTableDataAdapter.SelectCommand.Parameters[@"@P1"].Value = int.Parse(foo_view);
                    AddTableDataAdapter.SelectCommand.Parameters[@"@P2"].Value = int.Parse(foo_view);

                    // 検索する値をパラメータに代入する。
                    AddTableDataAdapter.SelectCommand.Parameters[@"@P3"].Value = "0:," + @textBox4.Text.ToString();


                    // レコードを保存するための新しい DataSet を作成する。
                    DataSet DS = new DataSet();



                    // DataSet に返される行を設定する。
                    AddTableDataAdapter.Fill(DS);



                    this.dataGridView1.DataSource = DS.Tables[0];




                    // コネクションクローズ
                    cnnct.Close();




                    //MID列は非表示に 
                    for (int r = 0; r <= this.dataGridView1.Columns.Count - 1; r += 2)
                    {
                        //MessageBox.Show(dataGridView1.Columns[r].HeaderCell.Value.ToString());


                        dataGridView1.Columns[r].Visible = false;

                    }


                    // SQL Server への接続を作成する。
                    SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);

                    string WK_WD = textBox2.Text;

                    if (this.textBox2 == null || this.textBox2.ToString().Length == 0)
                    {
                        MessageBox.Show("エラー：【識別名】が指定されていません！");

                    }


                    //text_2を使い該当識別IDの列名を取得
                    string selectString3 = @"SELECT dbo.Identify_Entity_tbl.F_ID_WORDS FROM dbo.Identify_Entity_tbl WHERE [識別ID] = (SELECT MIN([識別ID]) AS Expr1 FROM dbo.Identify_Entity_tbl AS Identify_Entity_tbl_2 WHERE [F_ID] = 4 AND [D_ID] = " + textBox2.Text.ToString() + ") ORDER BY dbo.Identify_Entity_tbl.ソート";


                    SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                    cnnct3.Open();

                    SqlDataReader reader3 = command3.ExecuteReader();


                    int WK_KUBUN = 0;
                    int WK_S_UP = 0;
                    int WK_S_DOWN = 0;


                    int foo_i = 3;

                    while (reader3.Read())
                    {


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
                            case "種別":
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



                        foo_i += 2;

                    }

                    reader3.Close();
                    cnnct3.Close();



                    //主キーは非表示にする
                    dataGridView1.Columns[0].Visible = false;



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

                    //MessageBox.Show("今からオレンジ色！");
                    //参照モード
                    if (G.WK_Form1_Read == 1)
                    {
                        dataGridView1.DefaultCellStyle.BackColor = Color.Moccasin;
                    }
                    else
                    {
                        dataGridView1.DefaultCellStyle.BackColor = Color.LightGoldenrodYellow;

                    }

                    label7.Visible = true;


                    /////-------------------------------------------------------------------------




                }
                catch
                {
                    MessageBox.Show("該当する表示データがありませんでした！");

                    // this.Close();
                }


            }



        }


        /// <summary>
        /// 識別ID　完全削除ルーチン
        /// </summary>
        /// <param name="foo_s_id"></param>
        /// <returns></returns>
        public string SHIKIBETSU_ID_ALL_DEL(string foo_s_id)
        {



            // SQL Server への接続を作成する。
            SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);

            //登録がるか確認
            string selectString3 = @"SELECT count([主キー]) FROM dbo.Identify_Entity_tbl WHERE [識別ID] = " + foo_s_id;


            SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

            cnnct3.Open();

            SqlDataReader reader3 = command3.ExecuteReader();


            reader3.Read();

            string WK_ID = reader3.GetValue(0).ToString();

            reader3.Close();
            cnnct3.Close();



            //登録が無いなら追加
            if (WK_ID == "0")
            {

                //MessageBox.Show("「完全削除」依頼があった【識別ID】 " + foo_s_id + " は、既に完全削除済みです！" );

                WK_ID = "「完全削除」依頼がありました【識別ID】 " + foo_s_id + " は、既に完全削除済みです！";
            }

            else

            {


                System.Data.SqlClient.SqlConnection sqlConnection1 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);

                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = @"DELETE dbo.Identify_Entity_tbl where [識別ID] = " + foo_s_id;
                cmd.Connection = sqlConnection1;


                sqlConnection1.Open();





                try
                {
                    ///////////////




                    cmd.ExecuteNonQuery();

                    sqlConnection1.Close();




                    ///////////////
                }
                catch (Exception ex)
                {



                        MessageBox.Show("エラー：[完全削除]失敗！");


                }





                ////

                // SQL Server への接続を作成する。
                SqlConnection cnnct = new SqlConnection(G.WK_SQL_connectstring);

                //登録がるか確認
                string selectString = @"SELECT count([主キー]) FROM dbo.Identify_Entity_tbl WHERE [識別ID] = " + foo_s_id;


                SqlCommand command = new SqlCommand(selectString, cnnct);

                cnnct.Open();

                SqlDataReader reader = command.ExecuteReader();


                reader.Read();

                WK_ID = "【識別ID】 " + foo_s_id + " 　として" + Environment.NewLine + Environment.NewLine + "　　登録されていた行数は　　" + WK_ID + " 行　　でしたが" + Environment.NewLine + Environment.NewLine + "　　　　現在は　　" + reader.GetValue(0).ToString() + " 行　　です";

                reader.Close();
                cnnct.Close();


            }


            return WK_ID;

        }



        private void button2_Click(object sender, EventArgs e)
        {


            button4.Visible = false;
            button5.Visible = false;
            button6.Visible = false;
            button7.Visible = false;
            button8.Visible = false;
            button9.Visible = false;
            button10.Visible = false;
            button11.Visible = false;
            button12.Visible = false;

            label5.Visible = false;
            label6.Visible = false;
            label8.Visible = false;
            label10.Visible = false;
            label11.Visible = false;
            label13.Visible = false;
            label14.Visible = false;

            this.dataGridView1.DataSource = null;

            //datagridviewの列リセット
            this.dataGridView1.Columns.Clear();

            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            comboBox1.Text = "";
            comboBox2.Text = "";

            label7.Text = "【全文検索文字】";

            comboBox2.Visible = false;



            textBox1.Text = "";
            //textBox1.Focus();
            textBox4.Focus();

            //グリッド先頭のWクリックイベントを許可
            G.WK_Form1_MOUSE_W_CLICK = 0;

            //行チェック時に、列番号を１加える処理をリセット
            G.WK_Form1_GYO_CHECK = 0;


        }






        private void button3_Click(object sender, EventArgs e)
        {

                SUB_OPEN(textBox2.Text.ToString());
  
        }



        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == -1)
            {

                //EDIT_OPEN使用中はG.WK_Form1_MOUSE_W_CLICKを　1　にする

                if (G.WK_Form1_MOUSE_W_CLICK == 0)
                {


                    if (dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString() != null)
                    {

                        //////////////////////////////////////////////////////////
                        //データ◆縦◆詳細参照　引数（　識別ID　と　表示モード　）

                        label14.Visible = true;

                        EDIT_OPEN(dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString(), 1);


                    }
                    else
                    {
                        MessageBox.Show("空白行です！");
                    }
                }


            }


                else


            {




                // グリッドを基準としたカーソル位置のポイントを取得
                Point p = dataGridView1.PointToClient(Cursor.Position);
                // 取得したポイントからHitTestでセル位置取得
                DataGridView.HitTestInfo ht = dataGridView1.HitTest(p.X, p.Y);

                //MessageBox.Show("row:" + ht.RowIndex + " col:" + ht.ColumnIndex);


                string @WK_DATA = @dataGridView1.Rows[ht.RowIndex].Cells[ht.ColumnIndex].Value.ToString();

                string WK_RETSU_NAME = dataGridView1.Columns[e.ColumnIndex].HeaderCell.Value.ToString();


                string WK_MY_SHIKIBETSU_ID = @dataGridView1.Rows[0].Cells[9].Value.ToString();
                string WK_MY_T_ID = @dataGridView1.Rows[ht.RowIndex].Cells[3].Value.ToString();
                string WK_MY_SORT = @dataGridView1.Rows[ht.RowIndex].Cells[4].Value.ToString();
                string WK_MY_UNIT = @dataGridView1.Rows[ht.RowIndex].Cells[5].Value.ToString();
                string WK_MY_F_ID = @dataGridView1.Rows[ht.RowIndex].Cells[6].Value.ToString();
                string WK_MY_F_ID_WORDS = @dataGridView1.Rows[ht.RowIndex].Cells[8].Value.ToString();

                //識別ID書き換え用だから　１行目のデータを渡す
                string WK_MY_D_ID = @dataGridView1.Rows[ht.RowIndex].Cells[9].Value.ToString();
                string WK_MY_D_ID_WORDS = @dataGridView1.Rows[ht.RowIndex].Cells[11].Value.ToString();






                //検索用
                if (WK_RETSU_NAME == @"区分" || WK_RETSU_NAME == @"種別")
                {
                    textBox4.Text = @WK_DATA.ToString();
                    textBox4.Focus();

                    button3.PerformClick();

                }




                if (G.WK_Form1_DataGridView_MOUSE_W_CLICK == 2)
                {



                    //リスト選択入力の準備
                    if (WK_RETSU_NAME == ("D_ID"))
                    {

                        //MessageBox.Show("ダブルクリック前のデータは" + Environment.NewLine + Environment.NewLine + "【　" + dataGridView1.Rows[G.WK_Form1_Cell_r].Cells[11].Value.ToString() + "　 】" + Environment.NewLine + Environment.NewLine + "です！");

                        G.WK_Form1_MY_SHIKIBETU_ID = dataGridView1.Rows[0].Cells[1].Value.ToString();

                        G.WK_Form1_USE_SWICH_FLG = "D_ID";

                        G.WK_Form1_USE_SHIKIBETU_ID = dataGridView1.Rows[0].Cells[9].Value.ToString();

                        G.WK_Form1_USE_T_ID = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[3].Value.ToString();

                        G.WK_Form1_USE_SORT = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[4].Value.ToString();

                        G.WK_Form1_USE_UNIT = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[5].Value.ToString();

                        G.WK_Form1_USE_F_ID = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[6].Value.ToString();

                        G.WK_Form1_USE_F_ID_WORDS = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[8].Value.ToString();

                        G.WK_Form1_USE_D_ID_WORDS = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[11].Value.ToString();




                        Form2 Form2 = new Form2();

                        //Form2_Read.WindowState = FormWindowState.Maximized;

                        // モーダル表示
                        Form2.ShowDialog();

                        // モードレス表示
                        //Form2_Read.Show();

                        // Form2の解放
                        //form2.Dispose();


                        //処理件数＋ダミー１件あるが、処理数を使うので問題無い
                        string[] strARG = G.WK_Form2_RETURN.Split('|');

                        for (int i = 0; i <= G.WK_Form2_RETURN_SU - 1; i++)
                        {

                            //MessageBox.Show(strARG[i]);

                            // F_ID_WORDS タブ D_ID_WORDS
                            string[] strCMB = strARG[i].Split('\t');

                            for (int r = 0; r <= this.dataGridView1.Rows.Count - 1; r++)
                            {

                                //MessageBox.Show(dataGridView1.Columns[r].HeaderCell.Value.ToString());


                                if (dataGridView1.Rows[r].Cells[8].Value.ToString() == strCMB[0] && dataGridView1.Rows[r].Cells[3].Value.ToString() == G.WK_Form1_USE_T_ID && dataGridView1.Rows[r].Cells[5].Value.ToString() == G.WK_Form1_USE_UNIT)
                                {

                                    //MessageBox.Show(dataGridView1.Rows[r].Cells[8].Value.ToString() + "|" + strCMB[0] + "|" + strCMB[1]);

                                    //◆↓の処理はうまく行かない
                                    //dataGridView1.Rows[r].Cells[9].Value = "";

                                    dataGridView1.Rows[r].Cells[11].Value = strCMB[1];
                                    dataGridView1.Rows[r].Cells[11].Style.ForeColor = Color.Blue;

                                }

                            }
                        }

                    }
                }





                //入力項目等、識別ID修正
                if (G.WK_Form1_DataGridView_MOUSE_W_CLICK == 3)
                {

                    if (textBox5.Text.ToString().Length > 0)
                    {

                        //


                        if (WK_RETSU_NAME == @"T_ID" && textBox5.Text.ToString() == "4" && @WK_DATA == "2")
                        {


                            DialogResult dr3 = MessageBox.Show("【重要】　[識別ID] " + WK_MY_SHIKIBETSU_ID + "  [T_ID] " + WK_MY_T_ID + "  [ソート] " + WK_MY_SORT + "  [ユニット] " + WK_MY_UNIT + "  [F_ID] " + WK_MY_F_ID + " 】" + Environment.NewLine + Environment.NewLine + "　この【識別ID】に該当する行データ【全部】を" + Environment.NewLine + Environment.NewLine + "◆完全削除◆しますか？", "【確認】", MessageBoxButtons.OKCancel);

                            if (dr3 == System.Windows.Forms.DialogResult.OK)
                            {

                                // string foo_koumoku, string foo_shikibetsu_id, string foo_t_id, string foo_sort, string foo_unit, string foo_f_id, string foo_new_data
                                S_U_UPDATE(@"T_ID", WK_MY_SHIKIBETSU_ID, WK_MY_T_ID, WK_MY_SORT, WK_MY_UNIT, WK_MY_F_ID, WK_MY_F_ID_WORDS, WK_MY_D_ID, WK_MY_D_ID_WORDS, textBox5.Text.ToString());
                            }
                            else
                            {
                                MessageBox.Show("該当行の完全削除を【中止】しました！");
                            }


                        }


                        if (WK_RETSU_NAME == @"ソート")
                        {

                            // string foo_koumoku, string foo_shikibetsu_id, string foo_t_id, string foo_sort, string foo_unit, string foo_f_id, string foo_new_data
                            S_U_UPDATE(@"ソート", WK_MY_SHIKIBETSU_ID, WK_MY_T_ID, WK_MY_SORT, WK_MY_UNIT, WK_MY_F_ID, WK_MY_F_ID_WORDS, WK_MY_D_ID, WK_MY_D_ID_WORDS, textBox5.Text.ToString());

                        }

                        //
                        if (WK_RETSU_NAME == @"ユニット")
                        {

                            // string foo_koumoku, string foo_shikibetsu_id, string foo_t_id, string foo_sort, string foo_unit, string foo_f_id, string foo_new_data
                            S_U_UPDATE(@"ユニット", WK_MY_SHIKIBETSU_ID, WK_MY_T_ID, WK_MY_SORT, WK_MY_UNIT, WK_MY_F_ID, WK_MY_F_ID_WORDS, WK_MY_D_ID, WK_MY_D_ID_WORDS, textBox5.Text.ToString());

                        }

                        //
                        if (WK_RETSU_NAME == @"F_ID_WORDS")
                        {

                            // string foo_koumoku, string foo_shikibetsu_id, string foo_t_id, string foo_sort, string foo_unit, string foo_f_id, string foo_new_data
                            S_U_UPDATE(@"F_ID_WORDS", WK_MY_SHIKIBETSU_ID, WK_MY_T_ID, WK_MY_SORT, WK_MY_UNIT, WK_MY_F_ID, WK_MY_F_ID_WORDS, WK_MY_D_ID, WK_MY_D_ID_WORDS, textBox5.Text.ToString());

                        }

                        //
                        if (WK_RETSU_NAME == @"D_ID_WORDS" && ht.RowIndex == 0)
                        {

                            // string foo_koumoku, string foo_shikibetsu_id, string foo_t_id, string foo_sort, string foo_unit, string foo_f_id, string foo_new_data
                            S_U_UPDATE(@"D_ID_WORDS", WK_MY_SHIKIBETSU_ID, WK_MY_T_ID, WK_MY_SORT, WK_MY_UNIT, WK_MY_F_ID, WK_MY_F_ID_WORDS, WK_MY_D_ID, WK_MY_D_ID_WORDS, textBox5.Text.ToString());

                        }

                    }
                }






                ///

                int WK_NO_FLG_ = 0;

                if (G.WK_Form1_DataGridView_MOUSE_W_CLICK != 3)
                {

                    if (WK_RETSU_NAME.IndexOf("D_ID_WORDS") >= 0 || WK_RETSU_NAME.IndexOf("リンク") >= 0 || WK_RETSU_NAME.IndexOf("Web") >= 0 || WK_RETSU_NAME.IndexOf("Mail") >= 0 || WK_RETSU_NAME.IndexOf("web") >= 0 || WK_RETSU_NAME.IndexOf("mail") >= 0 || WK_RETSU_NAME.IndexOf("URL") >= 0 || WK_RETSU_NAME.IndexOf("url") >= 0 || WK_RETSU_NAME.IndexOf("Url") >= 0)
                    {


                        try
                        {



                            if (WK_DATA.ToString().Substring(0, 4) == @"http")
                            {




                                // どのボタンを選択したかを判断する
                                if (MessageBox.Show("【　" + WK_DATA + " 】" + Environment.NewLine + Environment.NewLine + "　既定のブラウザで開きますか？", "【確認】", MessageBoxButtons.OKCancel) == DialogResult.OK)
                                {


                                    //標準のブラウザで開いて表示する
                                    System.Diagnostics.Process.Start(@WK_DATA);

                                    WK_NO_FLG_ = 1;

                                }
                                else
                                {
                                    //MessageBox.Show("[キャンセル] ボタンを選択しましたので【中止】します");

                                    WK_NO_FLG_ = 1;
                                }



                            }




                            if (WK_DATA.IndexOf("@") >= 1 && @WK_DATA.IndexOf(".") >= 3)
                            {
                                // どのボタンを選択したかを判断する
                                if (MessageBox.Show("【　" + @WK_DATA + " 】" + Environment.NewLine + Environment.NewLine + "　このアドレスでメールを作成を開始しますか？", "【確認】", MessageBoxButtons.OKCancel) == DialogResult.OK)
                                {


                                    //メールする
                                    System.Diagnostics.Process.Start(@"mailto:" + WK_DATA + "?subject=ご連絡");

                                    WK_NO_FLG_ = 1;

                                }
                                else
                                {
                                    //MessageBox.Show("[キャンセル] ボタンを選択しましたので【中止】します");

                                    WK_NO_FLG_ = 1;
                                }
                            }


                        }


                        catch
                        {
                            /// ◆コメントアウトが必要◆

                            //MessageBox.Show("表示するデータがありませんでした！");

                        }
                    }

                }



                //　2　データ入力モード
                if (G.WK_Form1_DataGridView_MOUSE_W_CLICK <= 2 && WK_NO_FLG_ == 0 && @WK_DATA.Length > 1)
                {

                    if (@WK_DATA.IndexOf("http") >= 0 || @WK_DATA.Substring(0, 2) == "\\\\")
                    {
                        DialogResult dr = MessageBox.Show("【　" + @WK_DATA + " 】" + Environment.NewLine + Environment.NewLine + "　これを開きますか？" + Environment.NewLine + Environment.NewLine + "[いいえ] → フォルダ表示", "【確認】", MessageBoxButtons.YesNoCancel);

                        if (dr == System.Windows.Forms.DialogResult.Yes)
                        {

                            System.Diagnostics.Process.Start(@WK_DATA);


                        }
                        else if (dr == System.Windows.Forms.DialogResult.No)
                        {

                            MessageBox.Show("[いいえ] ボタンを選択しましたので【フォルダ】を表示します");

                            try
                            {

                                @WK_DATA = @WK_DATA.Substring(0, @WK_DATA.LastIndexOf(@"\"));

                                //MessageBox.Show(@WK_DATA.LastIndexOf(@"\").ToString());
                                //MessageBox.Show(@WK_DATA);


                                System.Diagnostics.Process.Start(@WK_DATA);

                            }
                            catch
                            {
                                MessageBox.Show("該当する表示データがありませんでした！");
                            }
                        }
                        //else
                        //{
                        //    MessageBox.Show("[キャンセル] ボタンを選択しましたので【中止】します");
                        //}
                    }
                    else
                    {
                        if (G.WK_Form1_DataGridView_MOUSE_W_CLICK <= 1 && textBox5.Text.Length == 0)
                        {

                            DialogResult dr2 = MessageBox.Show("【　" + @WK_DATA + " 】" + Environment.NewLine + Environment.NewLine + "　をクリップボードへコピーしますか？", "【確認】", MessageBoxButtons.OKCancel);

                            if (dr2 == System.Windows.Forms.DialogResult.OK)
                            {


                                Clipboard.SetDataObject(@WK_DATA);

                                MessageBox.Show("[貼り付け]　が使えます！");

                            }
                            //else
                            //{
                            //    MessageBox.Show("[キャンセル] ボタンを選択しましたので【中止】します");
                            //}
                        }

                    }

                }

            }


        }





        /// <summary>
        /// 同じ【識別ID】のソート、ユニットを一括変更
        /// </summary>
        public void S_U_UPDATE(string foo_koumoku, string foo_shikibetsu_id, string foo_t_id, string foo_sort, string foo_unit, string foo_f_id, string foo_f_id_words, string foo_d_id, string foo_d_id_words, string foo_new_data)
        {


            label13.Visible = false;

            string WK_before_data = string.Empty;

            string WK_OK = "変更予定の【識別ID】 " + foo_shikibetsu_id + Environment.NewLine + Environment.NewLine + "【 " + foo_koumoku + " 】:　" + WK_before_data + Environment.NewLine + Environment.NewLine + "　新データ:　" + foo_new_data + Environment.NewLine + Environment.NewLine + " 　この値で【 更新 】する場合　【　はい　】　を選択" + Environment.NewLine + Environment.NewLine + "　◆中止◆　なら　→　【　キャンセル　】を選択して下さい！";

            switch (@foo_koumoku)
            {
                case @"T_ID":

                    WK_OK = "最終確認です！　【識別ID】 " + foo_shikibetsu_id + "　の指定行を　◆完全削除◆　します！" + Environment.NewLine + Environment.NewLine + " 　【 削除 】する場合　【　はい　】　を選択" + Environment.NewLine + Environment.NewLine + "　◆中止◆　なら　→　【　キャンセル　】を選択して下さい！";

                    break;

                case @"ソート":
                    WK_before_data = foo_sort;
                    break;

                case @"ユニット":
                    WK_before_data = foo_unit;
                    break;

                case @"F_ID_WORDS":
                    WK_before_data = foo_f_id_words;
                    break;

                case @"D_ID_WORDS":
                    WK_before_data = foo_d_id_words;
                    break;

                default:
                    // 初期設定
                    break;
            }

            //MessageBox.Show(foo_koumoku + "|" + foo_shikibetsu_id + "|" + foo_t_id + "|" + foo_sort + "|" + foo_unit + "|" + foo_f_id + "|" + foo_f_id_words + "|"+ foo_new_data);


            // どのボタンを選択したかを判断する
            if (MessageBox.Show(WK_OK, "【確認】", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {


                // SQL Server への接続を作成する。
                SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);



                string selectString3 = @"SELECT DISTINCT [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = " + foo_shikibetsu_id + " and D_ID > 999 ";


                SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                cnnct3.Open();

                SqlDataReader reader3 = command3.ExecuteReader();

                int foo_cunt = 0;


                if (reader3.HasRows)
                {

                    while (reader3.Read())
                    {

                        //変更該当　識別ID　調査
                        //MessageBox.Show( reader3.GetValue(0).ToString());

                        foo_cunt = foo_cunt + 1;



                        System.Data.SqlClient.SqlConnection sqlConnection2 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


                        System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
                        cmd2.CommandType = System.Data.CommandType.Text;
                        cmd2.Connection = sqlConnection2;


                        sqlConnection2.Open();


                        //MessageBox.Show(foo_koumoku + "|" + foo_shikibetsu_id + "|" + foo_t_id + "|" + foo_sort + "|" + foo_unit + "|" + foo_f_id + "|" + foo_f_id_words + "|" + foo_new_data);



                        try
                        {
                            ///////////////


                            switch (@foo_koumoku)
                        {
                            case @"ソート":
                                cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl SET [ソート] = " + foo_new_data + " where [識別ID] = " + reader3.GetValue(0).ToString() + " and [T_ID] = " + foo_t_id + " and [ソート] = " + foo_sort + " and [ユニット] =" + foo_unit + " and [F_ID] = " + foo_f_id;
                                break;

                            case @"ユニット":
                                cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl SET [ユニット] = " + foo_new_data + " where [識別ID] = " + reader3.GetValue(0).ToString() + " and [T_ID] = " + foo_t_id + " and [ソート] = " + foo_sort + " and [ユニット] =" + foo_unit + " and [F_ID] = " + foo_f_id;
                                break;

                            case @"F_ID_WORDS":

                                var PICKUP_F_ID = WORDS_ID_CHECK(foo_new_data);

                                cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl SET [F_ID] = " + PICKUP_F_ID + " , [F_ID_WORDS] = '" + foo_new_data + "' where [識別ID] = " + reader3.GetValue(0).ToString() + " and [T_ID] = " + foo_t_id + " and [ソート] = " + foo_sort + " and [ユニット] =" + foo_unit + " and [F_ID] = " + foo_f_id;
                                break;

                            case @"D_ID_WORDS":

                                var PICKUP_D_ID = WORDS_ID_CHECK(foo_new_data);

                                cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl SET [D_ID] = " + PICKUP_D_ID + " , [D_ID_WORDS] = '" + foo_new_data + "' where [識別ID] = " + reader3.GetValue(0).ToString() + " and [T_ID] = " + foo_t_id + " and [ソート] = " + foo_sort + " and [ユニット] =" + foo_unit + " and [F_ID] = " + foo_f_id + " and [D_ID] = " + foo_d_id;
                                break;


                            case @"T_ID":

                                cmd2.CommandText = @"DELETE dbo.Identify_Entity_tbl where [識別ID] = " + reader3.GetValue(0).ToString() + " and [T_ID] = " + foo_t_id + " and [ソート] = " + foo_sort + " and [ユニット] =" + foo_unit + " and [F_ID] = " + foo_f_id;

                                break;


                            default:
                                // 初期設定
                                break;
                        }


                        //MessageBox.Show(cmd2.CommandText);

                        cmd2.ExecuteNonQuery();


                        sqlConnection2.Close();



                            MessageBox.Show("識別名ID 【 " + foo_shikibetsu_id + " 】 " + Environment.NewLine + Environment.NewLine + "処理した件数は　【 " + foo_cunt.ToString() + " 】件です" + Environment.NewLine + Environment.NewLine + "対象識別名は 【 " + dataGridView1.Rows[0].Cells[11].Value.ToString() + " 】です");


                            ///////////////
                        }
                        catch 
                        {


                                MessageBox.Show("エラー：失敗！");


                        }


                        ///////////////

                    }
                }


                reader3.Close();
                cnnct3.Close();




                ////



                //「クリア」ボタンを押す
                //button2.PerformClick();

                if (foo_koumoku == @"D_ID_WORDS" || foo_koumoku == @"T_ID")
                {
                    button2.PerformClick();
                }
                else
                {

                    //////////////////////////////////////////////////////////
                    //データ◆縦◆詳細参照　引数（　識別ID　と　表示モード　）

                    //MessageBox.Show(dataGridView1.Rows[0].Cells[1].Value.ToString());
                    EDIT_OPEN(dataGridView1.Rows[0].Cells[1].Value.ToString(), 1);
                }

            }
            else
            {
                MessageBox.Show("[キャンセル] ボタンを選択しましたので【識別ID】 " + foo_shikibetsu_id + "の一括変更は【 中止 】します");

                //「クリア」ボタンを押す
                button2.PerformClick();

            }


        }



        /// <summary>
        /// メンテナンス画面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        private void button14_Click(object sender, EventArgs e)
        {


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



            // SQL Server への接続を作成する。
            SqlConnection cnnct = new SqlConnection(G.WK_SQL_connectstring);

            // ストアドプロシージャの名前を指定してDataAdapterのインスタンスを作成する。
            SqlDataAdapter AddTableDataAdapter = new SqlDataAdapter(@"dbo.S_ID_DEL_LIST", cnnct);

            // コマンドの種類をStoredProcedureに設定する。
            AddTableDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            // 【重要】
            AddTableDataAdapter.SelectCommand.Parameters.Clear();




            // レコードを保存するための新しい DataSet を作成する。
            DataSet DS = new DataSet();



            // DataSet に返される行を設定する。
            AddTableDataAdapter.Fill(DS);



            this.dataGridView1.DataSource = DS.Tables[0];




            // コネクションクローズ
            cnnct.Close();

            //これをOFFにしないと表示が遅くなる
            //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する　→　OFF
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            //これをOFFにしないと表示が遅くなる
            //ヘッダーとすべてのセルの内容に合わせて、行の高さを自動調整する　→　OFF
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            MessageBox.Show("現在使われていない【WORDS】が表示されました");

            // どのボタンを選択したかを判断する
            if (MessageBox.Show("使われていない【WORDS】が表示されていれば削除しますし" + Environment.NewLine + Environment.NewLine + "もしも起動時に作業ファイルの消し残しがあれば削除します！", "【削除確認】", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {

                //一旦クリア
                this.dataGridView1.DataSource = null;


                // SQL Server への接続を作成する。
                SqlConnection cnnct_del = new SqlConnection(G.WK_SQL_connectstring);

                // ストアドプロシージャの名前を指定してDataAdapterのインスタンスを作成する。
                SqlCommand dbCommand = new SqlCommand(@"dbo.S_ID_DEL_LIST_RUN", cnnct_del);

                // コマンドの種類をStoredProcedureに設定する。
                dbCommand.CommandType = CommandType.StoredProcedure;

                dbCommand.Connection.Open();

                dbCommand.ExecuteNonQuery();

                // コネクションクローズ
                cnnct_del.Close();


                //MessageBox.Show("確認の為もう一度【メンテナンス】ボタンを押して下さい");

            }
            else
            {
                MessageBox.Show("[いいえ] ボタンを選択しましたのでメンテ作業を中止します");

                //一旦クリア
                this.dataGridView1.DataSource = null;
            }

        }




        /// <summary>
        /// データ完全削除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button7_Click(object sender, EventArgs e)
        {

            //SE入力モードに戻す
            G.WK_Form1_Read = 0;

            if (dataGridView1.Columns[1].HeaderCell.Value.ToString() == "識別ID")
            {

                // どのボタンを選択したかを判断する
                if (MessageBox.Show("【識別ID】 " + dataGridView1.Rows[0].Cells[1].Value.ToString() + " 　を" + Environment.NewLine + Environment.NewLine + "　【 完全削除 】しますか？", "【最終確認】", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {

                    string WK_MSG = SHIKIBETSU_ID_ALL_DEL(dataGridView1.Rows[0].Cells[1].Value.ToString());

                    MessageBox.Show(WK_MSG);

                    string WK_CP = comboBox1.Text;
                    string WK_CP2 = textBox2.Text;
                    string WK_CP3 = textBox4.Text;

                    //「クリア」ボタンを押す
                    button2.PerformClick();

                    //登録後、識別名は保持

                    comboBox1.Text = WK_CP;
                    textBox2.Text = WK_CP2;
                    textBox4.Text = WK_CP3;

                    textBox1.Focus();

                    button2.PerformClick();


                }
                else
                {
                    MessageBox.Show("[キャンセル] ボタンを選択しましたので【 完全削除 】を中止します");
                }

            }

        }


        /// <summary>
        /// データ入力・修正
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button8_Click(object sender, EventArgs e)
        {

            //自分のボタンを非表示にする
            button8.Visible = false;

            label14.Visible = false;

            //D_ID　チェックを表示
            button9.Visible = true;

            //新データ追加　チェックを表示
            button11.Visible = true;

            //combo2
            comboBox2.Visible = true;


            //////////////////////////////////////////////////////////
            //データ◆縦◆詳細参照　引数（　識別ID　と　入力・修正モード　）

            EDIT_OPEN(dataGridView1.Rows[0].Cells[0].Value.ToString(), 2);



        }



        private void button9_Click(object sender, EventArgs e)
        {


            //内容チェック、D_ID調査




            //先頭へ列へ移動
            dataGridView1.CurrentCell = dataGridView1[0, 0];


            int foo_id = 0;

            int foo_color_flg = 0;

            // 
            for (int r = 0; r <= this.dataGridView1.Rows.Count - 1; r++)
            {


                if (dataGridView1.Rows[r].Cells[11].Value.ToString().Length != dataGridView1.Rows[r].Cells[11].Value.ToString().Trim().Length)
                {

                    MessageBox.Show("【" + dataGridView1.Rows[r].Cells[11].Value.ToString() + "】データ前後の空白を" + Environment.NewLine + Environment.NewLine + "【" + dataGridView1.Rows[r].Cells[11].Value.ToString().Trim() + "】に変更します！" + Environment.NewLine + Environment.NewLine + "　※半角のかわりにはアンダーバー等の記号をお使い下さい！");
                    dataGridView1.Rows[r].Cells[11].Value = dataGridView1.Rows[r].Cells[11].Value.ToString().Trim();

                    dataGridView1.Rows[r].Cells[9].Style.ForeColor = Color.Green;
                    foo_color_flg = 1;

                }


                if (dataGridView1.Rows[r].Cells[11].Value.ToString().IndexOf("[") >= 0 || dataGridView1.Rows[r].Cells[11].Value.ToString().IndexOf("]") >= 0)
                {

                    if (dataGridView1.Rows[r].Cells[11].Value.ToString().IndexOf("]", dataGridView1.Rows[r].Cells[11].Value.ToString().IndexOf("[") + 1) >= 0)
                    {
                        MessageBox.Show("【" + dataGridView1.Rows[r].Cells[11].Value.ToString() + "】データの [ と ] を" + Environment.NewLine + Environment.NewLine + "　" + dataGridView1.Rows[r].Cells[11].Value.ToString().Replace("[", "【").Replace("]", "】") + "　に変更します！" + Environment.NewLine + Environment.NewLine + "　※半角のかわりに全角のスミカッコに置換します！");
                        dataGridView1.Rows[r].Cells[11].Value = dataGridView1.Rows[r].Cells[11].Value.ToString().Replace("[", "【").Replace("]", "】");

                        dataGridView1.Rows[r].Cells[9].Style.ForeColor = Color.Green;
                        foo_color_flg = 1;
                    }
                }




                if (dataGridView1.Rows[r].Cells[11].Value.ToString().IndexOf("'") >= 0)
                {
                    MessageBox.Show("【" + dataGridView1.Rows[r].Cells[11].Value.ToString() + "】データの ' を" + Environment.NewLine + Environment.NewLine + "　" + dataGridView1.Rows[r].Cells[11].Value.ToString().Replace("'", "’") + "　に変更します！" + Environment.NewLine + Environment.NewLine + "　※半角のかわりに全角へ置換します！");
                    dataGridView1.Rows[r].Cells[11].Value = dataGridView1.Rows[r].Cells[11].Value.ToString().Replace("'", "’");

                    dataGridView1.Rows[r].Cells[9].Style.ForeColor = Color.Green;
                    foo_color_flg = 1;
                }



                //D_IDのチェック
                foo_id = WORDS_ID_CHECK(dataGridView1.Rows[r].Cells[11].Value.ToString());

                if ((dataGridView1.Rows[r].Cells[9].Value.ToString() != foo_id.ToString()) && foo_id >= 0)
                {
                    //相違してたら更新
                    dataGridView1.Rows[r].Cells[9].Value = foo_id;

                    if (foo_color_flg != 1)
                    {
                        dataGridView1.Rows[r].Cells[9].Style.ForeColor = Color.Blue;
                    }
                    else
                    {
                        foo_color_flg = 0;
                    }

                }
                else
                {
                    dataGridView1.Rows[r].Cells[9].Style.ForeColor = Color.Empty;
                }


            }


            MessageBox.Show("【D_ID】のチェックが終了しました！" + Environment.NewLine + Environment.NewLine + "　データ削除（「空白」にした）の確定は" + Environment.NewLine + Environment.NewLine + "　③【更新】or【破棄】　ボタンを押して確定か破棄を選択して下さい！");


            //更新or破棄ボタンを表示
            button10.Visible = true;

            button10.Focus();



        }






        /// <summary>
        /// 更新または破棄
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button10_Click(object sender, EventArgs e)
        {

            //SE入力モードに戻す
            G.WK_Form1_Read = 0;

            // どのボタンを選択したかを判断する
            if (MessageBox.Show("【識別ID】 " + dataGridView1.Rows[0].Cells[1].Value.ToString() + Environment.NewLine + Environment.NewLine + " 　この画面の値で【 更新 】する場合　【　はい　】　を選択" + Environment.NewLine + Environment.NewLine + "　◆廃棄◆　なら　→　【　キャンセル　】を選択して下さい！", "【最終確認】", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {



                System.Data.SqlClient.SqlConnection sqlConnection2 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


                System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
                cmd2.CommandType = System.Data.CommandType.Text;
                cmd2.Connection = sqlConnection2;


                sqlConnection2.Open();

                int foo_i = 0;

                // 1 から処理
                for (int r = 1; r <= this.dataGridView1.Rows.Count - 1; r++)
                {

                    if (dataGridView1.Rows[r].Cells[9].Value.ToString().Length > 0 && dataGridView1.Rows[r].Cells[9].Value != null)
                    {



                        if (dataGridView1.Rows[r].Cells[11].Value.ToString().Length < 1)
                        {

                            if (MessageBox.Show("【　" + dataGridView1.Rows[r].Cells[8].Value.ToString() + " 】　のデータが空白に変更されたようですが" + Environment.NewLine + Environment.NewLine + "「空白」にしてよろしいですか？", "【確認】", MessageBoxButtons.OKCancel) == DialogResult.OK)
                            {


                                //空白処理をする
                                cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl set[D_ID] = Null , [D_ID_WORDS] = '' where [主キー] = " + dataGridView1.Rows[r].Cells[0].Value.ToString();

                                cmd2.ExecuteNonQuery();

                                foo_i = foo_i + 1;

                            }
                            else
                            {
                                MessageBox.Show("[キャンセル] ボタンを選択しましたので【　" + dataGridView1.Rows[r].Cells[8].Value.ToString() + "　】は 「空白」にしません！");
                            }

                        }
                        else
                        {


                            cmd2.CommandText = @"UPDATE dbo.Identify_Entity_tbl set[D_ID] = " + dataGridView1.Rows[r].Cells[9].Value.ToString() + " , [D_ID_WORDS] = '" + dataGridView1.Rows[r].Cells[11].Value.ToString() + "' where [主キー] = " + dataGridView1.Rows[r].Cells[0].Value.ToString();

                            cmd2.ExecuteNonQuery();

                            foo_i = foo_i + 1;

                        }




                    }



                }

                sqlConnection2.Close();

                ////

                MessageBox.Show("【識別名】と「空白」以外のデータ　" + foo_i.ToString() + " 行　を更新しました！");

                string WK_CP = comboBox1.Text;
                string WK_CP2 = textBox2.Text;
                string WK_CP3 = textBox4.Text;

                //「クリア」ボタンを押す
                button2.PerformClick();

                //登録後、識別名は保持

                comboBox1.Text = WK_CP;
                textBox2.Text = WK_CP2;
                textBox4.Text = WK_CP3;

                textBox1.Focus();

                button3.PerformClick();

            }
            else
            {
                MessageBox.Show("[キャンセル] ボタンを選択しましたので画面を【 廃棄 】します");

                //「クリア」ボタンを押す
                button2.PerformClick();

            }


        }


        /// <summary>
        /// 入力項目だけ複製して新データ作成
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        private void button11_Click(object sender, EventArgs e)
        {




            System.Data.SqlClient.SqlConnection sqlConnection1 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS],[D_ID],[D_ID_WORDS]) ";
            cmd.CommandText = cmd.CommandText + @"VALUES (0,0,0,4,'識別名'," + dataGridView1.Rows[0].Cells[9].Value.ToString();
            cmd.CommandText = cmd.CommandText + @",'" + dataGridView1.Rows[0].Cells[11].Value.ToString() + "')";
            cmd.CommandText = cmd.CommandText + @";SELECT CAST(SCOPE_IDENTITY() AS int)";
            cmd.Connection = sqlConnection1;


            sqlConnection1.Open();

            //主キー（識別ID）取得
            var SHIKIBETSU_ID = (int)cmd.ExecuteScalar();
            //MessageBox.Show("取得した【識別ID】　" + SHIKIBETSU_ID);


            cmd.CommandText = @"UPDATE dbo.Identify_Entity_tbl set [識別ID] = " + SHIKIBETSU_ID + " where [主キー] = " + SHIKIBETSU_ID;
            cmd.ExecuteNonQuery();

            sqlConnection1.Close();


            //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する
            this.dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            //この↑までが先頭行の処理


            System.Data.SqlClient.SqlConnection sqlConnection2 = new System.Data.SqlClient.SqlConnection(G.WK_SQL_connectstring);


            System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.Connection = sqlConnection2;

            sqlConnection2.Open();

            // どのボタンを選択したかを判断する
            if (MessageBox.Show("今から作成する新規データは、このデータ欄を【複製】しますか？", "新規作成データの確認", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {




                try
                {
                    ///////////////


                    for (int r = 1; r <= this.dataGridView1.Rows.Count - 1; r++)
                {


                    if (dataGridView1.Rows[r].Cells[9].Value.ToString().Length > 0)
                    {

                        cmd2.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([識別ID],[T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS],[D_ID],[D_ID_WORDS]) VALUES (" + SHIKIBETSU_ID + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[3].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[4].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[5].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[6].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + "'" + dataGridView1.Rows[r].Cells[8].Value.ToString() + "' , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[9].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + "'" + dataGridView1.Rows[r].Cells[11].Value.ToString() + "' )";
                    }
                    else
                    {

                        cmd2.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([識別ID],[T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS]) VALUES (" + SHIKIBETSU_ID + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[3].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[4].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[5].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[6].Value.ToString() + " , ";
                        cmd2.CommandText = cmd2.CommandText + "'" + dataGridView1.Rows[r].Cells[8].Value.ToString() + "' )";

                    }

                    cmd2.ExecuteNonQuery();

                }


                    MessageBox.Show("データ欄を[複製]して新規作成しました" + Environment.NewLine + Environment.NewLine + "データ欄を 【修正】してお使い下さい！");


                    ///////////////
                }
                catch 
                {


                        MessageBox.Show("エラー：[複製]新規作成失敗！");

                }


                ///////////////


            }
            else
            {




                try
                {
                    ///////////////


                    for (int r = 1; r <= this.dataGridView1.Rows.Count - 1; r++)
                {

                    cmd2.CommandText = @"INSERT INTO  dbo.Identify_Entity_tbl ([識別ID],[T_ID],[ソート],[ユニット],[F_ID],[F_ID_WORDS]) VALUES (" + SHIKIBETSU_ID + " , ";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[3].Value.ToString() + " , ";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[4].Value.ToString() + " , ";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[5].Value.ToString() + " , ";
                    cmd2.CommandText = cmd2.CommandText + dataGridView1.Rows[r].Cells[6].Value.ToString() + " , ";
                    cmd2.CommandText = cmd2.CommandText + "'" + dataGridView1.Rows[r].Cells[8].Value.ToString() + "' )";

                    cmd2.ExecuteNonQuery();

                }



                    MessageBox.Show("データ欄は[空白]で新規作成しました");
                    ///////////////
                }
                catch (Exception ex)
                {

                    MessageBox.Show("エラー：[空白]新規作成失敗！");


                }


                ///////////////


            }


            sqlConnection2.Close();


            ////

            MessageBox.Show("識別名 【 " + dataGridView1.Rows[0].Cells[11].Value.ToString() + " 】 を" + Environment.NewLine + "【識別ID】　" + SHIKIBETSU_ID + "　として登録しました！" + Environment.NewLine + "◆必要なら◆データを入力してください！");

            //datagridviewの列リセット
            //this.dataGridView1.Columns.Clear();


            //一旦クリア
            this.dataGridView1.DataSource = null;

            EDIT_OPEN(SHIKIBETSU_ID.ToString(), 2);

            //button2.PerformClick();


        }



        /// <summary>
        /// 行追加
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button12_Click(object sender, EventArgs e)
        {


            //SE入力モードに戻す
            G.WK_Form1_Read = 0;

            //自分のボタンを非表示にする
            button12.Visible = false;

            //新データ追加　を表示
            button4.Visible = true;

            //新データ用ラベル
            label11.Visible = true;

            label14.Visible = false;

            //行削除ラベル
            label13.Visible = true;

            //新データ用
            textBox5.Visible = true;

            //データ　チェックを表示
            button5.Visible = true;

            //入力・修正　チェックを非表示
            button8.Visible = false;

            //行チェック時に、列番号を１加える為
            G.WK_Form1_GYO_CHECK = 1;

            //行追加時は非表示
            comboBox2.Visible = false;

            //////////////////////////////////////////////////////////
            //データ◆縦◆詳細参照　引数（　識別ID　と　入力・修正モード　）



            EDIT_OPEN(dataGridView1.Rows[0].Cells[1].Value.ToString(), 3);

        }




        //絞り込みのクリアボタン
        private void button13_Click(object sender, EventArgs e)
        {
            string WK_CP = comboBox1.Text;
            string WK_CP2 = textBox2.Text;


            //「クリア」ボタンを押す
            button2.PerformClick();

            //登録後、識別名は保持

            comboBox1.Text = WK_CP;
            textBox2.Text = WK_CP2;
            textBox4.Text = "";

            textBox4.Focus();

            if (WK_CP2.Length > 0)
            {
                button3.PerformClick();
            }
        }







        /// <summary>
        /// 
        /// </summary>
        public void EDIT_OPEN(string foo_row, int foo_view)
        {

            try
            {

                label10.Visible = false;

                //◆これを追加しておく◆：using System.Data.SqlClient;


                //グリッド先頭のWクリックイベントを禁止
                G.WK_Form1_MOUSE_W_CLICK = 1;


                //マウスカーソル待機状態
                Cursor.Current = Cursors.WaitCursor;


                //datagridviewの列リセット
                this.dataGridView1.Columns.Clear();


                //一旦クリア
                this.dataGridView1.DataSource = null;






                ////DataGridView1にユーザーが新しい行を追加できないようにする
                //dataGridView1.AllowUserToAddRows = false;





                //これをOFFにしないと表示が遅くなる
                //ヘッダーとすべてのセルの内容に合わせて、列の幅を自動調整する　→　OFF
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.None;

                //これをOFFにしないと表示が遅くなる
                //ヘッダーとすべてのセルの内容に合わせて、行の高さを自動調整する　→　OFF
                dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.None;



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
                AddTableDataAdapter.SelectCommand.Parameters[@"@P1"].Value = int.Parse(foo_row);
                AddTableDataAdapter.SelectCommand.Parameters[@"@P2"].Value = 0;
                // 検索する値をパラメータに代入する。
                AddTableDataAdapter.SelectCommand.Parameters[@"@P3"].Value = "0:," + @textBox4.Text.ToString();


                // レコードを保存するための新しい DataSet を作成する。
                DataSet DS = new DataSet();

                // DataSet に返される行を設定する。
                AddTableDataAdapter.Fill(DS);

                this.dataGridView1.DataSource = DS.Tables[0];

                // コネクションクローズ
                cnnct.Close();



                /////-------------------------------------------------------------------------
                switch (foo_view)
                {
                    case 1:
                        // datagridviewの先頭行や、指定列の書き込み禁止処理
                        G.WK_Form1_DataGridView_MOUSE_W_CLICK = 1;
                        DATAGRIDVIEW_LOCK_CELLS(1);
                        break;

                    case 2:
                        // datagridviewの先頭行や、指定列の書き込み禁止処理
                        G.WK_Form1_DataGridView_MOUSE_W_CLICK = 2;
                        DATAGRIDVIEW_LOCK_CELLS(2);
                        break;

                    case 3:
                        // datagridviewの先頭行や、指定列の書き込み禁止処理
                        G.WK_Form1_DataGridView_MOUSE_W_CLICK = 3;
                        DATAGRIDVIEW_LOCK_CELLS(3);
                        break;

                    default:
                        G.WK_Form1_DataGridView_MOUSE_W_CLICK = 0;
                        // 初期設定
                        break;
                }


                ///マウスカーソル元に戻す
                Cursor.Current = Cursors.Default;

                cnnct.Close();

            }
            catch
            {
                MessageBox.Show("該当する表示データがありませんでした！");

                // this.Close();
            }

        }





        private void comboBox2_SelectedValueChanged(object sender, EventArgs e)
        {
            dataGridView1.Rows[G.WK_Form1_Cell_r].Cells[11].Value = comboBox2.Text;

            //MessageBox.Show(G.WK_Form1_Cell_r + "|" + comboBox2.Text);
        }


        private void textBox4_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                button3.PerformClick();
            }
        }

        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                comboBox1.Focus();
            }
        }



        private void comboBox1_DropDownClosed(object sender, EventArgs e)
        {
            try
            {
                textBox2.Text = comboBox1.SelectedValue.ToString();

                button3.PerformClick();
            }
            catch
            {
                MessageBox.Show("該当する表示データがありませんでした！");
            }
        }



        private void comboBox2_Enter(object sender, EventArgs e)
        {

            ////現在のセルの値を表示
            //Console.WriteLine(dataGridView1.CurrentCell.Value);
            ////現在のセルの列インデックスを表示
            //Console.WriteLine(dataGridView1.CurrentCell.ColumnIndex);
            ////現在のセルの行インデックスを表示
            //Console.WriteLine(dataGridView1.CurrentCell.RowIndex);


            string @WK_DATA = @dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[dataGridView1.CurrentCell.ColumnIndex].Value.ToString();

            string WK_RETSU_NAME = dataGridView1.Columns[dataGridView1.CurrentCell.ColumnIndex].HeaderCell.Value.ToString();


            ///　データ入力モード

            if (G.WK_Form1_DataGridView_MOUSE_W_CLICK == 2)
            {



                //コンボボックス２の準備
                if (WK_RETSU_NAME == ("D_ID_WORDS"))
                {

                    //
                    //文字が空ならコンボ２を使う
                    //
                    //if (dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[11].Value.ToString().Length < 1)
                    //{
                    //MessageBox.Show("ダブルクリック前のデータは" + Environment.NewLine + Environment.NewLine + "【　" + dataGridView1.Rows[G.WK_Form1_Cell_r].Cells[11].Value.ToString() + "　 】" + Environment.NewLine + Environment.NewLine + "です！");

                    string WK_USE_SHIKIBETU_ID = dataGridView1.Rows[0].Cells[9].Value.ToString();

                    string WK_USE_F_ID = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[6].Value.ToString();

                    string WK_USE_F_ID_WORDS = dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[8].Value.ToString();

                    //MessageBox.Show(WK_USE_SHIKIBETU_ID + "|" + WK_USE_F_ID);


                    //◆◆◆◆
                    //◆重要◆　実際に表示されているカラム位置を記憶
                    //◆◆◆◆
                    //　ゆえに行番号のみ保持
                    /////////////////////////////////////////////////
                    G.WK_Form1_Cell_r = dataGridView1.CurrentCell.RowIndex;


                    //ラベルに選択項目を表示
                    label8.Text = WK_USE_F_ID_WORDS;
                    label8.BackColor = Color.LightSalmon;


                    string selectString3 = "";


                    // SQL Server への接続を作成する。
                    SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);



                    //string selectString3 = @"SELECT DISTINCT [D_ID],[D_ID_WORDS] FROM dbo.Identify_Entity_tbl WHERE [識別ID] IN (select DISTINCT [識別ID] from dbo.Identify_Entity_tbl where [F_ID] = 4 and [D_ID] = " + WK_USE_SHIKIBETU_ID + " ) and [F_ID] = " + WK_USE_F_ID + " and ISNULL([D_ID],0) > 0 ORDER BY [D_ID_WORDS] ASC";

                    if (WK_USE_F_ID_WORDS == @"降順")
                    {

                        selectString3 = @"SELECT [D_ID],[D_ID_WORDS], count([D_ID]) AS COUNT_SU FROM dbo.Identify_Entity_tbl WHERE [識別ID] IN (select DISTINCT [識別ID] from dbo.Identify_Entity_tbl where [F_ID] = 4 and [D_ID] = " + WK_USE_SHIKIBETU_ID + " ) and [F_ID] = " + WK_USE_F_ID + " and ISNULL([D_ID],0) > 0 GROUP BY  [D_ID],[D_ID_WORDS] ORDER BY [D_ID_WORDS] DESC";  //left('00000000000' + str(count([D_ID])),12) DESC, [D_ID_WORDS] ASC";
                    }
                    else
                    {
                        selectString3 = @"SELECT [D_ID],[D_ID_WORDS], count([D_ID]) AS COUNT_SU FROM dbo.Identify_Entity_tbl WHERE [識別ID] IN (select DISTINCT [識別ID] from dbo.Identify_Entity_tbl where [F_ID] = 4 and [D_ID] = " + WK_USE_SHIKIBETU_ID + " ) and [F_ID] = " + WK_USE_F_ID + " and ISNULL([D_ID],0) > 0 GROUP BY  [D_ID],[D_ID_WORDS] ORDER BY [D_ID_WORDS] ASC";  //left('00000000000' + str(count([D_ID])),12) DESC, [D_ID_WORDS] ASC";
                    }


                    //MessageBox.Show(selectString3);

                    SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                    cnnct3.Open();

                    SqlDataReader reader3 = command3.ExecuteReader();

                    DataTable CMB2_SOURCE = new DataTable();


                    CMB2_SOURCE.Columns.Add("D_ID", typeof(string));
                    CMB2_SOURCE.Columns.Add("D_ID_WORDS", typeof(string));



                    if (WK_USE_F_ID_WORDS == @"降順" || WK_USE_F_ID_WORDS == @"返却日")
                    {
                        //新しい行作成
                        DataRow row = CMB2_SOURCE.NewRow();

                        //新しい行の各列にセット
                        row["D_ID"] = "";

                        row["D_ID_WORDS"] = DateTime.Now.ToString("yyyy-MM-dd");

                        CMB2_SOURCE.Rows.Add(row);
                    }



                    if (reader3.HasRows)
                    {

                        while (reader3.Read())
                        {

                            //新しい行作成
                            DataRow row = CMB2_SOURCE.NewRow();

                            //新しい行の各列にセット
                            row["D_ID"] = reader3.GetValue(0).ToString();

                            row["D_ID_WORDS"] = reader3.GetValue(1).ToString();

                            CMB2_SOURCE.Rows.Add(row);

                        }
                    }



                    //CMB1_SOURCE.AcceptChanges();


                    comboBox2.DataSource = CMB2_SOURCE;

                    ///　表示は文字列、取得も、文字列


                    comboBox2.MaxDropDownItems = 80;

                    comboBox2.DisplayMember = "D_ID_WORDS";
                    comboBox2.ValueMember = "D_ID_WORDS";

                    reader3.Close();
                    cnnct3.Close();



                    //comboBox2.Focus();

                    //}

                }

            }

        }

        private void comboBox3_DropDownClosed(object sender, EventArgs e)
        {
            SET_SQL_CON();



            try
            {

                // SQL Server への接続を作成する。
                SqlConnection cnnct3 = new SqlConnection(G.WK_SQL_connectstring);


                string selectString3 = @"SELECT count(*) FROM dbo.Word_Entity_tbl ";


                SqlCommand command3 = new SqlCommand(selectString3, cnnct3);

                cnnct3.Open();

                SqlDataReader reader3 = command3.ExecuteReader();


                reader3.Read();

                string WK_UMU = reader3.GetValue(0).ToString();

                reader3.Close();
                cnnct3.Close();

                MessageBox.Show("接続に成功しました！");

                
                
                // SQL Server への接続を作成する。
                SqlConnection cnnct = new SqlConnection(G.WK_SQL_connectstring);


                string selectString = @"SELECT count(*) FROM dbo.Word_Entity_tbl ";


                SqlCommand command4 = new SqlCommand(selectString, cnnct);

                cnnct.Open();

                SqlDataReader reader = command4.ExecuteReader();


                reader.Read();

                string WK_UMU2 = reader.GetValue(0).ToString();

                reader.Close();
                cnnct.Close();

                switch (comboBox3.SelectedValue.ToString())
                {


                    case "6":
                    case "7":

                        SqlConnection cnnct4 = new SqlConnection(G.WK_SQL_connectstring);


                        string selectString4 = @"SELECT name FROM [sys].[objects] WHERE name LIKE REPLACE(REPLACE(LOWER ( system_user ),'\','_'),'-','') + '_' +'%'
";


                        SqlCommand command_az = new SqlCommand(selectString4, cnnct4);

                        cnnct4.Open();

                        SqlDataReader reader4 = command_az.ExecuteReader();

                        int foo_count = 0;
                        string WK_UMU4 = "";


                        while (reader4.Read())
                        {

                            WK_UMU4 = WK_UMU4 + reader4.GetValue(0).ToString() + Environment.NewLine;

                            foo_count = foo_count + 1;

                        }
                        reader4.Close();
                        cnnct4.Close();

                        if (foo_count > 0 )
                        {
                            MessageBox.Show("消し残し作業用テーブルが【 " + foo_count + " 】個見つかりました" + Environment.NewLine + Environment.NewLine + "画面左上の[メンテナンス]ボタンを押すと自動消去出来ます！" + Environment.NewLine + Environment.NewLine + WK_UMU4);
                        }

                        break;

                    default:

                        break;

                }


            }
            catch
            {

                MessageBox.Show("エラー：接続に失敗しました！");

            }

        }


    }

    static class G
    {

        // ◆◆　グローバル配列　◆◆ //

        //K-MEMO

        public static string WK_DB_SERVER_NAME_MEMO;
        public static string WK_DB_SERVER_IP_MEMO;
        public static string WK_DB_USE_SERVER;
        public static string WK_DB_NAME_MEMO;

        public static string WK_DB_USER_NAME;
        public static string WK_DB_USER_PASS;

        public static string WK_SQL_connectstring;


        //Form1を開く時、新規・追加画面なのか　参照画面は　0 にする
        public static int WK_Form1_Read = 0;

        //開く時のメモ名と識別IDを指定
        public static string WK_Form_Read_SHIKIBETSU_ID = "";
        public static string WK_Form_Read_Key = "";
        public static string WK_Form_Read_Key2 = "";


        // ◆◆　グローバル配列　◆◆ //

        //グリッド上のWクリックを制御　詳細表示モードでは　Wイベントを発生させない為
        public static int WK_Form1_MOUSE_W_CLICK = 0;

        //行チェックボタンを押した時、新規画面なのか、追加画面なのか　追加画面は　1 にする
        public static int WK_Form1_GYO_CHECK = 0;

        //グリッド上でWクリックしたら既存データを新フォームで選択させることをONかOFFか設定
        public static int WK_Form1_DataGridView_MOUSE_W_CLICK = 0;

        //グリッド上でWクリックしたアドレス
        public static int WK_Form1_Cell_r = 0;


        ////////  Form1_2　へ渡すデータ用
        public static string WK_Form1_MY_SHIKIBETU_ID = "";


        /// どのモードで開くか指定する
        public static string WK_Form1_USE_SWICH_FLG = "";
        public static string WK_Form1_USE_SHIKIBETU_ID = "";
        public static string WK_Form1_USE_T_ID = "";
        public static string WK_Form1_USE_SORT = "";
        public static string WK_Form1_USE_UNIT = "";
        public static string WK_Form1_USE_F_ID = "";
        public static string WK_Form1_USE_F_ID_WORDS = "";
        public static string WK_Form1_USE_D_ID_WORDS = "";

        /// <summary>
        /// 選択したコンボ
        /// </summary>
        /// 
        public static int WK_Form2_RETURN_SU = 0;
        public static string WK_Form2_RETURN = "";

        public static int WK_Form3_OPEN_FLG = 0;

    }

}
