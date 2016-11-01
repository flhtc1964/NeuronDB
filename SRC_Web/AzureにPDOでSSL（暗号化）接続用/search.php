<?php
include_once("common.php");

  //SQL文の作成

  $strSql = "";
  $strSql = $strSql . "SELECT ID, WORDS FROM dbo.Word_Entity_tbl WHERE ID IN (select DISTINCT D_ID from dbo.Identify_Entity_tbl where F_ID = 4 ) and ID > 999";

  $dbh = new PDO($dsn, $user, $password);
  $statement = $dbh->query($strSql);



    $tmp_CMB1_ID[1] = "";
    $tmp_CMB1_WORDS[1] = "";

$count = 2;

  foreach ($statement as $row) {
    $tmp_CMB1_ID[$count] = $row['ID'];
    $tmp_CMB1_WORDS[$count] = $row['WORDS'];
    $count++;
  }
  $row = $count -1 ;
  $dbh = null;
  
?>


<HTML>
  <HEAD>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>【K-MEMO】</TITLE>
       
<script type="text/javascript">
    function Sample1(){
     
        //alert("入力されました。");
        document.fm.freewords.value="";
        document.fm.memo_name.value="";
        document.fm.submit();
    }
</script>
      
    <LINK REL="stylesheet" TYPE="text/css" HREF="common.css">
    
    <style type="text/css">
	.auto-style2 {
		background-color: #FF0000;
	}
	.auto-style3 {
		background-color: #C0C0C0;
	}
	.auto-style4 {
		text-align: right;
		white-space: nowrap;
	}
	.auto-style5 {
		text-align: right;
		white-space: nowrap;
		font-size: x-small;
	}
	.auto-style6 {
		font-size: x-small;
	}
	.auto-style7 {
		width: 400px;
		margin-top: 0px;
	}
	.auto-style8 {
		width: 100px;
		height: 25px;
		color: #0000FF;
	}
	</style>
  </HEAD>
  

  
  <BODY style="margin: 5">
    <TABLE BORDER="0" cellSpacing="8" cellPadding="1" bgColor="white" HEIGHT="70" style="width: 882px">
      <FORM METHOD="POST" ACTION="result.php" TARGET="result" NAME="fm">

        <TR>
          <TD bgColor=#ededed class="auto-style5" style="width: 156px; height: 25px;">【K-MEMO】　[メモ名]選択</TD>
          <TD style="width: 395px; height: 25px;">
            <SELECT NAME="memo_name" class="auto-style7" style="height: 25px">
<?php
              $count = 1;
              for($i=0; $i<$row; $i++) {
                print("<OPTION VALUE=\"" . $tmp_CMB1_ID[$count] . "\">" .  $tmp_CMB1_WORDS[$count] . "</OPTION>\n");
                $count++;
              }
?>
            </SELECT>
          </TD>
          <TD style="width: 200px; height: 20px;">終了→上の<span class="auto-style2"><strong><span class="auto-style3"> 
		  ×　</span></strong></span>を押す！<BR>　　　　　【　Ctrl + W　】</TD>
        </TR>

        <TR>
          <TD bgColor=#ededed class="auto-style4" style="width: 156px">　　　　<span class="auto-style6">　絞込文字</span></TD>
            <TD style="width: 395px"> 
            <INPUT style="ime-mode:active; height: 22px;" TYPE="text" NAME="freewords" SIZE="20">　

            <!-- <INPUT TYPE="reset" VALUE="クリア" CLASS="button80" style="height: 25px"> -->

            <INPUT type="button" value="クリア" CLASS="button80" style="height: 25px" onclick="Sample1()">
            <INPUT TYPE="submit" VALUE="検索(一覧再表示)" NAME="ACT" CLASS="auto-style8" style="width: 125px">
                </TD>
        </TR>

      </FORM>



      
    </TABLE>
    
    
    
  </BODY>
</HTML>
