USE [K-MEMO2]
GO

/****** Object:  StoredProcedure [dbo].[S_KENSAKU_MAIN]    Script Date: 2016/02/22 11:49:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		SKojima@kitahama.or.jp
-- Create date: 2014-07-30 14:40
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[S_KENSAKU_MAIN]
	-- Add the parameters for the stored procedure here
	@P1 as int 
	,@P2 as int
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

DECLARE @W_F_ID_WORDS nvarchar(2048)
DECLARE @W_D_ID_WORDS nvarchar(2048) 

DECLARE @WK_SQL nvarchar(max) 

DECLARE @WK_SQL_IN nvarchar(4000) 
DECLARE @WK_SQL_IN_FLG int
DECLARE @WK_SQL_IN_LAST nvarchar(50) 

DECLARE @WK_SQL_FD nvarchar(4000) 
DECLARE @WK_SQL_FD_FLG int
DECLARE @WK_SQL_FD_LAST nvarchar(50) 


SET @WK_SQL_IN_FLG = 0
SET @WK_SQL_IN = ' and [識別ID] IN  (select [識別ID] from dbo.Identify_Entity_tbl where [識別ID] IN ('


SET @WK_SQL_FD_FLG = 0
SET @WK_SQL_FD = ' and ( '

--//////////////////////////////////////////////
-- 未使用
--//////////////////////////////////////////////
/*

--識別IDが、ストアド定義ファイルなのかをチェック
--F_ID = [4][識別ID]が２つ以上存在する場合はストアド定義とみなす

SET @WK_CHECK = ISNULL((SELECT 
 TOP (1) COUNT(*) AS 'WK_CHECK'
 FROM                     dbo.Identify_Entity_tbl
 WHERE (識別ID = @P1 )
 GROUP BY F_ID, D_ID
 ORDER BY 'WK_CHECK' DESC),0)

--select @WK_CHECK

if @WK_CHECK > 1
--自分は、検索対象から外す
SET @WK_SQL = 'SELECT * From dbo.Identify_Entity_tbl Where [識別ID] <> ' + cast(@P1 as nvarchar(50)) + ' '
else
SET @WK_SQL = 'SELECT * From dbo.Identify_Entity_tbl Where [識別ID] > 0 '

-- 未使用
--//////////////////////////////////////////////
*/


SET @WK_CHECK = ISNULL((SELECT 
 TOP (1) COUNT(*) AS 'WK_CHECK'
 FROM dbo.Identify_Entity_tbl
 WHERE [識別ID] = @P1 and F_ID = 0 and D_ID = ISNULL(@P2,0)
 ORDER BY 'WK_CHECK' DESC),0)

--select @WK_CHECK

--//////////////////////////////////////////////////////////////////

if @WK_CHECK > 0

--◆
BEGIN

--自分は、検索対象から外す
SET @WK_SQL = 'SELECT * From dbo.Identify_Entity_tbl Where [識別ID] <> ' + cast(@P1 as nvarchar(50)) + ' '

/* カーソル定義 */
DECLARE csr_1 CURSOR LOCAL SCROLL DYNAMIC
FOR 
SELECT * From dbo.Identify_Entity_tbl Where [識別ID] = @P1

/* カーソルOPEN */
OPEN csr_1

/*先頭レコードの取得*/
FETCH NEXT FROM csr_1 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先 
/* ループ処理（全レコードの検索が完了するまで） */
WHILE (@@fetch_status =0)
--◆◆
BEGIN

--メインの識別IDで無ければ識別IDをデータとして処理
if ISNULL( @W_F_ID ,0) = 4 and ( ISNULL( @W_識別IDリンク先,0) > 0)
	BEGIN
		SET @WK_SQL_IN = @WK_SQL_IN + cast(@W_識別IDリンク先 as nvarchar(50)) + ','

		SET @WK_SQL_IN_LAST = cast(@W_識別IDリンク先 as nvarchar(50)) + ' )) '

		SET @WK_SQL_IN_FLG = @WK_SQL_IN_FLG + 1
	END

