USE [K-MEMO]
GO

/****** Object:  Table [dbo].[Word_Entity_tbl]    Script Date: 2016/05/26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Word_Entity_tbl](
	[ID] [int] IDENTITY (0, 1) NOT NULL ,
	[WORDS] [nvarchar] (2014) COLLATE Japanese_CI_AS NOT NULL ,
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

