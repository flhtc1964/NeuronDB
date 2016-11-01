<?php

  include_once("common.php");

//print "絞込文字【" . $_POST['freewords'] . "】";


if($_POST["memo_name"]=="" && $_POST["freewords"]=="")
{
    print "【メモ名】選択、【絞込文字】等を入力し「検索」を押してください！";
}
else
{

    // 接続
    $pdo = new PDO($dsn, $user, $password);

   if ($_POST["memo_name"]!="") {
    
      $P1 = $_POST["memo_name"];
      $P2 = $_POST["memo_name"];

 
   if ($_POST["freewords"]=="") {
      $P3 = "0:,";
    } else {
      $P3 = "0:," . $_POST["freewords"];
    }
    
       
   
      //クエリー文を指定 
  $tsql_callSP = "EXEC dbo.S_KENSAKU_SUB ?, ?, ?";
    
       $wk_flg =1;
 }
 else
 {
      $P1 = 903;
      $P2 = 903;
      $P3 = $_POST["freewords"];
      //print "【メモ名】を選択し→【検索】を押してください";
      
        //クエリー文を指定 
  $tsql_callSP = "EXEC dbo.S_KENSAKU_WIDE ?, ?, ?";
            
     $wk_flg =0;
      
    }
 
print "　↓　番号をクリック→「詳細表示」になるので登録されている「リンク」が開けます";

 
  //クエリーを実行 
  $stmt = $pdo->prepare($tsql_callSP);
  
  // バインド
  //$paramId1 = 2;
  //$paramId2 = 3;
  //$outputResult = "000";
  //$returnSet = "000";
    


  // 設定
  //$stmt->bindParam(1, $returnSet, PDO::PARAM_STR | PDO::PARAM_INPUT_OUTPUT, 100);


  $stmt->bindParam(1, $P1, PDO::PARAM_INT);
  $stmt->bindParam(2, $P2, PDO::PARAM_INT);
  $stmt->bindParam(3, $P3, PDO::PARAM_STR);

  //$stmt->bindParam(4, $outputResult, PDO::PARAM_STR | PDO::PARAM_INPUT_OUTPUT, 100);
  
  // 最初のレコードセットの結果を取得
  $stmt->execute();
  
 print"<table border='1'>";     
    
if ($wk_flg ==1){
  //列名クエリーを実行 
       
 $wk_sql = "SELECT dbo.Identify_Entity_tbl.F_ID_WORDS FROM dbo.Identify_Entity_tbl WHERE [識別ID] = (SELECT MIN([識別ID]) AS Expr1 FROM dbo.Identify_Entity_tbl AS Identify_Entity_tbl_2 WHERE [F_ID] = 4 AND [D_ID] = " . $_POST["memo_name"] . ") ORDER BY dbo.Identify_Entity_tbl.ソート";
       
       //print $wk_sql;
       
  $stmt_h = $pdo->query($wk_sql); 

  print "<TR>";
    
  print("<td bgColor=#ededed nowrap aligh='left' valign='middle' height='25'>詳細表示</td>");
    
  while($row = $stmt_h->fetch(PDO::FETCH_NUM)){
      
  
              print("<td bgColor=#ededed nowrap aligh='left' valign='middle' height='25'>");
    $tmp = $row[0]=="" ? "　": $row[0];
                print($tmp);
                print("</td>");

            }
       print "</TR>";
    
}
 
///ここからデータ
    
  while($row = $stmt->fetch(PDO::FETCH_NUM)){
  
  
   print "<TR>";


                   print("<td nowrap aligh='left' valign='middle' height='25'>");
    $tmp = $row[1]=="" ? "　": $row[1] ;
                print "<a href=result2.php?kwd=&shikibetsuid=$tmp>$tmp</a></td>";

//?kwd='&shikibetsuid='" + $tmp + "

            for ($j=3; $j < count($row); $j=$j+2){
                print("<td nowrap aligh='left' valign='middle' height='25'>");
    $tmp = $row[$j]=="" ? "　": $row[$j] ;
                print($tmp);
                print("</td>");
            }
            
print "</TR>";

}

print "</table>";
  
}


?>