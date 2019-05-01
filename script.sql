USE [master]
GO
/****** Object:  Database [LMS]    Script Date: 5/1/2019 8:30:17 PM ******/
CREATE DATABASE [LMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'D:\Study\IT\Y3\LMS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'D:\Study\IT\Y3\LMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LMS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMS] SET RECOVERY FULL 
GO
ALTER DATABASE [LMS] SET  MULTI_USER 
GO
ALTER DATABASE [LMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LMS', N'ON'
GO
USE [LMS]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBook](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [varchar](10) NULL,
	[SupplierID] [varchar](10) NULL,
	[BookCode] [varchar](10) NOT NULL,
	[Titel] [nvarchar](30) NULL,
	[Qty] [int] NULL,
	[Author] [nvarchar](30) NULL,
	[YearOfPrinting] [int] NULL,
 CONSTRAINT [PK__tblBook__0A5FFCC6168C719C] PRIMARY KEY CLUSTERED 
(
	[BookCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBorrow]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBorrow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BorrowID] [varchar](10) NULL,
	[BookCode] [varchar](10) NULL,
	[Qty] [int] NULL,
	[Price] [real] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryType] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblImport]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImportID] [varchar](10) NOT NULL,
	[LibrarianID] [varchar](10) NULL,
	[SupplierID] [varchar](10) NULL,
	[CategoryID] [varchar](10) NULL,
	[Qty] [int] NULL,
	[ImportDate] [date] NULL,
	[Amount] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BorrowID] [varchar](10) NOT NULL,
	[ReaderID] [varchar](10) NULL,
	[LribrarianID] [varchar](10) NULL,
	[BorrowDate] [date] NULL,
 CONSTRAINT [PK_tblInvoice] PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInvoiceReturn]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInvoiceReturn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnID] [varchar](10) NOT NULL,
	[LibrarianID] [varchar](10) NULL,
	[ReaderID] [varchar](10) NULL,
	[BorrowDate] [date] NULL,
 CONSTRAINT [PK_tblInvoiceReturn] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLibrarian]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLibrarian](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LibrarianID] [varchar](10) NOT NULL,
	[LibrarianName] [nvarchar](30) NULL,
	[Gender] [char](7) NULL,
	[DOB] [date] NULL,
	[Phone] [varchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Photo] [varchar](255) NULL,
 CONSTRAINT [PK__tblLibra__E4D86D9DDC637DBA] PRIMARY KEY CLUSTERED 
(
	[LibrarianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReader]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReader](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReaderID] [varchar](10) NOT NULL,
	[ReaderName] [nvarchar](30) NULL,
	[Gender] [char](7) NULL,
	[DOB] [date] NULL,
	[Positon] [nvarchar](20) NULL,
	[Place] [nvarchar](30) NULL,
	[Phone/Email] [varchar](100) NULL,
	[Address] [nvarchar](50) NULL,
	[Photo] [varchar](200) NULL,
 CONSTRAINT [PK__tblReade__8E67A5811C3924BD] PRIMARY KEY CLUSTERED 
(
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReturn]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReturn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnID] [varchar](10) NOT NULL,
	[BookCode] [varchar](10) NULL,
	[Qty] [int] NULL,
	[Status] [int] NULL,
	[ExpriedDate] [date] NULL,
	[AmountExpried] [int] NULL,
	[Amount] [real] NULL,
	[TotalAmount] [real] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSupplier]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSupplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LibrarianID] [varchar](10) NULL,
	[UserID] [varchar](10) NOT NULL,
	[UserName] [nvarchar](30) NULL,
	[Password] [varchar](10) NULL,
	[UserType] [varchar](15) NULL,
	[DateStart] [date] NULL,
 CONSTRAINT [PK__tblUser__1788CCAC7918BF0C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_Librarian]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_Librarian]
as
SELECT 
      [LibrarianID] as [Librarian ID]
      ,[LibrarianName] as [Librarian Name]
      ,[Gender]
      ,[DOB]
      ,[Phone]
      ,[Address]
      ,[Photo]
  FROM [LMS].[dbo].[tblLibrarian]


