<?php

  include_once("common.php");

 
 $P0 = $_GET["shikibetsuid"];
 
 
   if ($P0=="") {
      $P1 = "";
      $P2 = "";
      print "【該当データ無し】";
      
    } else {

    
    
      $P1 = $P0;
      $P2 = 0;
      $P3 = "0:,";

//	print $P1;
//	print $P2;
//	print $P3;
 
    // 接続
    $pdo = new PDO($dsn, $user, $password);
    


 
  //クエリー文を指定 
  $tsql_callSP = "EXEC dbo.S_KENSAKU_SUB ?, ?, ?";
 
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
  
print "【 $P0 】<p>";
  
      
 print"<table border='1'>";
 
 
  while($row = $stmt->fetch(PDO::FETCH_NUM)){
  
   print "<TR>";
      
                print("<td nowrap aligh='left' valign='middle' height='25'>");
		    $tmp = $row[8]=="" ? "　": $row[8] ;
                print($tmp);
                print("</td>");

            for ($j=11; $j < count($row)-4; $j++){
                
                print("<td nowrap aligh='left' valign='middle' height='25'>");
                
                $tmp = $row[$j]=="" ? "　": $row[$j] ;
                
                
                if(strlen($tmp)> 5){

                    switch ((string) substr(mb_strtolower($tmp),0,4)){
                        case "\\\\os" : print ("<a href=file://$tmp  target='_blank' >$tmp</a>");break;
                        case "\\\\to" : print ("<a href=file://$tmp  target='_blank' >$tmp</a>");break;
                        case "\\\\fk" : print ("<a href=file://$tmp  target='_blank' >$tmp</a>");break;
                        case "http" : print ("<a href=$tmp  target='_blank' >$tmp</a>");break;

                    default: print ($tmp);break;
                }
                }
                    else
                    {
                print($tmp);
           
                }

                                  print("</td>");  
            }
            
print "</TR>";

}

print "</table>";
  
  
    }
    



?>
