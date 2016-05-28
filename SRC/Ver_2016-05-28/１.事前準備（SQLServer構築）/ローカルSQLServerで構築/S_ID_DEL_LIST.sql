USE [K-MEMO]
GO

/****** Object:  StoredProcedure [dbo].[S_ID_DEL_LIST]    Script Date: 2016/03/09 10:16:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[S_ID_DEL_LIST]
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