GO
/****** Object:  UserDefinedFunction [dbo].[f_SearchLibrarianName]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_SearchLibrarianName] (@name nvarchar(30))
returns table
as
return
select *
from v_Librarian
where [Librarian Name] like @name


GO
/****** Object:  View [dbo].[v_Category]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_Category]
as
SELECT
      [CategoryID] as [Category ID]
      ,[CategoryType] as [Category Type]
  FROM [LMS].[dbo].[tblCategory]


GO
/****** Object:  UserDefinedFunction [dbo].[f_SearchCategoryType]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[f_SearchCategoryType] (@name nvarchar(30))
returns table
as
return
select *
from v_Category
where [Category Type] like @name


GO
/****** Object:  View [dbo].[v_BorrowDetail]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_BorrowDetail]
AS
SELECT dbo.tblBorrow.BorrowID, dbo.tblReader.ReaderID, dbo.tblReader.ReaderName, dbo.tblLibrarian.LibrarianID, dbo.tblLibrarian.LibrarianName, dbo.tblBorrow.BookCode, dbo.tblBook.Titel, dbo.tblBorrow.Qty, dbo.tblBorrow.Price, dbo.tblBorrow.Status, dbo.tblInvoice.BorrowDate, 
             DATEADD(day, 7, dbo.tblInvoice.BorrowDate) AS ExprieDate, CASE WHEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoice.BorrowDate), GETDATE()) < 0 THEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoice.BorrowDate), GETDATE()) * - 1 ELSE 0 END AS [Days Left], 
             CASE WHEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoice.BorrowDate), GETDATE()) > 0 THEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoice.BorrowDate), GETDATE()) ELSE 0 END AS [Days Exceeded]
FROM   dbo.tblBorrow INNER JOIN
             dbo.tblInvoice ON dbo.tblBorrow.BorrowID = dbo.tblInvoice.BorrowID INNER JOIN
             dbo.tblReader ON dbo.tblInvoice.ReaderID = dbo.tblReader.ReaderID INNER JOIN
             dbo.tblLibrarian ON dbo.tblInvoice.LribrarianID = dbo.tblLibrarian.LibrarianID INNER JOIN
             dbo.tblBook ON dbo.tblBorrow.BookCode = dbo.tblBook.BookCode


GO
/****** Object:  View [dbo].[v_ReaderExpried]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_ReaderExpried]
AS
SELECT BorrowID, ReaderID, ReaderName, LibrarianID, LibrarianName, BookCode, Titel, Qty, Price, Status, BorrowDate, ExprieDate, [Days Left], [Days Exceeded]
FROM   dbo.v_BorrowDetail
WHERE ([Days Exceeded] > 0) AND (Status = 1)



GO
/****** Object:  View [dbo].[v_Book]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_Book]
as
SELECT 
      [BookCode] as Code
      ,[Titel]
      ,[Qty]
      ,[Author]
      ,[YearOfPrinting] as [Year Of Printing]
      ,[CategoryID]
      ,[SupplierID]
  FROM [LMS].[dbo].[tblBook]


GO
/****** Object:  UserDefinedFunction [dbo].[f_SearchBookTitle]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[f_SearchBookTitle] (@name nvarchar(30))
returns table
as
return
select *
from v_Book
where Titel like @name



GO
/****** Object:  View [dbo].[v_Reader]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_Reader]
as
SELECT 
      [ReaderID]
      ,[ReaderName] as [Name]
      ,[Gender]
      ,[DOB]
      ,[Positon]
      ,[Place]
      ,[Phone/Email]
      ,[Address]
      ,[Photo]
  FROM [LMS].[dbo].[tblReader]


GO
/****** Object:  UserDefinedFunction [dbo].[f_SearchReader]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[f_SearchReader] (@name nvarchar(30))
returns table
as
return
select *
from v_Reader
where Name like @name


GO
/****** Object:  View [dbo].[v_User]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_User]
AS
SELECT dbo.tblUser.LibrarianID, dbo.tblUser.UserID, dbo.tblUser.UserName, dbo.tblUser.Password, dbo.tblUser.UserType, dbo.tblUser.DateStart, DATEADD(MM, 1, dbo.tblUser.DateStart) AS ExprieDate, dbo.tblLibrarian.LibrarianName
FROM   dbo.tblUser INNER JOIN
             dbo.tblLibrarian ON dbo.tblUser.LibrarianID = dbo.tblLibrarian.LibrarianID


GO
/****** Object:  UserDefinedFunction [dbo].[f_SearchUserName1]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[f_SearchUserName1] (@name nvarchar(30))
returns table
as
return
select *
from v_User
where UserName like @name



GO
/****** Object:  View [dbo].[v_BorrowD]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[v_BorrowD]
as
SELECT [BorrowID] as [Borrow ID]
      ,[ReaderName] [Reader Name]
	  ,sum(Qty) Qty
	  ,sum(Price) Price
      ,[LibrarianName] [Librarian Name]
      ,[BorrowDate] [Borrow Date]
	  ,[Status]
  FROM [LMS].[dbo].[v_BorrowDetail]
  d
  group by [BorrowID]
      ,[ReaderName]
      ,[LibrarianName]
      ,[BorrowDate]
	  ,[Status]
GO
/****** Object:  View [dbo].[v_ReturnDetail]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_ReturnDetail]
AS
SELECT dbo.tblReturn.ReturnID, 
	   dbo.tblInvoiceReturn.LibrarianID, 
	   dbo.tblLibrarian.LibrarianName,
	   dbo.tblInvoiceReturn.ReaderID, dbo.tblReader.ReaderName, dbo.tblInvoiceReturn.BorrowDate, dbo.tblReturn.BookCode, dbo.tblBook.Titel, dbo.tblReturn.Qty, dbo.tblReturn.Status, 
       dbo.tblReturn.ExpriedDate as [ReturnDate], 
	   CASE WHEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoiceReturn.BorrowDate), GETDATE()) > 0 THEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoiceReturn.BorrowDate), GETDATE()) ELSE 0 END AS [Days Exceeded]
	   , dbo.tblReturn.Amount,
			 (CASE WHEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoiceReturn.BorrowDate), GETDATE()) > 0 THEN DATEDIFF(day, DATEADD(day, 7, dbo.tblInvoiceReturn.BorrowDate), GETDATE()) ELSE 0 END)*dbo.tblReturn.Amount as [Total Amount]
FROM   dbo.tblReturn INNER JOIN
             dbo.tblBook ON dbo.tblReturn.BookCode = dbo.tblBook.BookCode INNER JOIN
             dbo.tblInvoiceReturn ON dbo.tblReturn.ReturnID = dbo.tblInvoiceReturn.ReturnID INNER JOIN
             dbo.tblLibrarian ON dbo.tblInvoiceReturn.LibrarianID = dbo.tblLibrarian.LibrarianID INNER JOIN
             dbo.tblReader ON dbo.tblInvoiceReturn.ReaderID = dbo.tblReader.ReaderID





GO
/****** Object:  View [dbo].[v_ReturnD]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[v_ReturnD]
as
SELECT [ReturnID] as [Return ID] 
      ,[ReaderName] as [Reader Name]
      ,count(BookCode) [Qty]	  
      ,[ReturnDate] as [Return Date]
      ,[Days Exceeded]
      ,[Total Amount]
	  ,[LibrarianName] as [Librarian Name] 
  FROM [v_ReturnDetail]
  group by [ReturnID]
      ,[LibrarianName]
      ,[ReaderName]
      ,[ReturnDate]
      ,[Days Exceeded]
      ,[Total Amount]

GO
/****** Object:  View [dbo].[v_Import]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Import]
as
SELECT 
      [ImportID] as [Import ID]
      ,[LibrarianID]
      ,[SupplierID]
      ,[CategoryID]
      ,[Qty]
      ,[ImportDate] as [Import Date]
      ,[Amount]
  FROM [LMS].[dbo].[tblImport]


GO
/****** Object:  View [dbo].[v_Invoice]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_Invoice]
AS
SELECT dbo.tblInvoice.BorrowID, dbo.tblInvoice.ReaderID, dbo.tblInvoice.LribrarianID, dbo.tblInvoice.BorrowDate, DATEADD(DD, 7, dbo.tblInvoice.BorrowDate) AS ReturnDate, dbo.tblBorrow.Status
FROM   dbo.tblInvoice INNER JOIN
             dbo.tblBorrow ON dbo.tblInvoice.BorrowID = dbo.tblBorrow.BorrowID


GO
/****** Object:  View [dbo].[v_LastCodeBook]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LastCodeBook]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([BookCode],charindex('0',[BookCode])+1,5))) as MBSCode
  FROM tblBook)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastCodeImport]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LastCodeImport]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([ImportID],charindex('0',[ImportID])+1,5))) as MBSCode
  FROM tblImport)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastIDBook]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_LastIDBook]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([ReaderID],charindex('0',[ReaderID])+1,5))) as MBSCode
  FROM tblReader)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastIDBorrow]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_LastIDBorrow]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([BorrowID],charindex('0',[BorrowID])+1,5))) as MBSCode
  FROM tblBorrow)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastIDCategory]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LastIDCategory]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([CategoryID],charindex('0',[CategoryID])+1,5))) as MBSCode
  FROM tblCategory)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastIDLibrarain]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LastIDLibrarain]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([LibrarianID],charindex('0',[LibrarianID])+1,5))) as MBSCode
  FROM tblLibrarian)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastIDSuppiler]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LastIDSuppiler]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([SupplierID],charindex('0',[SupplierID])+1,5))) as MBSCode
  FROM tblSupplier)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastIDUser]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LastIDUser]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([UserID],charindex('0',[UserID])+1,5))) as MBSCode
  FROM tblUser)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_LastInvoiceID]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_LastInvoiceID]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([BorrowID],charindex('0',[BorrowID])+1,5))) as MBSCode
  FROM tblInvoice)
  select Max(MBSCode) as Max_MBSCode
from Last_Code



GO
/****** Object:  View [dbo].[v_LastInvoiceReturnID]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_LastInvoiceReturnID]
  as
  with Last_Code
  as(
  select 
	convert(INT,RTRIM(substring([ReturnID],charindex('0',[ReturnID])+1,5))) as MBSCode
  FROM tblInvoiceReturn)
  select Max(MBSCode) as Max_MBSCode
from Last_Code


GO
/****** Object:  View [dbo].[v_Return]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[v_Return]
as
SELECT 
      [ReturnID]
      ,[BookCode]
      ,[Qty]
      ,[Status]
      ,[ExpriedDate]

     
      ,[Amount]
      ,[TotalAmount]
	  
  FROM [LMS].[dbo].[tblReturn]
  



GO
/****** Object:  View [dbo].[v_Supplier]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_Supplier]
as
SELECT
      [SupplierID]
      ,[Name]
      ,[Address]
      ,[Email]
      ,[Phone]
  FROM [LMS].[dbo].[tblSupplier]


GO
/****** Object:  View [dbo].[v_importDetail]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_importDetail]
AS
SELECT dbo.tblImport.ImportID, dbo.tblImport.LibrarianID, dbo.tblLibrarian.LibrarianName, dbo.tblImport.SupplierID, dbo.tblSupplier.Name, dbo.tblImport.CategoryID, dbo.tblCategory.CategoryType, dbo.tblImport.Qty, dbo.tblImport.Amount, dbo.tblImport.ImportDate
FROM   dbo.tblLibrarian INNER JOIN
             dbo.tblImport ON dbo.tblLibrarian.LibrarianID = dbo.tblImport.LibrarianID INNER JOIN
             dbo.tblSupplier ON dbo.tblImport.SupplierID = dbo.tblSupplier.SupplierID INNER JOIN
             dbo.tblBook ON dbo.tblSupplier.SupplierID = dbo.tblBook.SupplierID INNER JOIN
             dbo.tblCategory ON dbo.tblImport.CategoryID = dbo.tblCategory.CategoryID AND dbo.tblBook.CategoryID = dbo.tblCategory.CategoryID



GO
/****** Object:  View [dbo].[v_login]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_login]
AS
SELECT dbo.tblLibrarian.LibrarianID, dbo.tblLibrarian.LibrarianName, dbo.tblUser.UserName, dbo.tblUser.UserID
FROM   dbo.tblLibrarian INNER JOIN
             dbo.tblUser ON dbo.tblLibrarian.LibrarianID = dbo.tblUser.LibrarianID



GO
SET IDENTITY_INSERT [dbo].[tblBook] ON 

INSERT [dbo].[tblBook] ([ID], [CategoryID], [SupplierID], [BookCode], [Titel], [Qty], [Author], [YearOfPrinting]) VALUES (1, N'C002', N'S003', N'BC001', N'ខ្មែរ(ថ្នាក់ទី៧)', 99, N'Boy', 2000)
INSERT [dbo].[tblBook] ([ID], [CategoryID], [SupplierID], [BookCode], [Titel], [Qty], [Author], [YearOfPrinting]) VALUES (2, N'C001', N'S001', N'BC002', N'គណិត(ថ្នាក់ទី៧)', 100, N'Dara', 2017)
INSERT [dbo].[tblBook] ([ID], [CategoryID], [SupplierID], [BookCode], [Titel], [Qty], [Author], [YearOfPrinting]) VALUES (3, N'C001', N'S002', N'BC003', N'គណិត(ថ្នាក់ទី៨)', 18, N'BG', 2019)
INSERT [dbo].[tblBook] ([ID], [CategoryID], [SupplierID], [BookCode], [Titel], [Qty], [Author], [YearOfPrinting]) VALUES (4, N'C001', N'S001', N'BC004', N'C++', 2, N'A', 2017)
INSERT [dbo].[tblBook] ([ID], [CategoryID], [SupplierID], [BookCode], [Titel], [Qty], [Author], [YearOfPrinting]) VALUES (5, N'C001', N'S002', N'BC005', N'Network', 50, N'Mr. Nara', 2009)
SET IDENTITY_INSERT [dbo].[tblBook] OFF
SET IDENTITY_INSERT [dbo].[tblBorrow] ON 

INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (38, N'B001', N'BC002', 1, 500, 0)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (71, N'B002', N'BC002', 1, 500, 0)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (72, N'B002', N'BC002', 1, 500, 0)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (73, N'B002', N'BC002', 1, 500, 0)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (74, N'B003', N'BC004', 1, 500, 1)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (75, N'B003', N'BC004', 1, 500, 1)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (76, N'B004', N'BC003', 1, 500, 1)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (77, N'B005', N'BC001', 1, 500, 1)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (78, N'B005', N'BC003', 1, 500, 1)
INSERT [dbo].[tblBorrow] ([ID], [BorrowID], [BookCode], [Qty], [Price], [Status]) VALUES (79, N'B005', N'BC004', 1, 500, 1)
SET IDENTITY_INSERT [dbo].[tblBorrow] OFF
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([ID], [CategoryID], [CategoryType]) VALUES (1, N'C001', N'គណិត')
INSERT [dbo].[tblCategory] ([ID], [CategoryID], [CategoryType]) VALUES (2, N'C002', N'ខ្មែរ')
INSERT [dbo].[tblCategory] ([ID], [CategoryID], [CategoryType]) VALUES (3, N'C003', N'អង់គ្លេស')
INSERT [dbo].[tblCategory] ([ID], [CategoryID], [CategoryType]) VALUES (4, N'C004', N'ថៃ')
INSERT [dbo].[tblCategory] ([ID], [CategoryID], [CategoryType]) VALUES (5, N'C005', N'រូបវិទ្យា')
INSERT [dbo].[tblCategory] ([ID], [CategoryID], [CategoryType]) VALUES (6, N'C006', N'IT')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblImport] ON 

INSERT [dbo].[tblImport] ([ID], [ImportID], [LibrarianID], [SupplierID], [CategoryID], [Qty], [ImportDate], [Amount]) VALUES (1, N'I001', N'L001', N'S001', N'C001', 100, CAST(N'2012-02-04' AS Date), 200)
INSERT [dbo].[tblImport] ([ID], [ImportID], [LibrarianID], [SupplierID], [CategoryID], [Qty], [ImportDate], [Amount]) VALUES (5, N'I002', N'L002', N'S002', N'C001', 100, CAST(N'2012-01-01' AS Date), 23)
INSERT [dbo].[tblImport] ([ID], [ImportID], [LibrarianID], [SupplierID], [CategoryID], [Qty], [ImportDate], [Amount]) VALUES (6, N'I003', N'L003', N'S003', N'C002', 100, CAST(N'2012-01-10' AS Date), 200)
SET IDENTITY_INSERT [dbo].[tblImport] OFF
SET IDENTITY_INSERT [dbo].[tblInvoice] ON 

INSERT [dbo].[tblInvoice] ([ID], [BorrowID], [ReaderID], [LribrarianID], [BorrowDate]) VALUES (24, N'B001', N'R001', N'L001', CAST(N'2019-04-22' AS Date))
INSERT [dbo].[tblInvoice] ([ID], [BorrowID], [ReaderID], [LribrarianID], [BorrowDate]) VALUES (38, N'B002', N'R001', N'L002', CAST(N'2019-04-28' AS Date))
INSERT [dbo].[tblInvoice] ([ID], [BorrowID], [ReaderID], [LribrarianID], [BorrowDate]) VALUES (39, N'B003', N'R001', N'L002', CAST(N'2019-05-01' AS Date))
INSERT [dbo].[tblInvoice] ([ID], [BorrowID], [ReaderID], [LribrarianID], [BorrowDate]) VALUES (40, N'B004', N'R002', N'L002', CAST(N'2019-05-01' AS Date))
INSERT [dbo].[tblInvoice] ([ID], [BorrowID], [ReaderID], [LribrarianID], [BorrowDate]) VALUES (41, N'B005', N'R003', N'L002', CAST(N'2019-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[tblInvoice] OFF
SET IDENTITY_INSERT [dbo].[tblInvoiceReturn] ON 

INSERT [dbo].[tblInvoiceReturn] ([ID], [ReturnID], [LibrarianID], [ReaderID], [BorrowDate]) VALUES (1, N'RT001', N'L001', N'R001', CAST(N'2019-04-13' AS Date))
INSERT [dbo].[tblInvoiceReturn] ([ID], [ReturnID], [LibrarianID], [ReaderID], [BorrowDate]) VALUES (33, N'RT002', N'L002', N'R001', CAST(N'2019-04-28' AS Date))
SET IDENTITY_INSERT [dbo].[tblInvoiceReturn] OFF
SET IDENTITY_INSERT [dbo].[tblLibrarian] ON 

INSERT [dbo].[tblLibrarian] ([ID], [LibrarianID], [LibrarianName], [Gender], [DOB], [Phone], [Address], [Photo]) VALUES (1, N'L001', N'Dare', N'Female ', CAST(N'1999-02-03' AS Date), N'012456798', N'PP', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\Books_HD_(8314929977).jpg')
INSERT [dbo].[tblLibrarian] ([ID], [LibrarianID], [LibrarianName], [Gender], [DOB], [Phone], [Address], [Photo]) VALUES (2, N'L002', N'Raty', N'Female ', CAST(N'1999-02-06' AS Date), N'087453267', N'KT', N'')
INSERT [dbo].[tblLibrarian] ([ID], [LibrarianID], [LibrarianName], [Gender], [DOB], [Phone], [Address], [Photo]) VALUES (3, N'L003', N'Daty1', N'Female ', CAST(N'2019-03-31' AS Date), N'12356', N'KPC', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\1417629988477.jpeg')
INSERT [dbo].[tblLibrarian] ([ID], [LibrarianID], [LibrarianName], [Gender], [DOB], [Phone], [Address], [Photo]) VALUES (4, N'L004', N'សុភា', N'Male   ', CAST(N'2019-04-01' AS Date), N'2323423', N'KP', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\library-management-system.jpg')
INSERT [dbo].[tblLibrarian] ([ID], [LibrarianID], [LibrarianName], [Gender], [DOB], [Phone], [Address], [Photo]) VALUES (15, N'L005', N'គា', N'Male   ', CAST(N'2019-04-02' AS Date), N'12324', N'aa', N'')
INSERT [dbo].[tblLibrarian] ([ID], [LibrarianID], [LibrarianName], [Gender], [DOB], [Phone], [Address], [Photo]) VALUES (16, N'L006', N'SS', N'Female ', CAST(N'2019-04-03' AS Date), N'dfd', N'df', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\1417629988477.jpeg')
SET IDENTITY_INSERT [dbo].[tblLibrarian] OFF
SET IDENTITY_INSERT [dbo].[tblReader] ON 

INSERT [dbo].[tblReader] ([ID], [ReaderID], [ReaderName], [Gender], [DOB], [Positon], [Place], [Phone/Email], [Address], [Photo]) VALUES (1, N'R001', N'Kopy', N'Male   ', CAST(N'2010-03-05' AS Date), N'Student', N'RUPP', N'017881704', N'KT', N'')
INSERT [dbo].[tblReader] ([ID], [ReaderID], [ReaderName], [Gender], [DOB], [Positon], [Place], [Phone/Email], [Address], [Photo]) VALUES (2, N'R002', N'Dada', N'Male   ', CAST(N'2019-04-03' AS Date), N'Student', N'RUPP', N'019834554', N'PP', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\Books_HD_(8314929977).jpg')
INSERT [dbo].[tblReader] ([ID], [ReaderID], [ReaderName], [Gender], [DOB], [Positon], [Place], [Phone/Email], [Address], [Photo]) VALUES (3, N'R003', N'ក្ថថងហ', N'Famale ', CAST(N'2014-04-23' AS Date), N'សិស្ស', N'វិទ្យាល័យ', N'dfdfgdf', N'ព្រះវិហារ', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\library-management-system.jpg')
INSERT [dbo].[tblReader] ([ID], [ReaderID], [ReaderName], [Gender], [DOB], [Positon], [Place], [Phone/Email], [Address], [Photo]) VALUES (4, N'R004', N'kk', N'Male   ', CAST(N'2019-04-27' AS Date), N'Student', N'RUpp', N'sjkdsfkjk', N'pp', N'C:\Users\DELL\Desktop\ISAD\LMS\LMS\bin\Debug\Photo\Books_HD_(8314929977).jpg')
SET IDENTITY_INSERT [dbo].[tblReader] OFF
SET IDENTITY_INSERT [dbo].[tblReturn] ON 

INSERT [dbo].[tblReturn] ([ID], [ReturnID], [BookCode], [Qty], [Status], [ExpriedDate], [AmountExpried], [Amount], [TotalAmount]) VALUES (2, N'RT001', N'BC002', 1, 0, CAST(N'2019-04-26' AS Date), -1, 200, 200)
INSERT [dbo].[tblReturn] ([ID], [ReturnID], [BookCode], [Qty], [Status], [ExpriedDate], [AmountExpried], [Amount], [TotalAmount]) VALUES (52, N'RT002', N'BC002', 1, 0, CAST(N'2019-04-28' AS Date), 0, 0, 0)
INSERT [dbo].[tblReturn] ([ID], [ReturnID], [BookCode], [Qty], [Status], [ExpriedDate], [AmountExpried], [Amount], [TotalAmount]) VALUES (53, N'RT002', N'BC003', 1, 0, CAST(N'2019-04-28' AS Date), 0, 0, 0)
INSERT [dbo].[tblReturn] ([ID], [ReturnID], [BookCode], [Qty], [Status], [ExpriedDate], [AmountExpried], [Amount], [TotalAmount]) VALUES (54, N'RT002', N'BC003', 1, 0, CAST(N'2019-04-28' AS Date), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[tblReturn] OFF
SET IDENTITY_INSERT [dbo].[tblSupplier] ON 

INSERT [dbo].[tblSupplier] ([ID], [SupplierID], [Name], [Address], [Email], [Phone]) VALUES (1, N'S001', N'CDP', N'PP', N'CDP@gmail.com', N'012564678')
INSERT [dbo].[tblSupplier] ([ID], [SupplierID], [Name], [Address], [Email], [Phone]) VALUES (2, N'S002', N'ABA1', N'PP', N'ABA@gmail.com', N'012444456')
INSERT [dbo].[tblSupplier] ([ID], [SupplierID], [Name], [Address], [Email], [Phone]) VALUES (3, N'S003', N'ACLDA', N'ក្រចេះ', N'ass', N'sdsfdfd')
SET IDENTITY_INSERT [dbo].[tblSupplier] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([ID], [LibrarianID], [UserID], [UserName], [Password], [UserType], [DateStart]) VALUES (1, N'L002', N'U001', N'kopy', N'A123', N'MASTINACRP', CAST(N'2019-04-02' AS Date))
INSERT [dbo].[tblUser] ([ID], [LibrarianID], [UserID], [UserName], [Password], [UserType], [DateStart]) VALUES (2, N'L001', N'U002', N'aa', N'123', N'INAC', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[tblUser] ([ID], [LibrarianID], [UserID], [UserName], [Password], [UserType], [DateStart]) VALUES (3, N'L003', N'U003', N'khg55', N'123', N'STRP', CAST(N'2019-04-03' AS Date))
INSERT [dbo].[tblUser] ([ID], [LibrarianID], [UserID], [UserName], [Password], [UserType], [DateStart]) VALUES (4, N'L001', N'U004', N'កដថដថ', N'123', N'MAST', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[tblUser] ([ID], [LibrarianID], [UserID], [UserName], [Password], [UserType], [DateStart]) VALUES (12, N'L002', N'U005', N'dd', N'11', N'STACRP', CAST(N'2019-04-02' AS Date))
INSERT [dbo].[tblUser] ([ID], [LibrarianID], [UserID], [UserName], [Password], [UserType], [DateStart]) VALUES (13, N'L004', N'U006', N'wee', N'11', N'MASTRP', CAST(N'2019-04-03' AS Date))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__Categor__45F365D3] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__Categor__45F365D3]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__Supplie__46E78A0C] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[tblSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__Supplie__46E78A0C]
GO
ALTER TABLE [dbo].[tblBorrow]  WITH CHECK ADD  CONSTRAINT [FK__tblBorrow__BookC__5070F446] FOREIGN KEY([BookCode])
REFERENCES [dbo].[tblBook] ([BookCode])
GO
ALTER TABLE [dbo].[tblBorrow] CHECK CONSTRAINT [FK__tblBorrow__BookC__5070F446]
GO
ALTER TABLE [dbo].[tblImport]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblImport]  WITH CHECK ADD  CONSTRAINT [FK__tblImport__Libra__49C3F6B7] FOREIGN KEY([LibrarianID])
REFERENCES [dbo].[tblLibrarian] ([LibrarianID])
GO
ALTER TABLE [dbo].[tblImport] CHECK CONSTRAINT [FK__tblImport__Libra__49C3F6B7]
GO
ALTER TABLE [dbo].[tblImport]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[tblSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[tblReturn]  WITH CHECK ADD  CONSTRAINT [FK__tblReturn__BookC__5535A963] FOREIGN KEY([BookCode])
REFERENCES [dbo].[tblBook] ([BookCode])
GO
ALTER TABLE [dbo].[tblReturn] CHECK CONSTRAINT [FK__tblReturn__BookC__5535A963]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__Librari__412EB0B6] FOREIGN KEY([LibrarianID])
REFERENCES [dbo].[tblLibrarian] ([LibrarianID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__Librari__412EB0B6]
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBook]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_InsertBook] (@CID varchar(10),@SID varchar(10),@ID varchar(10),@title nvarchar(30),@qty int,
						@author nvarchar(30),@YOP int)
							
as
insert into tblBook values(@CID,@SID,@ID,@title,@qty,@author,@YOP)


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBorrow]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_InsertBorrow] (@BID varchar(10),@BC varchar(10),@qty int,
						@deposit real,@Status int)
							
as
insert into tblBorrow values(@BID,@BC,@qty,@deposit,@Status)



GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCategory]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertCategory](@ID varchar(10),@name nvarchar(30))
as
Insert into tblCategory values(@ID,@name)
								


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertImport]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_InsertImport] (@IMID varchar(10),@LID varchar(10),@SID varchar(10),@CID varchar(10),@qty int,
						@date date,@amount real)
							
as
insert into tblImport values(@IMID,@LID,@SID,@CID,@qty,@date,@amount)


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertInvoice]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Procedure [dbo].[SP_InsertInvoice] (@BID varchar(10),@RID varchar(10),@LID varchar(10),
						@Sdate date)
							
as
insert into tblInvoice values(@BID,@RID,@LID,@Sdate)






GO
/****** Object:  StoredProcedure [dbo].[SP_InsertInvoiceReturn]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_InsertInvoiceReturn] (@RTID varchar(10),@RID varchar(10),@LID varchar(10),
						@Rdate date)
							
as
insert into tblInvoiceReturn values(@RTID,@LID,@RID,@Rdate)



GO
/****** Object:  StoredProcedure [dbo].[SP_InsertLibrarian]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertLibrarian](@ID varchar(10),@name nvarchar(30),@Gender char(7),
							@DOB date,@phone varchar(100),@address nvarchar(50),
							@Photo varchar(255))
as
Insert into tblLibrarian values(@ID,@name,@Gender,@DOB,
								@phone,@address,@Photo)


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertReader]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertReader](@ID varchar(10),@name nvarchar(30),@Gender char(7),
							@DOB date,@positon nvarchar(20),@place nvarchar(30),@phone varchar(100),@address nvarchar(50),
							@Photo varchar(200))
as
Insert into tblReader values(@ID,@name,@Gender,@DOB,@positon,@place,
								@phone,@address,@Photo)


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertReturn]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertReturn] (@RTID varchar(10),@BC varchar(10),@qty int,
						@Status int,@ExpriedDate date,@AmountExpried int,@Amount real,@TotalAmount real)
							
as
insert into tblReturn values(@RTID,@BC,@qty,@Status,@ExpriedDate,@AmountExpried,@Amount,@TotalAmount)




GO
/****** Object:  StoredProcedure [dbo].[SP_InsertSupplier]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertSupplier](@ID varchar(10),@name nvarchar(30),
							@address nvarchar(50),@email varchar(100),
							@phone varchar(10))
as
Insert into tblSupplier values(@ID,@name,@address,@email,@phone)								



GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUser]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertUser](@LID varchar(10),@UID varchar(10),@name nvarchar(30),@pass varchar(10),
							@UType varchar(15),@DS date)
as
Insert into tblUser values(@LID,@UID,@name,@pass,@UType,@DS)


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBook]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_UpdateBook] (@CID varchar(10),@SID varchar(10),@ID varchar(10),@title nvarchar(30),@qty int,
						@author nvarchar(30),@YOP int)
							
as
Update tblBook set CategoryID= @CID,SupplierID=@SID,Titel=@title,Qty=@qty,Author=@author,
							YearOfPrinting=@YOP where BookCode=@ID


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBorrow]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_UpdateBorrow] (@BID varchar(10),@BCode varchar(10),@qty int,@deposit real,
						@status int)
							
as
Update tblBorrow set BookCode= @BCode,Qty=@qty,Price=@deposit,
							Status=@status where BorrowID=@BID


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCategory]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateCategory](@ID varchar(10),@name nvarchar(30))
as
update tblCategory set CategoryType=@name where CategoryID=@ID
								


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateImport]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_UpdateImport] (@IMID varchar(10),@LID varchar(10),@SID varchar(10),@CID varchar(10),@qty int,
						@date date,@amount real)							
as
update  tblImport set LibrarianID=@LID,SupplierID=@SID,CategoryID=@CID,
Qty=@qty,ImportDate=@date,Amount=@amount where ImportID=@IMID


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateLibrarian]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateLibrarian](@ID varchar(10),@name nvarchar(30),@Gender char(7),
							@DOB date,@phone varchar(100),@address nvarchar(50),
							@Photo varchar(255))
as
Update tblLibrarian set LibrarianName=@name,Gender=@Gender,DOB=@DOB,Phone=@phone,
[Address]=@address,Photo=@Photo where LibrarianID=@ID


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateReader]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateReader](@ID varchar(10),@name nvarchar(30),@Gender char(7),
							@DOB date,@positon nvarchar(20),@place nvarchar(30),@phone varchar(100),@address nvarchar(50),
							@Photo varchar(200))
as
Update tblReader Set ReaderName=@name,Gender=@Gender,DOB=@DOB,Positon=@positon,Place=@place,[Phone/Email]=@phone,
						[Address]=@address,Photo=@Photo where ReaderID=@ID


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSupplier]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateSupplier](@ID varchar(10),@name nvarchar(30),
							@address nvarchar(50),@email varchar(100),
							@phone varchar(10))
as
update tblSupplier set Name=@name,[Address]=@address,Email=@email,Phone=@phone where SupplierID=@ID


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUser]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateUser](@LID varchar(10),@UID varchar(10),@name nvarchar(30),@pass varchar(10),
							@UType varchar(15),@DS date)
as
update tblUser set UserName=@name,[Password]=@pass,UserType=@UType,DateStart=@DS where LibrarianID=@LID and UserID=@UID


GO
/****** Object:  StoredProcedure [dbo].[sp_CopyBorrowTOReturn]    Script Date: 5/1/2019 8:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_CopyBorrowTOReturn] @BorrowID varchar(10),@ReaderID varchar(10)
as
Delete from tblInvoice
where BorrowID=@BorrowID and ReaderID=@ReaderID


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[62] 4[23] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -1456
      End
      Begin Tables = 
         Begin Table = "tblBorrow"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblInvoice"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblReader"
            Begin Extent = 
               Top = 59
               Left = 1053
               Bottom = 256
               Right = 1275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLibrarian"
            Begin Extent = 
               Top = 10
               Left = 608
               Bottom = 207
               Right = 830
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "tblBook"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 404
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1420
         Width = 1550
         Width = 1000
         Width = 1070
      End
   End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_BorrowDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_BorrowDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_BorrowDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[14] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblInvoice"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBorrow"
            Begin Extent = 
               Top = 39
               Left = 463
               Bottom = 236
               Right = 685
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[9] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v_BorrowDetail"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ReaderExpried'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ReaderExpried'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[37] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblReturn"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 284
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblReader"
            Begin Extent = 
               Top = 112
               Left = 312
               Bottom = 309
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tblBook"
            Begin Extent = 
               Top = 9
               Left = 620
               Bottom = 206
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tblInvoiceReturn"
            Begin Extent = 
               Top = 26
               Left = 899
               Bottom = 206
               Right = 1121
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblLibrarian"
            Begin Extent = 
               Top = 9
               Left = 1178
               Bottom = 206
               Right = 1400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1420
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1440
         Width = 1000
         Width = 10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ReturnDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'00
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ReturnDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ReturnDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblUser"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLibrarian"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblBook"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblImport"
            Begin Extent = 
               Top = 83
               Left = 301
               Bottom = 280
               Right = 523
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "tblLibrarian"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblSupplier"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCategory"
            Begin Extent = 
               Top = 63
               Left = 1187
               Bottom = 233
               Right = 1409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_importDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_importDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_importDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[41] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblLibrarian"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblUser"
            Begin Extent = 
               Top = 61
               Left = 545
               Bottom = 258
               Right = 767
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_login'
GO
USE [master]
GO
ALTER DATABASE [LMS] SET  READ_WRITE 
GO
