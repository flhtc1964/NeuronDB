USE [K-MEMO]
GO

/****** Object:  StoredProcedure [dbo].[S_KENSAKU_SUB2]    Script Date: 2017/02/06 11:04:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[S_KENSAKU_SUB2]
(
	@P1 as int 
	,@P2 as int
	,@P3 as  nvarchar(500)
	) WITH RECOMPILE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

--////////////////////////////////////////////////////////
--
--◆重要◆　@P1 は[識別ID] ,  @P2 は「検索条件定義」の[プロパテイ]番号　@P2空白だとレコードをそのまま返します

-- F_ID のみを指定したら表示列として絞り込めます。
--
--////////////////////////////////////////////////////////


DECLARE @P3_1 nvarchar(500)  --FLG
DECLARE @P3_2 nvarchar(500)  --ユニット番号等
DECLARE @P3_3 nvarchar(500)  --検索文字

--検索文字の有無で判定
if charindex(',',ISNULL(@P3,'')) > 0
BEGIN
--            `P3_1:@P3_2.@P3_3
-- @P3　→　 "FLG番号:ユニット番号等,検索文字"

SET @P3_1 =       SUBSTRING(@P3,0,charindex(':',ISNULL(@P3,'')))
SET @P3_2 =       SUBSTRING(@P3,charindex(':',ISNULL(@P3,''))+1,charindex(',',ISNULL(@P3,''))-charindex(':',ISNULL(@P3,''))-1)
SET @P3_3 = '%' + SUBSTRING(@P3,charindex(',',ISNULL(@P3,''))+1,LEN(@P3)-charindex(',',ISNULL(@P3,''))) + '%'
END
else
BEGIN
SET @P3_1 =       SUBSTRING(@P3,0,charindex(':',ISNULL(@P3,'')))
SET @P3_2 =       SUBSTRING(@P3,charindex(':',ISNULL(@P3,''))+1,LEN(@P3)-charindex(':',ISNULL(@P3,'')))
SET @P3_3 = '%'
END

--select @P3,@P3_1,@P3_2,@P3_3


DECLARE @WK_CHECK int

--カーソル用
DECLARE @W_主キー int
DECLARE @W_識別ID int
DECLARE @W_G_識別ID int
DECLARE @W_T_ID int
DECLARE @W_ソート int
DECLARE @W_ユニット int
DECLARE @W_F_ID int
DECLARE @W_G_F_ID int
DECLARE @W_D_ID int
DECLARE @W_G_D_ID int
DECLARE @W_識別IDリンク先 int
DECLARE @W_G_識別IDリンク先 int
DECLARE @W_識別IDリンク先使用数 int
DECLARE @W_G_識別IDリンク先使用数 int

DECLARE @W_F_ID_WORDS nvarchar(2048)
DECLARE @W_D_ID_WORDS nvarchar(2048) 

DECLARE @WK_SQL_ST nvarchar(max) 

DECLARE @WK_SQL nvarchar(max) 
DECLARE @WK_SQL_SUB nvarchar(max) 
DECLARE @WK_SQL2 nvarchar(max) 
DECLARE @WK_SQL3 nvarchar(max) 
DECLARE @WK_SQL4 nvarchar(max) 
DECLARE @WK_SQL5 nvarchar(max) 

DECLARE @WK_SQL_IN nvarchar(4000) 
DECLARE @WK_SQL_IN_FLG int
DECLARE @WK_SQL_IN_LAST nvarchar(50) 

DECLARE @WK_SQL_FD nvarchar(4000) 
DECLARE @WK_SQL_FD_FLG int
DECLARE @WK_SQL_FD_LAST nvarchar(50) 


SET @WK_SQL_SUB = ''


SET @WK_SQL_IN_FLG = 0
SET @WK_SQL_IN = ' and '','


SET @WK_SQL_FD_FLG = 0
SET @WK_SQL_FD = ' and '','

--カーソル1で、検索した全[識別ID]で、データの最高列数を調査
DECLARE @WK_CR1_R_MAX int

--カーソル2で使用
DECLARE @WK_CR2_R_NO int
DECLARE @WK_CR2_R_SU int
DECLARE @WK_CR2_R_MAX int

--初期作成デフォルト列数
SET @WK_CR1_R_MAX = 150



--//////////////////////////////////////////////////////////////////

--///◆データ修正時詳細表示用◆　@P1 = 識別名ID　@P2 = 0　@P3 = ''  -> '0:,'

--//////////////////////////////////////////////////////////////////

if ISNULL(@P2,0) = 0
BEGIN
		SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.主キー'
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.T_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.ソート '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.ユニット '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.F_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_F_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Word_Entity_tbl.WORDS AS F_ID_WORDS '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.D_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_D_ID '
		SET @WK_SQL = @WK_SQL + ', Word_Entity_tbl_1.WORDS AS D_ID_WORDS '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別IDリンク先 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別IDリンク先 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別IDリンク先使用数 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別IDリンク先使用数 '
		SET @WK_SQL = @WK_SQL + ' From dbo.Identify_Entity_tbl LEFT OUTER JOIN '
		SET @WK_SQL = @WK_SQL + ' dbo.Word_Entity_tbl Word_Entity_tbl_1 ON '
		SET @WK_SQL = @WK_SQL + ' dbo.Identify_Entity_tbl.D_ID = Word_Entity_tbl_1.ID LEFT OUTER JOIN '
		SET @WK_SQL = @WK_SQL + ' dbo.Word_Entity_tbl ON dbo.Identify_Entity_tbl.F_ID = dbo.Word_Entity_tbl.ID '
		SET @WK_SQL = @WK_SQL + ' Where dbo.Identify_Entity_tbl.識別ID = ' + cast(@P1 as nvarchar(50))
		SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , [ソート]'

EXEC sp_executesql @WK_SQL


END

else

BEGIN



--//////////////////////////////////////////////////////////////////

--@P2の指定したレコードがあるかチェック
SET @WK_CHECK = ISNULL((SELECT 
 TOP (1) COUNT(*) AS 'WK_CHECK'
 FROM dbo.Identify_Entity_tbl
 WHERE [識別ID] = @P1 and F_ID = 4 and D_ID = ISNULL(@P2,0)
 ORDER BY 'WK_CHECK' DESC),0)

--select @WK_CHECK


--//////////////////////////////////////////////////////////////////

--///◆動的検索条件で表示用◆　@P1 = 識別名ID　@P2 = 901　@P3 = ''  -> '0:,'

--//////////////////////////////////////////////////////////////////


if @WK_CHECK > 0 and @P2 = 901


--◆
BEGIN


--//////////////////////////////////////////////////////////////////

--ログオンユーザー名
DECLARE @WK_USER_NAME nvarchar(250)

--サーバ日時
DECLARE @WK_SYSTEM_DATE_TIME nvarchar(250)

--作業用テーブル名
DECLARE @WK_SAGYOU_ST nvarchar(250)
DECLARE @WK_SAGYOU_TBL nvarchar(250)


--ユーザ名を加工


--◆重要◆
--【ローカル】SQL Serverでは↓一時テーブルを使用すること
--SET @WK_USER_NAME = '##' + REPLACE(LOWER ( system_user ),'\','_')

--【Azure】では一時テーブルは使えないので'##' + は使わない
SET @WK_USER_NAME = REPLACE(LOWER ( system_user ),'\','_')



SET @WK_USER_NAME =  REPLACE(@WK_USER_NAME,'-','')

--システム日時を加工
SET @WK_SYSTEM_DATE_TIME =  REPLACE( CONVERT(VARCHAR,GetDate(),121) ,'-','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,':','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,' ','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,'.','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,'-','')



--//////////////////////////////////////////////////////////////////





--上記２つを足して、作業用テーブル名を作成
SET @WK_SAGYOU_ST = @WK_USER_NAME + '_' + @WK_SYSTEM_DATE_TIME  + '_ST'

--項目の表示順

SET @WK_SQL_ST = 'create table ' + @WK_SAGYOU_ST + ' (S int,F int primary key)'
EXECUTE ( @WK_SQL_ST )

SET @WK_SQL_ST = 'insert into ' + @WK_SAGYOU_ST + '(S,F) SELECT ソート,F_ID From dbo.Identify_Entity_tbl Where [識別ID] = ' +  cast(@P1 as nvarchar(50)) + ' and ISNULL(F_ID,0) > 0 and ISNULL(D_ID,0) <1 order by [ソート]'
EXECUTE (@WK_SQL_ST)


--EXECUTE ('select * from ' + @WK_SAGYOU_ST)



--自分は、検索対象から外す
SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl  left outer join ' +  @WK_SAGYOU_ST + ' ON dbo.Identify_Entity_tbl.F_ID = ' +  @WK_SAGYOU_ST + '.F Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] <> ' + cast(@P1 as nvarchar(50)) + ' '

/* カーソル定義 */
DECLARE csr_1 CURSOR	--LOCAL SCROLL DYNAMIC
FOR 
SELECT * From dbo.Identify_Entity_tbl Where [識別ID] = @P1

