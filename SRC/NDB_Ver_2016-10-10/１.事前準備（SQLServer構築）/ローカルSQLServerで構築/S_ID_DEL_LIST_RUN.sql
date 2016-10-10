USE [K-MEMO]
GO

/****** Object:  StoredProcedure [dbo].[S_ID_DEL_LIST_RUN]    Script Date: 2016/03/09 10:17:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[S_ID_DEL_LIST_RUN]
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

DECLARE @sql varchar(max)
SELECT @sql=ISNULL(@sql,'')+'DROP TABLE '+name+';'
FROM sys.objects
WHERE name LIKE REPLACE(REPLACE(LOWER ( system_user ),'\','_'),'-','') + '_' +'%' and type='U'
EXEC (@sql)

GO

