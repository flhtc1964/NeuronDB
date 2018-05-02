USE [K-MEMO]
GO

/****** Object:  Table [dbo].[Identify_Entity_tbl]    Script Date: 2016/05/26  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if object_id('dbo.Identify_Entity_tbl') is null

CREATE TABLE [dbo].[Identify_Entity_tbl](
	[主キー] [int] IDENTITY (1, 1) NOT NULL ,
	[識別ID] [int] NULL,
	[G_識別ID] [int] NULL,
	[T_ID] [int] NOT NULL,
	[ソート] [int] NOT NULL,
	[ユニット] [int] NOT NULL,
	[F_ID] [int] NOT NULL,
	[G_F_ID] [int] NULL,
	[F_ID_WORDS] [nvarchar] (2014) COLLATE Japanese_CI_AS NOT NULL ,
	[D_ID] [int] NULL,
	[G_D_ID] [int] NULL,
	[D_ID_WORDS] [nvarchar] (2014) COLLATE Japanese_CI_AS NULL ,
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

else