/* カーソルOPEN */
OPEN csr_1

/*先頭レコードの取得*/
FETCH NEXT FROM csr_1 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先 , @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数

/* ループ処理（全レコードの検索が完了するまで） */
WHILE (@@fetch_status =0)
--◆◆
BEGIN

--メインの識別IDで無ければ識別IDをデータとして処理
if ISNULL( @W_F_ID ,0) = 4 and ( ISNULL( @W_識別IDリンク先,0) > 0)
	BEGIN
		SET @WK_SQL_IN = @WK_SQL_IN + cast(@W_識別IDリンク先 as nvarchar(50)) + ','

		SET @WK_SQL_IN_LAST = ''' like ''%,'' + cast([識別ID] as nvarchar ) + '',%'''

		SET @WK_SQL_IN_FLG = @WK_SQL_IN_FLG + 1
	END

else


	if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_F_ID , 0 ) >= 4 and ( ISNULL( @W_D_ID,0) > 0 )

		--◆◆◆
		BEGIN
			SET @WK_SQL_SUB = @WK_SQL_SUB + ' select [識別ID] from dbo.Identify_Entity_tbl where F_ID = '  + cast(@W_F_ID as nvarchar(50)) + ' and D_ID = '  + cast(@W_D_ID as nvarchar(50)) + ' intersect' 
		--◆◆◆
		END

		else

	--[F_ID][0][なし]　として　[D_ID]を指定している場合
	if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_F_ID , 0 ) = 0 and ( ISNULL( @W_D_ID,0) > 0 )

		--◆◆◆
		BEGIN
			SET @WK_SQL_SUB = @WK_SQL_SUB + ' select [識別ID] from dbo.Identify_Entity_tbl where D_ID = '  + cast(@W_D_ID as nvarchar(50)) + ' intersect' 
		--◆◆◆
		END

		else
		
		--D_IDが無い場合、「表示する列を指定する」
		--識別名行以外を表示 
		if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_D_ID , 0 ) = 0 
			BEGIN						

				SET @WK_SQL_FD = @WK_SQL_FD + cast(@W_F_ID as nvarchar(50))+',' 

				SET @WK_SQL_FD_LAST = ''' like ''%,'' + cast([F_ID] as nvarchar ) + '',%'''

				SET @WK_SQL_FD_FLG = @WK_SQL_FD_FLG + 1

			END