else


	if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_F_ID , 0 ) >= 4 and ( ISNULL( @W_D_ID,0) > 0 )

		--◆◆◆
		BEGIN
			SET @WK_SQL = @WK_SQL + ' and [識別ID] IN  (select [識別ID] from dbo.Identify_Entity_tbl where F_ID = '  + cast(@W_F_ID as nvarchar(50)) + ' and D_ID = '  + cast(@W_D_ID as nvarchar(50)) + '  ) ' 
		--◆◆◆
		END

		else

		--[F_ID][0][なし]　として　[D_ID]を指定している場合		
	if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_F_ID , 0 ) = 0 and ( ISNULL( @W_D_ID,0) > 0 )

		--◆◆◆
		BEGIN
			SET @WK_SQL = @WK_SQL + ' and [識別ID] IN  (select [識別ID] from dbo.Identify_Entity_tbl where D_ID = '  + cast(@W_D_ID as nvarchar(50)) + '  ) ' 
		--◆◆◆
		END

		else


		--D_IDが無い場合、表示列を指定する
		--識別名行以外を表示 
		if ISNULL( @W_T_ID , 0 ) > 0 and ISNULL( @W_D_ID , 0 ) = 0 
			BEGIN						

				SET @WK_SQL_FD = @WK_SQL_FD + ' F_ID = ' + cast(@W_F_ID as nvarchar(50))+' or ' 

				SET @WK_SQL_FD_LAST = ' F_ID = ' + cast(@W_F_ID as nvarchar(50)) + ' ) '

				SET @WK_SQL_FD_FLG = @WK_SQL_FD_FLG + 1

			END


/* 次レコード検索処理 */
FETCH NEXT FROM csr_1 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先 
--◆◆
END

if ISNULL( @WK_SQL_IN_FLG , 0 ) > 0 
BEGIN
		SET @WK_SQL = @WK_SQL + @WK_SQL_IN + @WK_SQL_IN_LAST
END

if ISNULL( @WK_SQL_FD_FLG , 0 ) > 0 
BEGIN
		SET @WK_SQL = @WK_SQL + @WK_SQL_FD + @WK_SQL_FD_LAST
END

SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , [ソート]'

--select @WK_SQL

/* カーソルCLOSE・解放 */
CLOSE csr_1
DEALLOCATE csr_1

--◆
END

	--------------------------
	else
	--

	BEGIN

		--SET @WK_SQL = 'SELECT * From dbo.Identify_Entity_tbl Where [識別ID] = ' + cast(@P1 as nvarchar(50)) 

		SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.主キー'
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.T_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.ソート '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.ユニット '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.F_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Word_Entity_tbl.WORDS AS F_ID_WORDS '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_F_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.D_ID '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_D_ID '
		SET @WK_SQL = @WK_SQL + ', Word_Entity_tbl_1.WORDS AS D_ID_WORDS '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.識別IDリンク先 '
		SET @WK_SQL = @WK_SQL + ', dbo.Identify_Entity_tbl.G_識別IDリンク先 '
		SET @WK_SQL = @WK_SQL + ' From dbo.Identify_Entity_tbl LEFT OUTER JOIN '
		SET @WK_SQL = @WK_SQL + ' dbo.Word_Entity_tbl Word_Entity_tbl_1 ON '
		SET @WK_SQL = @WK_SQL + ' dbo.Identify_Entity_tbl.D_ID = Word_Entity_tbl_1.ID LEFT OUTER JOIN '
		SET @WK_SQL = @WK_SQL + ' dbo.Word_Entity_tbl ON dbo.Identify_Entity_tbl.F_ID = dbo.Word_Entity_tbl.ID '
		SET @WK_SQL = @WK_SQL + ' Where dbo.Identify_Entity_tbl.識別ID = ' + cast(@P1 as nvarchar(50))

		SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , [ソート]'

	END

--select @WK_SQL

EXEC sp_executesql @WK_SQL


---------------------------------------------------------
END

GO

