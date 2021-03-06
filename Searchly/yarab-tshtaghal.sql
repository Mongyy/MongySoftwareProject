USE [master]
GO
/****** Object:  Database [Searchly]    Script Date: 26-Dec-18 20:52:28 ******/
CREATE DATABASE [Searchly]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Searchly', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Searchly.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Searchly_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Searchly_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Searchly] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Searchly].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Searchly] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Searchly] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Searchly] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Searchly] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Searchly] SET ARITHABORT OFF 
GO
ALTER DATABASE [Searchly] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Searchly] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Searchly] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Searchly] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Searchly] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Searchly] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Searchly] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Searchly] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Searchly] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Searchly] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Searchly] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Searchly] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Searchly] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Searchly] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Searchly] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Searchly] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Searchly] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Searchly] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Searchly] SET  MULTI_USER 
GO
ALTER DATABASE [Searchly] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Searchly] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Searchly] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Searchly] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Searchly] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Searchly] SET QUERY_STORE = OFF
GO
USE [Searchly]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Searchly]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 26-Dec-18 20:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[itemID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[category] [varchar](50) NOT NULL,
	[picture] [varchar](200) NOT NULL,
	[description] [varchar](1000) NOT NULL,
	[date] [varchar](10) NOT NULL,
	[location] [varchar](100) NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 26-Dec-18 20:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizID] [int] NOT NULL,
	[questions] [varchar](1000) NOT NULL,
	[answers] [varchar](1000) NOT NULL,
	[itemID] [int] NOT NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26-Dec-18 20:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[mobileNumber] [varchar](11) NOT NULL,
	[age] [int] NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Item] ([itemID], [name], [category], [picture], [description], [date], [location], [userID]) VALUES (1, N'Wallet', N'Wallets', N'D:\Media\Desktop Backgrounds\Coldplay\513492.jpg', N'waraetrstydyjgukjyfhtdrgsefafesrdtfyguhjhf', N'10/12/2018', N'egwregreytry', 5)
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [email], [mobileNumber], [age], [gender], [password]) VALUES (1, N'Mostafa', N'Hendawi', N'mostafawael7@hotmail.com', N'01128484017', 20, N'M', N'0123456789')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [email], [mobileNumber], [age], [gender], [password]) VALUES (2, N'youssef', N'hendawi', N'ywael', N'01110476877', 14, N'M', N'mostafa')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [email], [mobileNumber], [age], [gender], [password]) VALUES (3, N'abdelrahman', N'melegy', N'boodyemad@hotmail.com', N'00000000000', 20, N'F', N'123')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [email], [mobileNumber], [age], [gender], [password]) VALUES (4, N'hossam', N'Mohamed', N'hoss', N'01128484017', 20, N'M', N'hoss')
INSERT [dbo].[Users] ([userID], [firstName], [lastName], [email], [mobileNumber], [age], [gender], [password]) VALUES (5, N'dfegr', N'wrertt', N'dsfg', N'01111111111', 20, N'M', N'123')
USE [master]
GO
ALTER DATABASE [Searchly] SET  READ_WRITE 
GO