/* 次レコード検索処理 */
FETCH NEXT FROM csr_1 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先 , @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数
--◆◆
END



if right(ISNULL( @WK_SQL_SUB , '' ),9) = 'intersect' 
BEGIN
		-- SET @WK_SQL = @WK_SQL + ' and [識別ID] IN  ( ' + substring(@WK_SQL_SUB,1,len(@WK_SQL_SUB)-9) + ')'
		SET @WK_SQL = @WK_SQL + substring(@WK_SQL_SUB,1,len(@WK_SQL_SUB)-9) 
END



if ISNULL( @WK_SQL_IN_FLG , 0 ) > 0 
BEGIN
		SET @WK_SQL = @WK_SQL + @WK_SQL_IN + @WK_SQL_IN_LAST
END

if ISNULL( @WK_SQL_FD_FLG , 0 ) > 0 
BEGIN
		SET @WK_SQL = @WK_SQL + @WK_SQL_FD + @WK_SQL_FD_LAST
END

/* エラーになるので外した 2017-01-20 SKojima */
--SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , ' + @WK_SAGYOU_ST + '.S , [ソート]'

--select @WK_SQL

/* カーソルCLOSE・解放 */
CLOSE csr_1
DEALLOCATE csr_1


--◆
END

	--------------------------
	else if @P1 = @P2
	--------------------------
	BEGIN

	if @P3_3 = '%%'
	BEGIN

         if SUBSTRING(@P3_1,1,3) = 'TOP'
	     BEGIN
		 -- 12 min
		 SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select ' + @P3_1 + ' [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + ' group by [識別ID]) '
	    END
		 else
	    BEGIN
		 -- 12 min
		 SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + ' group by [識別ID] ) '
	    END
   
	END
	
	else
	
	BEGIN


         if SUBSTRING(@P3_1,1,3) = 'TOP'
	     BEGIN

		 -- 12 min
		 	 --SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN ( select ' + @P3_1 + ' [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + 'group by [識別ID] ) and  [識別ID] IN  (select [識別ID] from dbo.Identify_Entity_tbl where [D_ID] IN  ( select [ID] from dbo.Word_Entity_tbl where [ID] > 999 and [WORDS] like N''' + @P3_3 + ''' )  ) '
			 SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN ( select ' + @P3_1 + ' wkmain.[識別ID] from (select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + ' group by [識別ID]) as wkmain inner join (select [識別ID] from dbo.Identify_Entity_tbl where [F_ID] <> 4  and [D_ID_WORDS] like N''' + @P3_3 + ''' group by [識別ID]) as wksub ON wkmain.[識別ID]= wksub.[識別ID]  ) '
	     END
		  else
	     BEGIN
		 -- 12 min
		 	 SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + 'group by [識別ID] ) and  [識別ID] IN  (select [識別ID] from dbo.Identify_Entity_tbl where [D_ID] IN  ( select [ID] from dbo.Word_Entity_tbl where [WORDS] like N''' + @P3_3 + ''' )  ) '
	     END

	END
	

	--select @WK_SQL


	END


	--------------------------

	/* 不要？

	else if @P1 < 1000

	BEGIN
		if len(ISNULL(@P3_3,'')) > 0 
		BEGIN
		
		--◆引数有◆　識別ID　降順  @P1 = 識別ID　, P2 = 901 と、ストアド番号を指定
		--SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P2 as nvarchar(50)) + ' ) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [D_ID_WORDS] like ''' + cast(@P3_3 as nvarchar(500)) + ''' and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2) and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2'
		
		SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where D_ID > 999 and F_ID = 4 and D_ID = ' + cast(@P2 as nvarchar(50)) + ' ) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where D_ID > 999 and [D_ID_WORDS] like ''' + cast(@P3_3 as nvarchar(500)) + ''' and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2) and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2'
		
		END
	else
		BEGIN
	
		--◆引数無し◆　識別ID　降順  @P1 = 識別ID　, P2 = 901 と、ストアド番号を指定
		--SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where D_ID > 999 and F_ID = 4 and D_ID = ' + cast(@P2 as nvarchar(50)) + ' )  and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2'
		SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P2 as nvarchar(50)) + ' )  and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2'


		END
	END

	*/


	else

	BEGIN

		--SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] = ' + cast(@P1 as nvarchar(50)) + ' ORDER BY [識別ID],[T_ID],[ソート]'
		SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] = ' + cast(@P1 as nvarchar(50)) 


	END




--------------------------------------------------------------------------------------------------------------
--   動的基本@WK_SQL組立終了
--------------------------------------------------------------------------------------------------------------

--select @WK_SQL


--EXEC sp_executesql @WK_SQL

--カーソル2用
SET @WK_CR2_R_NO = 0

SET @WK_CR2_R_MAX = 0


--最大列名数取得

--select @P2

--最大列名数取得

if @P1<> 901 and @P2 = 901
--動的検索だったら
BEGIN

	SET @WK_SQL3 = REPLACE( @WK_SQL , 'dbo.Identify_Entity_tbl.* From' , 'SELECT TOP(1) count([識別ID]) From') + ' GROUP BY [識別ID] ORDER BY count([識別ID]) DESC '

/* カーソル定義 */
--最初に作成しておいたSQL文を使用
EXECUTE ( 'DECLARE csr CURSOR SCROLL DYNAMIC FOR ' + @WK_SQL3 )

/* カーソルOPEN */
OPEN csr

/*先頭レコードの取得*/
FETCH NEXT FROM csr INTO  @WK_CR2_R_MAX
CLOSE csr

DEALLOCATE csr


	--select @WK_CR2_R_MAX
END

else

BEGIN
SET @WK_CR2_R_MAX = ISNULL(
(SELECT COUNT(*) FROM dbo.Identify_Entity_tbl WHERE [識別ID] IN 
(SELECT  TOP (1) [識別ID]   FROM dbo.Identify_Entity_tbl WHERE [F_ID] = 4 and [D_ID] = @P1) )
,0)
END
--select @WK_CR2_R_MAX


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* カーソル定義 */
--最初に作成しておいたSQL文を使用




	SET @WK_SQL2 = 'SELECT tmp.[識別ID] as [主キー] ,tmp.[識別ID]'


/* ループ処理（全レコードの検索が完了するまで） */
WHILE ( @WK_CR2_R_NO < @WK_CR2_R_MAX)
--◆◆
BEGIN


		SET @WK_CR2_R_NO = @WK_CR2_R_NO + 1	

	SET @WK_SQL2 = @WK_SQL2 + ',max(case tmp.seq when '+ cast(@WK_CR2_R_NO as nvarchar(50)) + ' then tmp.[主キー] else null end) as [MID'+ cast(@WK_CR2_R_NO as nvarchar(50)) + ']'
	SET @WK_SQL2 = @WK_SQL2 + ',max(case tmp.seq when '+ cast(@WK_CR2_R_NO as nvarchar(50)) + ' then tmp.[D_ID_WORDS] else null end) as [MDT'+ cast(@WK_CR2_R_NO as nvarchar(50)) + ']'


--◆◆
END




    SET @WK_SQL2 = @WK_SQL2 + ' FROM ('

	SET @WK_SQL2 = @WK_SQL2 + 'SELECT ROW_NUMBER() OVER(PARTITION BY [識別ID] ORDER BY [ソート] ) AS ''seq'',' 
	
	SET @WK_SQL2 = @WK_SQL2 + @WK_SQL

	SET @WK_SQL2 = @WK_SQL2 + ') tmp group by tmp.[識別ID]'


	--select @WK_SQL2

	EXEC sp_executesql @WK_SQL2

---------------------------------------------------------
END


END

GO


USE [K-MEMO]
GO

/****** Object:  StoredProcedure [dbo].[S_KENSAKU_WIDE2]    Script Date: 2017/02/06 11:04:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[S_KENSAKU_WIDE2]
(
	@P1 as int 
	,@P2 as int
	,@P3 as  nvarchar(500)
)  WITH RECOMPILE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

--////////////////////////////////////////////////////////
--
--◆重要◆　@P1 は[識別ID] ,  @P2 は「検索条件定義」の[プロパテイ]番号　@P2空白だとレコードをそのまま返します

-- F_ID のみを指定したら表示列として絞り込めます。
--
--////////////////////////////////////////////////////////




DECLARE @P3_1 nvarchar(500)  --FLG
DECLARE @P3_2 nvarchar(500)  --ユニット番号等
DECLARE @P3_3 nvarchar(500)  --検索文字

--検索文字の有無で判定
if charindex(',',ISNULL(@P3,'')) > 0
BEGIN
--            `P3_1:@P3_2.@P3_3
-- @P3　→　 "FLG番号:ユニット番号等,検索文字"

SET @P3_1 =       SUBSTRING(@P3,0,charindex(':',ISNULL(@P3,'')))
SET @P3_2 =       SUBSTRING(@P3,charindex(':',ISNULL(@P3,''))+1,charindex(',',ISNULL(@P3,''))-charindex(':',ISNULL(@P3,''))-1)
SET @P3_3 = '%' + SUBSTRING(@P3,charindex(',',ISNULL(@P3,''))+1,LEN(@P3)-charindex(',',ISNULL(@P3,''))) + '%'
END
else
BEGIN
SET @P3_1 =       '0'
SET @P3_2 =       '0'
SET @P3_3 = '%' +ISNULL(@P3,'')+ '%'
END

--select @P3,@P3_1,@P3_2,@P3_3




DECLARE @WK_CHECK int

--カーソル用
DECLARE @W_主キー int
DECLARE @W_識別ID int
DECLARE @W_G_識別ID int
DECLARE @W_T_ID int
DECLARE @W_ソート int
DECLARE @W_ユニット int
DECLARE @W_F_ID int
DECLARE @W_G_F_ID int
DECLARE @W_D_ID int
DECLARE @W_G_D_ID int
DECLARE @W_識別IDリンク先 int
DECLARE @W_G_識別IDリンク先 int
DECLARE @W_識別IDリンク先使用数 int
DECLARE @W_G_識別IDリンク先使用数 int

DECLARE @W_F_ID_WORDS nvarchar(2048)
DECLARE @W_D_ID_WORDS nvarchar(2048) 

DECLARE @WK_SQL_ST nvarchar(max) 

DECLARE @WK_SQL nvarchar(max) 
DECLARE @WK_SQL_SUB nvarchar(max) 
DECLARE @WK_SQL2 nvarchar(max) 
DECLARE @WK_SQL3 nvarchar(max) 
DECLARE @WK_SQL4 nvarchar(max) 
DECLARE @WK_SQL5 nvarchar(max) 
DECLARE @WK_SQL6 nvarchar(max) 
DECLARE @WK_SQL7 nvarchar(max) 

DECLARE @WK_SQL8 nvarchar(max) 
DECLARE @WK_SQL8_2 nvarchar(max) 

DECLARE @WK_SQL9 nvarchar(max) 

DECLARE @WK_SQL_IN nvarchar(4000) 
DECLARE @WK_SQL_IN_FLG int
DECLARE @WK_SQL_IN_LAST nvarchar(50) 

DECLARE @WK_SQL_FD nvarchar(4000) 
DECLARE @WK_SQL_FD_FLG int
DECLARE @WK_SQL_FD_LAST nvarchar(50) 


SET @WK_SQL_SUB = ''


SET @WK_SQL_IN_FLG = 0
SET @WK_SQL_IN = ' and '','


SET @WK_SQL_FD_FLG = 0
SET @WK_SQL_FD = ' and '','

--カーソル1で、検索した全[識別ID]で、データの最高列数を調査
DECLARE @WK_CR1_R_MAX int

--カーソル2で使用
DECLARE @WK_CR2_R_NO int
DECLARE @WK_CR2_R_SU int

DECLARE @WK_CR2_R_SU_SAIDAI int

DECLARE @WK_CR2_R_MAX int

--初期作成デフォルト列数
SET @WK_CR1_R_MAX = 150


--//////////////////////////////////////////////////////////////////

if ISNULL(@P2,0) = 0
BEGIN
		SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.主キー'
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.T_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.ソート '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.ユニット '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.F_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_F_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Word_Entity_tbl.WORDS AS F_ID_WORDS '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.D_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_D_ID '
		SET @WK_SQL = @WK_SQL + ', Word_Entity_tbl_1.WORDS AS D_ID_WORDS '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別IDリンク先 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別IDリンク先 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別IDリンク先使用数 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別IDリンク先使用数 '
		SET @WK_SQL = @WK_SQL + ' From dbo.Identify_Entity_tbl LEFT OUTER JOIN '
		SET @WK_SQL = @WK_SQL + ' dbo.Word_Entity_tbl Word_Entity_tbl_1 ON '
		SET @WK_SQL = @WK_SQL + ' dbo.Identify_Entity_tbl.D_ID = Word_Entity_tbl_1.ID LEFT OUTER JOIN '
		SET @WK_SQL = @WK_SQL + ' dbo.Word_Entity_tbl ON dbo.Identify_Entity_tbl.F_ID = dbo.Word_Entity_tbl.ID '
		SET @WK_SQL = @WK_SQL + ' Where dbo.Identify_Entity_tbl.識別ID = ' + cast(@P1 as nvarchar(50))
		SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , [ソート]'

EXEC sp_executesql @WK_SQL

END

else

BEGIN


--//////////////////////////////////////////////////////////////////


--@P2の指定したレコードがあるかチェック
SET @WK_CHECK = ISNULL((SELECT 
 TOP (1) COUNT(*) AS 'WK_CHECK'
 FROM dbo.Identify_Entity_tbl
 WHERE [識別ID] = @P1 and F_ID = 4 and D_ID = ISNULL(@P2,0)
 ORDER BY 'WK_CHECK' DESC),0)

--select @WK_CHECK


if @WK_CHECK > 0 and @P2 = 902


--◆
BEGIN

--ログオンユーザー名
DECLARE @WK_USER_NAME nvarchar(250)

--サーバ日時
DECLARE @WK_SYSTEM_DATE_TIME nvarchar(250)

--作業用テーブル名
DECLARE @WK_SAGYOU_ST nvarchar(250)
DECLARE @WK_SAGYOU_TBL nvarchar(250)
DECLARE @i int


--//////////////////////////////////////////////////////////////////
--ユーザ名を加工
--◆重要◆
--【ローカル】SQL Serverでは↓一時テーブルを使用すること
--SET @WK_USER_NAME = '##' + REPLACE(LOWER ( system_user ),'\','_')

--【Azure】では一時テーブルは使えないので'##' + は使わない
SET @WK_USER_NAME = REPLACE(LOWER ( system_user ),'\','_')

SET @WK_USER_NAME =  REPLACE(@WK_USER_NAME,'-','')

--システム日時を加工
SET @WK_SYSTEM_DATE_TIME =  REPLACE( CONVERT(VARCHAR,GetDate(),121) ,'-','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,':','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,' ','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,'.','')
SET @WK_SYSTEM_DATE_TIME =  REPLACE(@WK_SYSTEM_DATE_TIME,'-','')

--select @WK_SYSTEM_DATE_TIME

--//////////////////////////////////////////////////////////////////






--上記２つを足して、作業用テーブル名を作成
SET @WK_SAGYOU_ST = @WK_USER_NAME + '_' + @WK_SYSTEM_DATE_TIME  + '_ST'

--項目の表示順

SET @WK_SQL_ST = 'create table ' + @WK_SAGYOU_ST + ' (S int,F int primary key)'
EXECUTE ( @WK_SQL_ST )

SET @WK_SQL_ST = 'insert into ' + @WK_SAGYOU_ST + '(S,F) SELECT ソート,F_ID From dbo.Identify_Entity_tbl Where [識別ID] = ' +  cast(@P1 as nvarchar(50)) + ' and ISNULL(F_ID,0) > 0 and ISNULL(D_ID,0) <1 order by [ソート]'
EXECUTE (@WK_SQL_ST)


--EXECUTE ('select * from ' + @WK_SAGYOU_ST)



--自分は、検索対象から外す
SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl  left outer join ' +  @WK_SAGYOU_ST + ' ON dbo.Identify_Entity_tbl.F_ID = ' +  @WK_SAGYOU_ST + '.F Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] <> ' + cast(@P1 as nvarchar(50)) + ' '

/* カーソル定義 */
DECLARE csr_1 CURSOR	--LOCAL SCROLL DYNAMIC
FOR 
SELECT * From dbo.Identify_Entity_tbl Where [識別ID] = @P1

/* カーソルOPEN */
OPEN csr_1

/*先頭レコードの取得*/
FETCH NEXT FROM csr_1 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先 , @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数

/* ループ処理（全レコードの検索が完了するまで） */
WHILE (@@fetch_status =0)
--◆◆
BEGIN

--メインの識別IDで無ければ識別IDをデータとして処理
if ISNULL( @W_F_ID ,0) = 4 and ( ISNULL( @W_識別IDリンク先,0) > 0)
	BEGIN
		SET @WK_SQL_IN = @WK_SQL_IN + cast(@W_識別IDリンク先 as nvarchar(50)) + ','

		SET @WK_SQL_IN_LAST = ''' like N''%,'' + cast([識別ID] as nvarchar ) + '',%'''

		SET @WK_SQL_IN_FLG = @WK_SQL_IN_FLG + 1
	END

else


	if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_F_ID , 0 ) >= 4 and ( ISNULL( @W_D_ID,0) > 0 )

		--◆◆◆
		BEGIN
			SET @WK_SQL_SUB = @WK_SQL_SUB + ' select [識別ID] from dbo.Identify_Entity_tbl where F_ID = '  + cast(@W_F_ID as nvarchar(50)) + ' and D_ID = '  + cast(@W_D_ID as nvarchar(50)) + ' intersect' 
		--◆◆◆
		END

		else

	--[F_ID][0][なし]　として　[D_ID]を指定している場合
	if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_F_ID , 0 ) = 0 and ( ISNULL( @W_D_ID,0) > 0 )

		--◆◆◆
		BEGIN
			SET @WK_SQL_SUB = @WK_SQL_SUB + ' select [識別ID] from dbo.Identify_Entity_tbl where D_ID = '  + cast(@W_D_ID as nvarchar(50)) + ' intersect' 
		--◆◆◆
		END

		else
		
		--D_IDが無い場合、「表示する列を指定する」
		--識別名行以外を表示 
		if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_D_ID , 0 ) = 0 
			BEGIN						

				SET @WK_SQL_FD = @WK_SQL_FD + cast(@W_F_ID as nvarchar(50))+',' 

				SET @WK_SQL_FD_LAST = ''' like N''%,'' + cast([F_ID] as nvarchar ) + '',%'''

				SET @WK_SQL_FD_FLG = @WK_SQL_FD_FLG + 1

			END


/* 次レコード検索処理 */
FETCH NEXT FROM csr_1 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先 , @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数
--◆◆
END



if right(ISNULL( @WK_SQL_SUB , '' ),9) = 'intersect' 
BEGIN
		-- SET @WK_SQL = @WK_SQL + ' and [識別ID] IN  ( ' + substring(@WK_SQL_SUB,1,len(@WK_SQL_SUB)-9) + ')'
		SET @WK_SQL = @WK_SQL + substring(@WK_SQL_SUB,1,len(@WK_SQL_SUB)-9) 
END



if ISNULL( @WK_SQL_IN_FLG , 0 ) > 0 
BEGIN
		SET @WK_SQL = @WK_SQL + @WK_SQL_IN + @WK_SQL_IN_LAST
END

if ISNULL( @WK_SQL_FD_FLG , 0 ) > 0 
BEGIN
		SET @WK_SQL = @WK_SQL + @WK_SQL_FD + @WK_SQL_FD_LAST
END

/* エラーになるので外した 2017-01-20 SKojima */
--SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , ' + @WK_SAGYOU_ST + '.S , [ソート]'

--select @WK_SQL

/* カーソルCLOSE・解放 */
CLOSE csr_1
DEALLOCATE csr_1


--◆
END

	--------------------------
	else if @P1 = @P2
	--------------------------
	
	--2
	BEGIN
	--
	--識別ID　降順  @P1 = 902, P2 = 902 と、ストアド番号を指定


		          if SUBSTRING(@P3_1,1,3) = 'TOP'
	     BEGIN
			SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select ' + @P3_1 + '[識別ID] from dbo.Identify_Entity_tbl where [F_ID] <> 4 and [D_ID] IN  ( select [ID] from [dbo].[Word_Entity_tbl] where [ID] > 999 and [WORDS] like N''' + @P3_3 + ''' ) group by [識別ID] )'
	     END
		  else
	     BEGIN
			SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [F_ID] <> 4 and [D_ID] IN  ( select [ID] from [dbo].[Word_Entity_tbl] where  [ID] > 999 and [WORDS] like N''' + @P3_3 + ''') group by [識別ID] )'
		 END

	
	END
	--3

	--select @WK_SQL


	--------------------------
	else
	--------------------------

	BEGIN

		SET @WK_SQL = 'dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] = ' + cast(@P1 as nvarchar(50)) + ' '

	END

--------------------------------------------------



		SET @WK_SQL3 = REPLACE( @WK_SQL , 'dbo.Identify_Entity_tbl.* From' , 'SELECT TOP(1) count([識別ID]) From') + ' GROUP BY [識別ID] ORDER BY count([識別ID]) DESC '
		
----◆
	    SET @WK_CR2_R_MAX = 0

		
/* カーソル定義 */
--最初に作成しておいたSQL文を使用
EXECUTE ( 'DECLARE csr CURSOR SCROLL DYNAMIC FOR ' + @WK_SQL3 )



/* カーソルOPEN */
OPEN csr

/*先頭レコードの取得*/
FETCH NEXT FROM csr INTO  @WK_CR2_R_MAX
CLOSE csr

DEALLOCATE csr


	--select @WK_CR2_R_MAX


--

	SET @WK_SQL2 = 'SELECT tmp.[識別ID] as [主キー] ,tmp.[識別ID]'


SET @WK_CR2_R_NO = 0


/* ループ処理（全レコードの検索が完了するまで） */
WHILE (@WK_CR2_R_NO < @WK_CR2_R_MAX)
--◆◆
	BEGIN

	SET @WK_CR2_R_NO = @WK_CR2_R_NO + 1	

	SET @WK_SQL2 = @WK_SQL2 + ',max(case tmp.seq when '+ cast(@WK_CR2_R_NO as nvarchar(50)) + ' then tmp.[主キー] else null end) as [MID'+ cast(@WK_CR2_R_NO as nvarchar(50)) + ']'
	SET @WK_SQL2 = @WK_SQL2 + ',max(case tmp.seq when '+ cast(@WK_CR2_R_NO as nvarchar(50)) + ' then tmp.[D_ID_WORDS] else null end) as [MDT'+ cast(@WK_CR2_R_NO as nvarchar(50)) + ']'


--◆◆
END




    SET @WK_SQL2 = @WK_SQL2 + ' FROM ('

	SET @WK_SQL2 = @WK_SQL2 + 'SELECT ROW_NUMBER() OVER(PARTITION BY [識別ID] ORDER BY [ソート] ) AS ''seq'',' 
	
	SET @WK_SQL2 = @WK_SQL2 + @WK_SQL

	SET @WK_SQL2 = @WK_SQL2 + ') tmp group by tmp.[識別ID]'


	--select @WK_SQL2

	EXEC sp_executesql @WK_SQL2


--◆

---------------------------------------------------------

END

---------------------------------------------------------
END
GO


USE [K-MEMO]
GO

/****** Object:  StoredProcedure [dbo].[S_ID_DEL_LIST]    Script Date: 2017/02/06 11:03:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[S_ID_DEL_LIST]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT            dbo.Word_Entity_tbl.ID, dbo.Word_Entity_tbl.WORDS, dbo.Identify_Entity_tbl.D_ID, dbo.Identify_Entity_tbl.主キー
FROM              dbo.Identify_Entity_tbl RIGHT OUTER JOIN
                        dbo.Word_Entity_tbl ON dbo.Identify_Entity_tbl.D_ID = dbo.Word_Entity_tbl.ID
WHERE             (dbo.Word_Entity_tbl.ID > 999) AND (dbo.Word_Entity_tbl.ID NOT IN
                            (SELECT            F_ID
                               FROM              dbo.Identify_Entity_tbl AS Identify_Entity_tbl_1)) AND (ISNULL(dbo.Identify_Entity_tbl.D_ID, '') = '')
END


GO







USE [K-MEMO]
GO

/****** Object:  StoredProcedure [dbo].[S_ID_DEL_LIST_RUN]    Script Date: 2017/02/06 11:04:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[S_ID_DEL_LIST_RUN]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE FROM dbo.Word_Entity_tbl WHERE dbo.Word_Entity_tbl.ID IN (

SELECT            dbo.Word_Entity_tbl.ID
FROM              dbo.Identify_Entity_tbl RIGHT OUTER JOIN
                        dbo.Word_Entity_tbl ON dbo.Identify_Entity_tbl.D_ID = dbo.Word_Entity_tbl.ID
WHERE             (dbo.Word_Entity_tbl.ID > 999) AND (dbo.Word_Entity_tbl.ID NOT IN
                            (SELECT            F_ID
                               FROM              dbo.Identify_Entity_tbl AS Identify_Entity_tbl_1)) AND (ISNULL(dbo.Identify_Entity_tbl.D_ID, '') = '')
)



UPDATE dbo.Identify_Entity_tbl SET F_ID_WORDS = dbo.Word_Entity_tbl.WORDS FROM dbo.Word_Entity_tbl WHERE
dbo.Identify_Entity_tbl.F_ID = dbo.Word_Entity_tbl.ID


UPDATE dbo.Identify_Entity_tbl SET D_ID_WORDS = dbo.Word_Entity_tbl.WORDS FROM dbo.Word_Entity_tbl WHERE
dbo.Identify_Entity_tbl.D_ID = dbo.Word_Entity_tbl.ID

END

--Azure

DECLARE @sql varchar(max)
SELECT @sql=ISNULL(@sql,'')+'DROP TABLE '+name+';'
FROM sys.objects
WHERE name LIKE REPLACE(REPLACE(LOWER ( system_user ),'\','_'),'-','') + '_' +'%' and type='U'
EXEC (@sql)

EXEC sp_recompile 'Word_Entity_tbl'
EXEC sp_recompile 'Identify_Entity_tbl'
GO

EXEC dbo.S_ID_DEL_LIST_RUN


select name from sys.all_objects where name ='Word_Entity_tbl'
select count(*) as 'Word_Entity_tblの登録データ数' from Word_Entity_tbl
select name from sys.all_objects where name ='Identify_Entity_tbl'
select name from sys.all_objects where name ='S_KENSAKU_SUB'
select name from sys.all_objects where name ='S_KENSAKU_WIDE'
select name from sys.all_objects where name ='S_KENSAKU_SUB2'
select name from sys.all_objects where name ='S_KENSAKU_WIDE2'
select name from sys.all_objects where name ='S_ID_DEL_LIST'
select name from sys.all_objects where name ='S_ID_DEL_LIST_RUN'



