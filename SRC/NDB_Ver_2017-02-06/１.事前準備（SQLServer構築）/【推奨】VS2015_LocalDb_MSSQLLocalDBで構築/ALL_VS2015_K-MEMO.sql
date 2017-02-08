
USE [master]
GO



EXEC sp_configure 'contained database authentication', 1
RECONFIGURE



CREATE DATABASE [K-MEMO] COLLATE Japanese_XJIS_100_CI_AS
GO



select name,collation_name from sys.databases
GO



USE [K-MEMO]
GO




SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Word_Entity_tbl](
	[ID] [int] IDENTITY (0, 1) NOT NULL ,
	[WORDS] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NOT NULL ,
	[WK_ID] [int] NULL,
	[G_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2085 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'WK_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'WK_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1200 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'WK_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1200 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Word_Entity_tbl'
GO




/****** Object:  Table [dbo].[Identify_Entity_tbl]    Script Date: 2016/03/07 15:13:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('なし')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('未来')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('現在')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('過去')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('識別名')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('人')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('法人')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('True')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('False')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('氏')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('氏ヨミ')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('名')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('名ヨミ')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('性別')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('男性')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('女性')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('男性（元女性）')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('女性（元男性）')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('備考')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('生年月日（西暦）')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('生年月日（和暦）')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約021')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約022')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約023')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約024')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約025')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約026')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約027')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約028')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約029')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約030')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約031')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約032')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約033')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約034')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約035')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約036')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約037')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約038')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約039')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約040')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約041')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約042')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約043')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約044')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約045')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約046')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約047')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約048')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約049')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約050')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約051')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約052')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約053')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約054')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約055')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約056')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約057')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約058')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約059')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約060')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約061')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約062')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約063')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約064')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約065')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約066')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約067')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約068')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約069')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約070')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約071')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約072')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約073')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約074')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約075')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約076')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約077')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約078')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約079')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約080')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約081')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約082')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約083')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約084')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約085')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約086')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約087')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約088')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約089')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約090')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約091')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約092')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約093')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約094')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約095')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約096')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約097')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約098')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約099')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約100')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約101')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約102')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約103')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約104')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約105')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約106')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約107')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約108')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約109')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約110')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約111')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約112')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約113')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約114')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約115')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約116')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約117')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約118')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約119')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約120')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約121')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約122')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約123')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約124')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約125')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約126')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約127')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約128')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約129')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約130')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約131')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約132')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約133')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約134')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約135')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約136')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約137')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約138')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約139')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約140')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約141')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約142')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約143')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約144')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約145')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約146')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約147')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約148')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約149')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約150')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約151')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約152')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約153')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約154')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約155')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約156')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約157')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約158')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約159')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約160')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約161')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約162')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約163')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約164')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約165')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約166')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約167')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約168')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約169')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約170')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約171')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約172')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約173')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約174')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約175')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約176')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約177')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約178')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約179')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約180')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約181')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約182')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約183')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約184')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約185')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約186')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約187')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約188')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約189')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約190')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約191')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約192')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約193')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約194')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約195')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約196')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約197')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約198')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約199')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約200')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約201')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約202')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約203')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約204')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約205')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約206')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約207')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約208')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約209')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約210')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約211')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約212')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約213')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約214')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約215')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約216')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約217')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約218')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約219')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約220')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約221')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約222')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約223')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約224')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約225')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約226')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約227')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約228')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約229')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約230')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約231')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約232')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約233')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約234')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約235')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約236')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約237')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約238')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約239')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約240')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約241')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約242')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約243')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約244')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約245')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約246')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約247')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約248')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約249')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約250')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約251')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約252')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約253')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約254')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約255')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約256')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約257')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約258')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約259')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約260')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約261')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約262')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約263')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約264')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約265')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約266')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約267')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約268')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約269')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約270')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約271')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約272')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約273')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約274')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約275')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約276')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約277')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約278')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約279')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約280')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約281')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約282')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約283')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約284')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約285')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約286')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約287')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約288')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約289')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約290')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約291')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約292')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約293')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約294')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約295')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約296')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約297')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約298')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約299')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約300')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約301')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約302')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約303')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約304')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約305')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約306')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約307')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約308')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約309')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約310')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約311')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約312')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約313')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約314')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約315')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約316')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約317')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約318')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約319')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約320')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約321')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約322')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約323')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約324')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約325')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約326')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約327')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約328')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約329')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約330')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約331')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約332')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約333')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約334')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約335')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約336')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約337')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約338')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約339')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約340')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約341')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約342')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約343')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約344')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約345')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約346')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約347')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約348')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約349')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約350')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約351')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約352')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約353')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約354')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約355')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約356')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約357')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約358')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約359')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約360')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約361')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約362')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約363')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約364')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約365')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約366')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約367')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約368')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約369')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約370')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約371')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約372')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約373')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約374')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約375')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約376')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約377')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約378')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約379')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約380')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約381')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約382')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約383')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約384')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約385')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約386')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約387')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約388')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約389')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約390')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約391')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約392')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約393')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約394')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約395')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約396')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約397')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約398')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約399')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約400')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約401')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約402')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約403')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約404')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約405')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約406')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約407')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約408')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約409')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約410')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約411')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約412')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約413')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約414')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約415')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約416')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約417')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約418')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約419')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約420')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約421')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約422')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約423')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約424')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約425')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約426')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約427')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約428')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約429')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約430')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約431')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約432')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約433')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約434')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約435')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約436')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約437')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約438')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約439')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約440')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約441')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約442')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約443')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約444')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約445')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約446')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約447')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約448')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約449')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約450')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約451')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約452')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約453')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約454')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約455')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約456')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約457')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約458')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約459')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約460')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約461')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約462')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約463')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約464')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約465')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約466')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約467')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約468')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約469')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約470')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約471')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約472')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約473')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約474')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約475')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約476')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約477')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約478')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約479')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約480')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約481')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約482')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約483')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約484')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約485')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約486')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約487')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約488')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約489')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約490')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約491')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約492')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約493')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約494')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約495')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約496')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約497')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約498')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約499')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約500')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約501')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約502')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約503')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約504')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約505')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約506')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約507')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約508')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約509')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約510')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約511')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約512')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約513')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約514')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約515')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約516')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約517')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約518')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約519')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約520')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約521')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約522')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約523')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約524')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約525')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約526')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約527')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約528')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約529')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約530')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約531')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約532')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約533')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約534')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約535')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約536')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約537')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約538')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約539')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約540')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約541')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約542')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約543')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約544')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約545')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約546')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約547')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約548')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約549')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約550')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約551')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約552')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約553')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約554')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約555')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約556')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約557')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約558')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約559')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約560')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約561')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約562')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約563')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約564')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約565')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約566')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約567')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約568')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約569')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約570')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約571')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約572')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約573')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約574')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約575')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約576')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約577')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約578')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約579')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約580')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約581')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約582')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約583')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約584')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約585')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約586')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約587')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約588')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約589')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約590')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約591')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約592')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約593')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約594')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約595')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約596')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約597')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約598')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約599')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約600')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約601')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約602')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約603')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約604')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約605')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約606')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約607')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約608')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約609')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約610')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約611')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約612')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約613')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約614')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約615')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約616')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約617')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約618')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約619')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約620')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約621')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約622')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約623')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約624')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約625')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約626')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約627')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約628')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約629')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約630')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約631')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約632')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約633')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約634')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約635')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約636')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約637')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約638')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約639')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約640')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約641')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約642')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約643')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約644')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約645')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約646')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約647')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約648')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約649')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約650')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約651')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約652')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約653')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約654')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約655')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約656')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約657')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約658')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約659')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約660')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約661')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約662')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約663')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約664')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約665')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約666')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約667')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約668')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約669')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約670')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約671')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約672')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約673')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約674')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約675')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約676')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約677')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約678')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約679')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約680')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約681')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約682')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約683')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約684')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約685')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約686')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約687')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約688')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約689')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約690')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約691')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約692')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約693')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約694')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約695')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約696')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約697')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約698')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約699')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約700')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約701')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約702')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約703')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約704')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約705')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約706')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約707')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約708')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約709')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約710')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約711')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約712')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約713')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約714')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約715')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約716')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約717')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約718')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約719')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約720')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約721')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約722')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約723')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約724')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約725')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約726')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約727')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約728')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約729')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約730')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約731')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約732')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約733')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約734')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約735')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約736')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約737')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約738')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約739')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約740')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約741')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約742')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約743')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約744')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約745')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約746')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約747')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約748')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約749')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約750')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約751')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約752')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約753')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約754')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約755')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約756')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約757')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約758')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約759')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約760')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約761')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約762')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約763')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約764')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約765')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約766')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約767')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約768')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約769')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約770')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約771')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約772')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約773')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約774')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約775')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約776')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約777')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約778')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約779')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約780')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約781')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約782')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約783')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約784')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約785')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約786')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約787')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約788')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約789')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約790')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約791')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約792')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約793')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約794')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約795')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約796')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約797')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約798')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約799')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約800')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約801')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約802')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約803')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約804')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約805')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約806')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約807')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約808')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約809')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約810')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約811')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約812')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約813')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約814')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約815')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約816')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約817')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約818')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約819')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約820')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約821')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約822')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約823')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約824')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約825')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約826')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約827')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約828')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約829')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約830')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約831')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約832')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約833')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約834')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約835')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約836')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約837')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約838')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約839')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約840')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約841')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約842')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約843')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約844')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約845')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約846')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約847')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約848')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約849')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約850')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約851')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約852')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約853')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約854')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約855')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約856')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約857')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約858')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約859')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約860')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約861')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約862')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約863')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約864')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約865')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約866')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約867')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約868')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約869')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約870')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約871')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約872')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約873')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約874')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約875')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約876')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約877')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約878')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約879')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約880')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約881')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約882')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約883')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約884')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約885')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約886')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約887')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約888')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約889')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約890')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約891')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約892')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約893')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約894')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約895')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約896')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約897')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約898')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約899')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('S_KENSAKU_MAIN')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('S_KENSAKU_SUB')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('S_KENSAKU_WIDE')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約903')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約904')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約905')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約906')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約907')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約908')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約909')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約910')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約911')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約912')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約913')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約914')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約915')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約916')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約917')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約918')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約919')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約920')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約921')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約922')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約923')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約924')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約925')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約926')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約927')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約928')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約929')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約930')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約931')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約932')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約933')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約934')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約935')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約936')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約937')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約938')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約939')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約940')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約941')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約942')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約943')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約944')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約945')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約946')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約947')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約948')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約949')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約950')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約951')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約952')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約953')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約954')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約955')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約956')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約957')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約958')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約959')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約960')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約961')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約962')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約963')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約964')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約965')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約966')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約967')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約968')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約969')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約970')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約971')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約972')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約973')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約974')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約975')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約976')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約977')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約978')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約979')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約980')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約981')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約982')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約983')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約984')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約985')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約986')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約987')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約988')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約989')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約990')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約991')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約992')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約993')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約994')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約995')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約996')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約997')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約998')
INSERT INTO dbo.word_entity_tbl ( WORDS ) VALUES('システム予約999')
GO



/****** Object:  Table [dbo].[Identify_Entity_tbl]    Script Date: 2016/05/26  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Identify_Entity_tbl](
	[主キー] [int] IDENTITY (1, 1) NOT NULL ,
	[識別ID] [int] NULL,
	[G_識別ID] [int] NULL,
	[T_ID] [int] NOT NULL,
	[ソート] [int] NOT NULL,
	[ユニット] [int] NOT NULL,
	[F_ID] [int] NOT NULL,
	[G_F_ID] [int] NULL,
	[F_ID_WORDS] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NOT NULL ,
	[D_ID] [int] NULL,
	[G_D_ID] [int] NULL,
	[D_ID_WORDS] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL ,
	[識別IDリンク先] [int] NULL,
	[G_識別IDリンク先] [int] NULL,
	[識別IDリンク先使用数] [int] NULL,
	[G_識別IDリンク先使用数] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[主キー] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'主キー'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'主キー'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=720 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'主キー'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=705 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=885 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'T_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'T_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=510 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'T_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ソート'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ソート'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=630 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ソート'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ユニット'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ユニット'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=780 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'ユニット'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'F_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'F_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=540 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'F_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_F_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_F_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=690 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_F_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'F_ID_WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'F_ID_WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1170 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'F_ID_WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'D_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'D_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=540 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'D_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_D_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_D_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=705 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_D_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'D_ID_WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'D_ID_WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2085 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'D_ID_WORDS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別IDリンク先'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別IDリンク先'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別IDリンク先'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別IDリンク先'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別IDリンク先'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別IDリンク先'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別IDリンク先使用数'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別IDリンク先使用数'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'識別IDリンク先使用数'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別IDリンク先使用数'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別IDリンク先使用数'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl', @level2type=N'COLUMN',@level2name=N'G_識別IDリンク先使用数'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'Identify_Entity_tbl.主キー' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=20300 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Identify_Entity_tbl'
GO




/****** Object:  StoredProcedure [dbo].[S_KENSAKU_SUB]    Script Date: 2016/05/24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[S_KENSAKU_SUB]
	@P1 as int 
	,@P2 as int
	,@P3 as  nvarchar(500)
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


--@P2の指定したレコードがあるかチェック
SET @WK_CHECK = ISNULL((SELECT 
 TOP (1) COUNT(*) AS 'WK_CHECK'
 FROM dbo.Identify_Entity_tbl
 WHERE [識別ID] = @P1 and F_ID = 4 and D_ID = ISNULL(@P2,0)
 ORDER BY 'WK_CHECK' DESC),0)

--select @WK_CHECK

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

if @WK_CHECK > 0


--◆
BEGIN








--上記２つを足して、作業用テーブル名を作成
SET @WK_SAGYOU_ST = @WK_USER_NAME + '_' + @WK_SYSTEM_DATE_TIME  + '_ST'

--項目の表示順

SET @WK_SQL_ST = 'create table ' + @WK_SAGYOU_ST + ' (S int,F int primary key)'
EXECUTE ( @WK_SQL_ST )

SET @WK_SQL_ST = 'insert into ' + @WK_SAGYOU_ST + '(S,F) SELECT ソート,F_ID From dbo.Identify_Entity_tbl Where [識別ID] = ' +  cast(@P1 as nvarchar(50)) + ' and ISNULL(F_ID,0) > 0 and ISNULL(D_ID,0) <1 order by [ソート]'
EXECUTE (@WK_SQL_ST)


--EXECUTE ('select * from ' + @WK_SAGYOU_ST)



--自分は、検索対象から外す
SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl  left outer join ' +  @WK_SAGYOU_ST + ' ON dbo.Identify_Entity_tbl.F_ID = ' +  @WK_SAGYOU_ST + '.F Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] <> ' + cast(@P1 as nvarchar(50)) + ' '

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

SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , ' + @WK_SAGYOU_ST + '.S , [ソート]'

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


	--
	SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + ' )   and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [D_ID_WORDS] like ''%' + cast(@P3_3 as nvarchar(500)) + '%'')  ORDER BY [識別ID] , [T_ID] , [ソート]'

	--select @WK_SQL
	END


	--------------------------

	else if @P1 < 1000

	BEGIN
		if len(ISNULL(@P3_3,'')) > 0 
		BEGIN
		--◆引数有◆　識別ID　降順  @P1 = 識別ID　, P2 = 901 と、ストアド番号を指定
		SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P2 as nvarchar(50)) + ' ) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [D_ID_WORDS] like ''' + cast(@P3_3 as nvarchar(500)) + ''' and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2) and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2 ORDER BY [識別ID],[T_ID],[ソート]'
		END
		else
		BEGIN
		--◆引数無し◆　識別ID　降順  @P1 = 識別ID　, P2 = 901 と、ストアド番号を指定
		SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P2 as nvarchar(50)) + ' )  and [ユニット] = ''' + cast(@P3_2 as nvarchar(500)) + ''' and ISNULL([T_ID],0) = 2 ORDER BY [識別ID],[T_ID],[ソート]'

		END
	END

	else

	BEGIN

		SET @WK_SQL = 'SELECT * From dbo.Identify_Entity_tbl Where [識別ID] = ' + cast(@P1 as nvarchar(50)) + ' ORDER BY [識別ID],[T_ID],[ソート]'

	END











--------------------------------------------------------------------------------------------------------------
--   動的基本@WK_SQL組立終了
--------------------------------------------------------------------------------------------------------------

--select @WK_SQL

--EXEC sp_executesql @WK_SQL

/*
--最大列名数取得
SET @WK_SQL2 = REPLACE(@WK_SQL,'SELECT *','SELECT  TOP (1) count(*)  AS WK_CHECK ')
SET @WK_SQL2 = REPLACE(@WK_SQL2,'ORDER BY [識別ID] , [ソート]','GROUP BY [識別ID]  ORDER BY WK_CHECK DESC')

--select @WK_SQL2

EXECUTE ( 'DECLARE csr_1 CURSOR SCROLL DYNAMIC FOR ' + @WK_SQL2 )

/* カーソルOPEN */
OPEN csr_1

/*先頭レコードの取得*/
FETCH NEXT FROM csr_1 INTO  @WK_CR1_R_MAX

--select @WK_CR2_R_MAX

/* カーソルCLOSE・解放 */
CLOSE csr_1
DEALLOCATE csr_1

*/






--上記２つを足して、作業用テーブル名を作成
SET @WK_SAGYOU_TBL = @WK_USER_NAME + '_' + @WK_SYSTEM_DATE_TIME



--縦データを横データに並び替える作業用テーブルを作成
SET @WK_SQL2 = 'CREATE TABLE ' + @WK_SAGYOU_TBL + ' ('
SET @WK_SQL2 = @WK_SQL2 + '[主キー] [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY ,'
SET @WK_SQL2 = @WK_SQL2 + '[識別ID] [int] NOT NULL,'


SET @i = 1

WHILE @i <@WK_CR1_R_MAX
BEGIN
SET @WK_SQL2 = @WK_SQL2 + '[MID' + cast(@i as nvarchar(50))  + '] [int] NULL,'
SET @WK_SQL2 = @WK_SQL2 + '[MDT' + cast(@i as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL ,'

SET @i = @i + 1

END

SET @WK_SQL2 = @WK_SQL2 + '[MID' + cast(@WK_CR1_R_MAX as nvarchar(50))  + '] [int] NULL,'
SET @WK_SQL2 = @WK_SQL2 + '[MDT' + cast(@WK_CR1_R_MAX as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL '

--SET @WK_SQL2 = @WK_SQL2 + ' , CONSTRAINT [PK_WK_TBL_History]  PRIMARY KEY CLUSTERED ([主キー] ASC)'

SET @WK_SQL2 = @WK_SQL2 + ') '


--select @WK_SQL2

EXECUTE ( @WK_SQL2 )

--一時テーブルは無理だったので使用しない
--DECLARE @WK_FOO nvarchar(2048)
--SET @WK_FOO = cast(@WK_CR2_R_MAX as nvarchar(50))
--EXECUTE ( @WK_SQL + ' ; insert into #WK_TBL ([識別ID]) values( ' + @WK_FOO + ') ; ' + 'select * from #WK_TBL' )





--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* カーソル定義 */
--最初に作成しておいたSQL文を使用
EXECUTE ( 'DECLARE csr_2 CURSOR SCROLL DYNAMIC FOR ' + @WK_SQL )


--カーソル2用
SET @WK_CR2_R_NO = 0
SET @WK_CR2_R_SU = 0
SET @WK_CR2_R_MAX = 0

/* カーソルOPEN */
OPEN csr_2

/*先頭レコードの取得*/
FETCH NEXT FROM csr_2 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先, @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数


/* ループ処理（全レコードの検索が完了するまで） */
WHILE (@@fetch_status =0)
--◆◆
BEGIN


	if @WK_CR2_R_NO <> @W_識別ID and @WK_CR2_R_SU > 0
	BEGIN





			------------------------------------------------------------
			--既定の列数（ @WK_CR1_R_MAX ）より多いなら、列を追加する
			------------------------------------------------------------

			if @WK_CR2_R_SU > @WK_CR1_R_MAX
				BEGIN

					SET @i = @WK_CR1_R_MAX + 1

					WHILE @i < @WK_CR2_R_SU + 1
						BEGIN
						SET @WK_SQL2 = 'ALTER TABLE ' + @WK_SAGYOU_TBL + ' ADD '
						SET @WK_SQL2 = @WK_SQL2 +  '[MID' + cast(@i as nvarchar(50))  + '] [int] NULL,'	
						SET @WK_SQL2 = @WK_SQL2 +  '[MDT' + cast(@i as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL '	

						--select @WK_SQL2

						EXECUTE ( @WK_SQL2 )

						SET @i = @i + 1

						END

					SET @WK_CR1_R_MAX = @WK_CR2_R_SU 

				END
			------------------------------------------------------------







		SET @WK_SQL5 = left(@WK_SQL3,len(@WK_SQL3) - 1) + ') '
		SET @WK_SQL5 = @WK_SQL5 + left(@WK_SQL4,len(@WK_SQL4) - 1) + ')'

		EXECUTE ( @WK_SQL5 )
		
		--select @WK_SQL5

		SET @WK_CR2_R_SU = 0


	END



	if @WK_CR2_R_SU = 0
	BEGIN
		SET @WK_SQL3 = 'insert into [dbo].[' + @WK_SAGYOU_TBL + '] ( ' + '[識別ID],'
		SET @WK_SQL4 = ' values( ' + cast(@W_識別ID as nvarchar(50)) + ','
	END






	--if @W_F_ID <> 4
	--BEGIN

	SET @WK_CR2_R_SU = @WK_CR2_R_SU + 1	

	SET @WK_SQL3 = @WK_SQL3 + '[MID' + cast(@WK_CR2_R_SU as nvarchar(50)) + '],[MDT' + cast(@WK_CR2_R_SU as nvarchar(50)) + '],'

	SET @W_D_ID_WORDS = (select WORDS from dbo.Word_Entity_tbl where ID = @W_D_ID )

	SET @WK_SQL4 = @WK_SQL4 + cast(@W_主キー as nvarchar(50)) + ',' + 'N' + CHAR(39) + ISNULL(@W_D_ID_WORDS,'') + CHAR(39) + ','
	--END



	SET @WK_CR2_R_NO = @W_識別ID

		--select @WK_SQL3
		--select @WK_SQL4


--select @W_主キー,@W_識別ID,@W_T_ID,@W_ソート, @W_ユニット, @W_F_ID, @W_F_ID_WORDS,  @W_D_ID, @W_D_ID_WORDS, @W_識別IDリンク先

/* 次レコード検索処理 */
FETCH NEXT FROM csr_2 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先, @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数



--◆◆
END


	--識別IDが１個だけの処理
	if @WK_CR2_R_SU > 0 
		BEGIN

		SET @WK_SQL5 = left(@WK_SQL3,len(@WK_SQL3) - 1) + ') '
		SET @WK_SQL5 = @WK_SQL5 + left(@WK_SQL4,len(@WK_SQL4) - 1) + ')'

		EXECUTE ( @WK_SQL5 )
		
		--select @WK_SQL5

		--SET @WK_CR2_R_SU = 0

		END







			------------------------------------------------------------
			--既定の列数（ @WK_CR1_R_MAX ）よりデータが少ないなら、列を削除する
			------------------------------------------------------------
			if @WK_CR1_R_MAX > @WK_CR2_R_SU
				BEGIN

					SET @i = @WK_CR2_R_SU + 1

					WHILE @i < @WK_CR1_R_MAX + 1
						BEGIN
						SET @WK_SQL2 = 'ALTER TABLE ' + @WK_SAGYOU_TBL + ' DROP COLUMN '
						SET @WK_SQL2 = @WK_SQL2 +  '[MID' + cast(@i as nvarchar(50))  + '] , '	
						SET @WK_SQL2 = @WK_SQL2 +  '[MDT' + cast(@i as nvarchar(50))  + ']'	

						--select @WK_SQL2

						EXECUTE ( @WK_SQL2 )

						SET @i = @i + 1

						END

					SET @WK_CR1_R_MAX = @WK_CR2_R_SU 

				END












--最大列数
--select @WK_CR2_R_MAX


/* カーソルCLOSE・解放 */
CLOSE csr_2
DEALLOCATE csr_2

if @P1 < 1000
BEGIN




	SET @i = 1

	WHILE @i < @WK_CR2_R_SU + 1
		BEGIN
		SET @WK_SQL2 = 'ALTER TABLE ' + @WK_SAGYOU_TBL + ' DROP COLUMN '
		SET @WK_SQL2 = @WK_SQL2 +  '[MID' + cast(@i as nvarchar(50))  + '] '

		--select @WK_SQL2

		EXECUTE ( @WK_SQL2 )

		SET  @WK_SQL5 = REPLACE(@WK_SQL5, '[MID' + cast(@i as nvarchar(50)) + '],' ,'')
		SET  @WK_SQL5 = REPLACE(@WK_SQL5, '[MID' + cast(@i as nvarchar(50)) + ']' ,'')

		SET @i = @i + 1

		END




--select @WK_SQL5

DECLARE @W_SUBST_START int
DECLARE @W_SUBST_END int



SET @W_SUBST_START =charindex('( [識別ID],',@WK_SQL5) + 9
SET @W_SUBST_END = charindex(')  values(', @WK_SQL5) - @W_SUBST_START

--select @W_SUBST_START,@W_SUBST_END

	SET @WK_SQL = 'select ' + substring(@WK_SQL5,@W_SUBST_START,@W_SUBST_END) + ' , count([識別ID]) as '+ CHAR(39)  + '使用回数' + CHAR(39) 
	SET @WK_SQL = @WK_SQL + ' from [dbo].[' + @WK_SAGYOU_TBL + '] '	
	SET @WK_SQL = @WK_SQL + ' GROUP BY ' + substring(@WK_SQL5,@W_SUBST_START,@W_SUBST_END)
	SET @WK_SQL = @WK_SQL + ' ORDER BY count([識別ID]) DESC '

	--select  @WK_SQL

	EXEC sp_executesql @WK_SQL

END

else

BEGIN

SET @WK_SQL = 'select * from [dbo].[' + @WK_SAGYOU_TBL + ']' 
EXEC sp_executesql @WK_SQL

END

--【Azure】では一時テーブルは使えないので以下の２行を有効に
SET @WK_SQL = 'drop table [dbo].[' + @WK_SAGYOU_TBL + ']'
EXEC sp_executesql @WK_SQL


END

---------------------------------------------------------
END







GO


/****** Object:  StoredProcedure [dbo].[S_KENSAKU_WIDE]    Script Date: 2016/05/24  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[S_KENSAKU_WIDE]
	@P1 as int 
	,@P2 as int
	,@P3 as  nvarchar(500)
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
SET @P3_3 = ISNULL(@P3,'')
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


--@P2の指定したレコードがあるかチェック
SET @WK_CHECK = ISNULL((SELECT 
 TOP (1) COUNT(*) AS 'WK_CHECK'
 FROM dbo.Identify_Entity_tbl
 WHERE [識別ID] = @P1 and F_ID = 4 and D_ID = ISNULL(@P2,0)
 ORDER BY 'WK_CHECK' DESC),0)

--select @WK_CHECK

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

if @WK_CHECK > 0


--◆
BEGIN








--上記２つを足して、作業用テーブル名を作成
SET @WK_SAGYOU_ST = @WK_USER_NAME + '_' + @WK_SYSTEM_DATE_TIME  + '_ST'

--項目の表示順

SET @WK_SQL_ST = 'create table ' + @WK_SAGYOU_ST + ' (S int,F int primary key)'
EXECUTE ( @WK_SQL_ST )

SET @WK_SQL_ST = 'insert into ' + @WK_SAGYOU_ST + '(S,F) SELECT ソート,F_ID From dbo.Identify_Entity_tbl Where [識別ID] = ' +  cast(@P1 as nvarchar(50)) + ' and ISNULL(F_ID,0) > 0 and ISNULL(D_ID,0) <1 order by [ソート]'
EXECUTE (@WK_SQL_ST)


--EXECUTE ('select * from ' + @WK_SAGYOU_ST)



--自分は、検索対象から外す
SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl  left outer join ' +  @WK_SAGYOU_ST + ' ON dbo.Identify_Entity_tbl.F_ID = ' +  @WK_SAGYOU_ST + '.F Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] <> ' + cast(@P1 as nvarchar(50)) + ' '

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

SET @WK_SQL = @WK_SQL + ' ORDER BY [識別ID] , ' + @WK_SAGYOU_ST + '.S , [ソート]'

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
	--
	--SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + ' )   and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [D_ID_WORDS] like ''%' + cast(@P3 as nvarchar(500)) + '%'')  ORDER BY [識別ID] ,[ソート]'

	if @P1 < 1000
	BEGIN
	--識別ID　降順  @P1 = 903, P2 = 903 と、ストアド番号を指定
	SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000) and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [D_ID_WORDS] like ''%' + cast(@P3_3 as nvarchar(500)) + '%'')  ORDER BY [識別ID] DESC , [T_ID] , [ソート] '

	END
	else
	BEGIN

	--識別名を絞り込む場合　@P1 = 識別名　, P2 = 同じ識別目　
	SET @WK_SQL = 'SELECT dbo.Identify_Entity_tbl.* From dbo.Identify_Entity_tbl Where [識別ID] NOT IN (SELECT [識別ID] FROM [dbo].[Identify_Entity_tbl]  WHERE F_ID = 4 and D_ID < 1000)and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where F_ID = 4 and D_ID = ' + cast(@P1 as nvarchar(50)) + ' )  and [識別ID] IN  ( select [識別ID] from dbo.Identify_Entity_tbl where [D_ID_WORDS] like ''%' + cast(@P3_3 as nvarchar(500)) + '%'')  ORDER BY [識別ID] DESC , [T_ID] , [ソート]'


	END



	--select @WK_SQL

	END
	--------------------------
	else
	--------------------------

	BEGIN

		SET @WK_SQL = 'SELECT * From dbo.Identify_Entity_tbl Where [識別ID] = ' + cast(@P1 as nvarchar(50)) + ' ORDER BY [識別ID] , [T_ID] , [ソート]'

		

	END











--------------------------------------------------------------------------------------------------------------
--   動的基本@WK_SQL組立終了
--------------------------------------------------------------------------------------------------------------

--select @WK_SQL

--EXEC sp_executesql @WK_SQL

/*
--最大列名数取得
SET @WK_SQL2 = REPLACE(@WK_SQL,'SELECT *','SELECT  TOP (1) count(*)  AS WK_CHECK ')
SET @WK_SQL2 = REPLACE(@WK_SQL2,'ORDER BY [識別ID] , [ソート]','GROUP BY [識別ID]  ORDER BY WK_CHECK DESC')

--select @WK_SQL2

EXECUTE ( 'DECLARE csr_1 CURSOR SCROLL DYNAMIC FOR ' + @WK_SQL2 )

/* カーソルOPEN */
OPEN csr_1

/*先頭レコードの取得*/
FETCH NEXT FROM csr_1 INTO  @WK_CR1_R_MAX

--select @WK_CR2_R_MAX

/* カーソルCLOSE・解放 */
CLOSE csr_1
DEALLOCATE csr_1

*/






--上記２つを足して、作業用テーブル名を作成
SET @WK_SAGYOU_TBL = @WK_USER_NAME + '_' + @WK_SYSTEM_DATE_TIME



--縦データを横データに並び替える作業用テーブルを作成
SET @WK_SQL2 = 'CREATE TABLE ' + @WK_SAGYOU_TBL + ' ('
SET @WK_SQL2 = @WK_SQL2 + '[主キー] [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY ,'
SET @WK_SQL2 = @WK_SQL2 + '[識別ID] [int] NOT NULL,'


SET @i = 1

WHILE @i <@WK_CR1_R_MAX
BEGIN
SET @WK_SQL2 = @WK_SQL2 + '[MID' + cast(@i as nvarchar(50))  + '] [int] NULL,'
SET @WK_SQL2 = @WK_SQL2 + '[MDT' + cast(@i as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL ,'

SET @i = @i + 1

END

SET @WK_SQL2 = @WK_SQL2 + '[MID' + cast(@WK_CR1_R_MAX as nvarchar(50))  + '] [int] NULL,'
SET @WK_SQL2 = @WK_SQL2 + '[MDT' + cast(@WK_CR1_R_MAX as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL '

--SET @WK_SQL2 = @WK_SQL2 + ' , CONSTRAINT [PK_WK_TBL_History]  PRIMARY KEY CLUSTERED ([主キー] ASC)'

SET @WK_SQL2 = @WK_SQL2 + ') '


--select @WK_SQL2

EXECUTE ( @WK_SQL2 )

--一時テーブルは無理だったので使用しない
--DECLARE @WK_FOO nvarchar(2048)
--SET @WK_FOO = cast(@WK_CR2_R_MAX as nvarchar(50))
--EXECUTE ( @WK_SQL + ' ; insert into #WK_TBL ([識別ID]) values( ' + @WK_FOO + ') ; ' + 'select * from #WK_TBL' )





--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* カーソル定義 */
--最初に作成しておいたSQL文を使用
EXECUTE ( 'DECLARE csr_2 CURSOR SCROLL DYNAMIC FOR ' + @WK_SQL )


--カーソル2用
SET @WK_CR2_R_NO = 0
SET @WK_CR2_R_SU = 0

SET @WK_CR2_R_SU_SAIDAI = 0

SET @WK_CR2_R_MAX = 0


SET @WK_SQL8_2 = ''


/* カーソルOPEN */
OPEN csr_2

/*先頭レコードの取得*/
FETCH NEXT FROM csr_2 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先, @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数


/* ループ処理（全レコードの検索が完了するまで） */
WHILE (@@fetch_status = 0)
--◆◆
BEGIN


--◆
       --  前回の識別IDと今回読み込んだ識別IDが違い、　列が１個目以上
	if @WK_CR2_R_NO <> @W_識別ID and @WK_CR2_R_SU > 0
	BEGIN

		--「項目列」部分
		SET @WK_SQL7 = left(@WK_SQL5,len(@WK_SQL5) - 1) + ') '

		--「データ」部分
		SET @WK_SQL8 = @WK_SQL7 + left(@WK_SQL6,len(@WK_SQL6) - 1) + ')'


		--select substring(@WK_SQL8_2,charindex(',N',@WK_SQL8_2),len(@WK_SQL8_2)-charindex(',N',@WK_SQL8_2)),substring(@WK_SQL8,charindex(',N',@WK_SQL8),len(@WK_SQL8)-charindex(',N',@WK_SQL8))

		if  substring(@WK_SQL8_2,charindex(',N',@WK_SQL8_2),len(@WK_SQL8_2)-charindex(',N',@WK_SQL8_2)) <> substring(@WK_SQL8,charindex(',N',@WK_SQL8),len(@WK_SQL8)-charindex(',N',@WK_SQL8))
			BEGIN

			------------------------------------------------------------
			--既定の列数（ @WK_CR1_R_MAX ）より多いなら、列を追加する
			------------------------------------------------------------

			if @WK_CR2_R_SU_SAIDAI > @WK_CR1_R_MAX
				BEGIN

					SET @i = @WK_CR1_R_MAX + 1

					WHILE @i < @WK_CR2_R_SU_SAIDAI + 1
						BEGIN
						SET @WK_SQL2 = 'ALTER TABLE ' + @WK_SAGYOU_TBL + ' ADD '
						SET @WK_SQL2 = @WK_SQL2 +  '[MID' + cast(@i as nvarchar(50))  + '] [int] NULL,'	
						SET @WK_SQL2 = @WK_SQL2 +  '[MDT' + cast(@i as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL '	

						--select @WK_SQL2

						EXECUTE ( @WK_SQL2 )

						SET @i = @i + 1

						END

					SET @WK_CR1_R_MAX = @WK_CR2_R_SU_SAIDAI 

				END
			------------------------------------------------------------


			--列レコードの追加
			EXECUTE ( @WK_SQL8 )

			--列名が同一化どうかチェックし、前回と同じなら列名は追加しない
			SET @WK_SQL8_2 = @WK_SQL8

			END






		SET @WK_SQL9 = left(@WK_SQL3,len(@WK_SQL3) - 1) + ') '
		SET @WK_SQL9 = @WK_SQL9 + left(@WK_SQL4,len(@WK_SQL4) - 1) + ')'

				--データレコードの追加
				EXECUTE ( @WK_SQL9 )



		--最高列数をカウント
		if @WK_CR2_R_SU > @WK_CR2_R_SU_SAIDAI 
		BEGIN
			SET @WK_CR2_R_SU_SAIDAI = @WK_CR2_R_SU 
		END


		SET @WK_CR2_R_SU = 0


	END
--◆


	if @WK_CR2_R_SU = 0
	BEGIN
		SET @WK_SQL3 = 'insert into [dbo].[' + @WK_SAGYOU_TBL + '] ( ' + '[識別ID],'
		SET @WK_SQL4 = ' values( ' + cast(@W_識別ID as nvarchar(50)) + ','
		
		
		SET @WK_SQL5 = 'insert into [dbo].[' + @WK_SAGYOU_TBL + '] ( ' + '[識別ID],'
		SET @WK_SQL6 = ' values( ' + cast(@W_識別ID as nvarchar(50)) + ','
		
	END






	--if @W_F_ID <> 4
	--BEGIN

	SET @WK_CR2_R_SU = @WK_CR2_R_SU + 1	

	SET @WK_SQL3 = @WK_SQL3 + '[MID' + cast(@WK_CR2_R_SU as nvarchar(50)) + '],[MDT' + cast(@WK_CR2_R_SU as nvarchar(50)) + '],'

	SET @W_D_ID_WORDS = (select WORDS from dbo.Word_Entity_tbl where ID = @W_D_ID )

	SET @WK_SQL4 = @WK_SQL4 + cast(@W_主キー as nvarchar(50)) + ',' + 'N' + CHAR(39) + ISNULL(@W_D_ID_WORDS,'') + CHAR(39) + ','
	--END






	--「項目列」のみ
	SET @WK_SQL5 = @WK_SQL5 + '[MDT' + cast(@WK_CR2_R_SU as nvarchar(50)) + '],'

	SET @W_F_ID_WORDS = (select WORDS from dbo.Word_Entity_tbl where ID = @W_F_ID )

	SET @WK_SQL6 = @WK_SQL6 + 'N' + CHAR(39) + ISNULL(@W_F_ID_WORDS,'') + CHAR(39) + ','



	--select @WK_CR2_R_SU , @WK_CR1_R_MAX 



	SET @WK_CR2_R_NO = @W_識別ID

		--select @WK_SQL3
		--select @WK_SQL4


--select @W_主キー,@W_識別ID,@W_T_ID,@W_ソート, @W_ユニット, @W_F_ID, @W_F_ID_WORDS,  @W_D_ID, @W_D_ID_WORDS, @W_識別IDリンク先

/* 次レコード検索処理 */
FETCH NEXT FROM csr_2 INTO  @W_主キー , @W_識別ID , @W_G_識別ID , @W_T_ID , @W_ソート , @W_ユニット , @W_F_ID , @W_G_F_ID , @W_F_ID_WORDS ,  @W_D_ID , @W_G_D_ID ,  @W_D_ID_WORDS , @W_識別IDリンク先 , @W_G_識別IDリンク先, @W_識別IDリンク先使用数 , @W_G_識別IDリンク先使用数



--◆◆
END


	--識別IDが１個だけの処理
	if @WK_CR2_R_SU > 0 
		BEGIN

		--「項目列」部分
		SET @WK_SQL7 = left(@WK_SQL5,len(@WK_SQL5) - 1) + ') '

		--「データ」部分
		SET @WK_SQL8 = @WK_SQL7 + left(@WK_SQL6,len(@WK_SQL6) - 1) + ')'



		if  substring(@WK_SQL8_2,charindex(',N',@WK_SQL8_2),len(@WK_SQL8_2)-charindex(',N',@WK_SQL8_2)) <> substring(@WK_SQL8,charindex(',N',@WK_SQL8),len(@WK_SQL8)-charindex(',N',@WK_SQL8))
			BEGIN

			------------------------------------------------------------
			--既定の列数（ @WK_CR1_R_MAX ）より多いなら、列を追加する
			------------------------------------------------------------




			if @WK_CR2_R_SU_SAIDAI > @WK_CR1_R_MAX
				BEGIN

					SET @i = @WK_CR1_R_MAX + 1

					WHILE @i < @WK_CR2_R_SU_SAIDAI + 1
						BEGIN
						SET @WK_SQL2 = 'ALTER TABLE ' + @WK_SAGYOU_TBL + ' ADD '
						SET @WK_SQL2 = @WK_SQL2 +  '[MID' + cast(@i as nvarchar(50))  + '] [int] NULL,'	
						SET @WK_SQL2 = @WK_SQL2 +  '[MDT' + cast(@i as nvarchar(50))  + '] [nvarchar] (2014) COLLATE Japanese_XJIS_100_CI_AS NULL '	

						--select @WK_SQL2

						EXECUTE ( @WK_SQL2 )

						SET @i = @i + 1

						END

					SET @WK_CR1_R_MAX = @WK_CR2_R_SU_SAIDAI 



				END
			------------------------------------------------------------


			--列レコードの追加
			EXECUTE ( @WK_SQL8 )


			END


			--列名が同一化どうかチェックし、前回と同じなら列名は追加しない
			SET @WK_SQL8_2 = @WK_SQL7



		SET @WK_SQL9 = left(@WK_SQL3,len(@WK_SQL3) - 1) + ') '
		SET @WK_SQL9 = @WK_SQL9 + left(@WK_SQL4,len(@WK_SQL4) - 1) + ')'

				--データレコードの追加
				EXECUTE ( @WK_SQL9 )


		END

				--select @WK_CR2_R_SU, @WK_CR2_R_SU_SAIDAI , @WK_CR1_R_MAX

				--該当データが1行だけなら
				if @WK_CR2_R_SU_SAIDAI < @WK_CR2_R_SU
				BEGIN
					SET @WK_CR2_R_SU_SAIDAI = @WK_CR2_R_SU
				END






			------------------------------------------------------------
			--既定の列数（ @WK_CR1_R_MAX ）よりデータが少ないなら、列を削除する
			------------------------------------------------------------
			if @WK_CR1_R_MAX > @WK_CR2_R_SU_SAIDAI
				BEGIN

					SET @i = @WK_CR2_R_SU_SAIDAI + 1

					WHILE @i < @WK_CR1_R_MAX + 1
						BEGIN
						SET @WK_SQL2 = 'ALTER TABLE ' + @WK_SAGYOU_TBL + ' DROP COLUMN '
						SET @WK_SQL2 = @WK_SQL2 +  '[MID' + cast(@i as nvarchar(50))  + '] , '	
						SET @WK_SQL2 = @WK_SQL2 +  '[MDT' + cast(@i as nvarchar(50))  + ']'	

						--select @WK_SQL2

						EXECUTE ( @WK_SQL2 )

						SET @i = @i + 1

						END

				END












--最大列数
--select @WK_CR2_R_MAX


/* カーソルCLOSE・解放 */
CLOSE csr_2
DEALLOCATE csr_2

SET @WK_SQL = 'select * from [dbo].[' + @WK_SAGYOU_TBL + ']' 

EXEC sp_executesql @WK_SQL


--【Azure】では一時テーブルは使えないので以下の２行を有効に
SET @WK_SQL = 'drop table [dbo].[' + @WK_SAGYOU_TBL + ']'
EXEC sp_executesql @WK_SQL

END

---------------------------------------------------------
END

GO







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

	SET @WK_SQL2 = @WK_SQL2 + 'SELECT ROW_NUMBER() OVER(PARTITION BY [識別ID] ORDER BY [主キー] ) AS ''seq'',' 
	
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

	SET @WK_SQL2 = @WK_SQL2 + 'SELECT ROW_NUMBER() OVER(PARTITION BY [識別ID] ORDER BY [主キー] ) AS ''seq'',' 
	
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



