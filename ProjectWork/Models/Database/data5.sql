USE [master]
GO
/****** Object:  Database [DataWork_project]    Script Date: 02-Dec-20 10:23:43 PM ******/
CREATE DATABASE [DataWork_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataWork_project', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DataWork_project.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DataWork_project_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DataWork_project_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DataWork_project] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataWork_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataWork_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataWork_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataWork_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataWork_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataWork_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataWork_project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataWork_project] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DataWork_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataWork_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataWork_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataWork_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataWork_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataWork_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataWork_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataWork_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataWork_project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataWork_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataWork_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataWork_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataWork_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataWork_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataWork_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataWork_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataWork_project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataWork_project] SET  MULTI_USER 
GO
ALTER DATABASE [DataWork_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataWork_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataWork_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataWork_project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DataWork_project]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NULL,
	[category_datecreate] [datetime] NULL,
	[category_dateupdate] [datetime] NULL,
	[category_view] [int] NULL,
	[category_active] [bit] NULL,
	[category_del] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_contents] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[comment_datepost] [datetime] NULL,
	[employer_id] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cv]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cv](
	[cv_id] [int] IDENTITY(1,1) NOT NULL,
	[cv_fullname] [nvarchar](200) NULL,
	[cv_location] [nvarchar](200) NULL,
	[cv_birth] [date] NULL,
	[cv_phone] [varchar](15) NULL,
	[cv_email] [varchar](100) NULL,
	[cv_addpress] [nvarchar](200) NULL,
	[cv_website] [varchar](max) NULL,
	[cv_target] [nvarchar](300) NULL,
	[cv_interests] [nvarchar](500) NULL,
	[cv_information] [nvarchar](500) NULL,
	[cv_title] [nvarchar](200) NULL,
	[cv_img] [nvarchar](max) NULL,
	[theme_id] [int] NULL,
	[sex_id] [int] NULL,
	[user_id] [int] NULL,
	[cv_font] [nvarchar](200) NULL,
	[cv_size] [int] NULL,
	[cv_line] [int] NULL,
	[cv_education] [nvarchar](max) NULL,
	[cv_graduation] [nvarchar](max) NULL,
	[cv_jobexperience] [nvarchar](max) NULL,
	[cv_datejobexperience] [nvarchar](max) NULL,
	[cv_outdooractivities] [nvarchar](max) NULL,
	[cv_dateoutdooractivities] [nvarchar](max) NULL,
	[cv_certificate] [nvarchar](max) NULL,
	[cv_datecertificate] [nvarchar](max) NULL,
	[cv_prize] [nvarchar](max) NULL,
	[cv_dateprize] [nvarchar](max) NULL,
	[cv_skill] [nvarchar](max) NULL,
	[cv_dateskill] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cv] PRIMARY KEY CLUSTERED 
(
	[cv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employer](
	[employer_id] [int] IDENTITY(1,1) NOT NULL,
	[employer_email] [varchar](100) NULL,
	[employer_pass] [varchar](200) NULL,
	[employer_company] [nvarchar](300) NULL,
	[employer_introduct] [nvarchar](max) NULL,
	[employer_yeartoset] [date] NULL,
	[employer_scale] [int] NULL,
	[employer_yotube] [nvarchar](max) NULL,
	[employer_product] [nvarchar](max) NULL,
	[employer_develop] [nvarchar](max) NULL,
	[employer_salary] [nvarchar](max) NULL,
	[employer_promotion] [nvarchar](max) NULL,
	[employer_datecreate] [datetime] NULL,
	[employer_datelogin] [datetime] NULL,
	[employer_dateupdate] [datetime] NULL,
	[employer_logo] [nvarchar](max) NULL,
	[employer_address] [nvarchar](max) NULL,
	[employer_fullname] [nvarchar](200) NULL,
	[employer_pageload] [bit] NULL,
	[employer_active] [bit] NULL,
	[employer_option] [bit] NULL,
	[employer_banner] [nvarchar](max) NULL,
	[employer_fc] [nvarchar](max) NULL,
	[employer_website] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[employer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpYear]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpYear](
	[expyear_id] [int] IDENTITY(1,1) NOT NULL,
	[expyear_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_ExpYear] PRIMARY KEY CLUSTERED 
(
	[expyear_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[favourite_id] [int] IDENTITY(1,1) NOT NULL,
	[favourite_datecreate] [datetime] NULL,
	[work_id] [int] NULL,
	[user_id] [int] NULL,
	[favourite_delete] [bit] NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[favourite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Form]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[form_id] [int] IDENTITY(1,1) NOT NULL,
	[form_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Layout]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layout](
	[layout_id] [int] IDENTITY(1,1) NOT NULL,
	[ct_1] [nvarchar](max) NULL,
	[ct_2] [nvarchar](max) NULL,
	[ct_3] [nvarchar](max) NULL,
	[ct_4] [nvarchar](max) NULL,
	[ct_5] [nvarchar](max) NULL,
	[ct_6] [nvarchar](max) NULL,
	[ct_7] [nvarchar](max) NULL,
	[ct_8] [nvarchar](max) NULL,
	[ct_9] [nvarchar](max) NULL,
	[ct_10] [nvarchar](max) NULL,
	[ct_11] [nvarchar](max) NULL,
	[ct_12] [nvarchar](max) NULL,
	[ct_13] [nvarchar](max) NULL,
	[ct_14] [nvarchar](max) NULL,
	[ct_15] [nvarchar](max) NULL,
	[ct_16] [nvarchar](max) NULL,
	[ct_17] [nvarchar](max) NULL,
	[ct_18] [nvarchar](max) NULL,
	[ct_19] [nvarchar](max) NULL,
	[ct_20] [nvarchar](max) NULL,
	[ct_21] [nvarchar](max) NULL,
	[ct_22] [nvarchar](max) NULL,
	[ct_23] [nvarchar](max) NULL,
	[ct_24] [nvarchar](max) NULL,
	[ct_25] [nvarchar](max) NULL,
 CONSTRAINT [PK_Layout] PRIMARY KEY CLUSTERED 
(
	[layout_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[position_id] [int] IDENTITY(1,1) NOT NULL,
	[position_name] [nvarchar](max) NULL,
	[position_datacreate] [datetime] NULL,
	[position_dateupdate] [datetime] NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[province_id] [int] IDENTITY(1,1) NOT NULL,
	[province_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reply]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[rep_id] [int] IDENTITY(1,1) NOT NULL,
	[rep_contents] [nvarchar](max) NULL,
	[comment_id] [int] NULL,
	[user_id] [int] NULL,
	[rep_datepost] [datetime] NULL,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[rep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Search]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Search](
	[search_id] [int] IDENTITY(1,1) NOT NULL,
	[search_key] [nvarchar](255) NULL,
	[search_count] [int] NULL,
	[search_date] [datetime] NULL,
 CONSTRAINT [PK_Search] PRIMARY KEY CLUSTERED 
(
	[search_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sex]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sex](
	[sex_id] [int] IDENTITY(1,1) NOT NULL,
	[sex_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sex] PRIMARY KEY CLUSTERED 
(
	[sex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubmitCV]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitCV](
	[submitcv_id] [int] IDENTITY(1,1) NOT NULL,
	[work_id] [int] NULL,
	[submitcv_datesubmit] [datetime] NULL,
	[cv_id] [int] NULL,
 CONSTRAINT [PK_SubmitCV] PRIMARY KEY CLUSTERED 
(
	[submitcv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Theme]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[theme_id] [int] IDENTITY(1,1) NOT NULL,
	[theme_title] [nvarchar](200) NULL,
	[vtheme] [int] NULL,
	[theme_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[theme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_email] [varchar](200) NULL,
	[user_pass] [nvarchar](max) NULL,
	[user_name] [nvarchar](100) NULL,
	[user_active] [bit] NULL,
	[user_del] [bit] NULL,
	[user_datecreate] [datetime] NULL,
	[user_datelogin] [datetime] NULL,
	[user_img] [nvarchar](max) NULL,
	[user_sex] [bit] NULL,
	[user_interests] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VersionTheme]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionTheme](
	[vtheme] [int] IDENTITY(1,1) NOT NULL,
	[vtheme_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_VersionTheme] PRIMARY KEY CLUSTERED 
(
	[vtheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Work]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work](
	[work_id] [int] IDENTITY(1,1) NOT NULL,
	[work_name] [nvarchar](200) NULL,
	[work_img] [nvarchar](max) NULL,
	[work_deadline] [datetime] NULL,
	[work_createdate] [datetime] NULL,
	[work_description] [nvarchar](max) NULL,
	[work_request] [nvarchar](max) NULL,
	[work_benefit] [nvarchar](max) NULL,
	[work_address] [nvarchar](1000) NULL,
	[work_money] [nvarchar](200) NULL,
	[work_amount] [int] NULL,
	[work_active] [bit] NULL,
	[work_option] [bit] NULL,
	[work_view] [int] NULL,
	[work_del] [bit] NULL,
	[work_status] [bit] NULL,
	[work_dateupdate] [datetime] NULL,
	[employer_id] [int] NULL,
	[position_id] [int] NULL,
	[sex_id] [int] NULL,
	[province_id] [int] NULL,
	[expyear_id] [int] NULL,
	[form_id] [int] NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[work_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkCategory]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCategory](
	[workcat_id] [int] IDENTITY(1,1) NOT NULL,
	[work_id] [int] NULL,
	[category_id] [int] NULL,
	[employer_id] [int] NULL,
 CONSTRAINT [PK_WorkCategory] PRIMARY KEY CLUSTERED 
(
	[workcat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkProvince]    Script Date: 02-Dec-20 10:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkProvince](
	[workprovince_id] [int] IDENTITY(1,1) NOT NULL,
	[province_id] [int] NULL,
	[work_id] [int] NULL,
	[employer_id] [int] NULL,
 CONSTRAINT [PK_WorkProvince] PRIMARY KEY CLUSTERED 
(
	[workprovince_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (1, N'An toàn lao động', NULL, NULL, 2, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (2, N'Bác sỹ', NULL, NULL, 3, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (3, N'Bán hàng kỹ thuật', NULL, NULL, 4, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (4, N'Bán hàng', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (5, N'Bán lẻ/Bán sỉ', NULL, NULL, 2, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (6, N'Bảo hiểm', NULL, NULL, 5, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (7, N'Bảo trì/sửa chữa', NULL, NULL, 6, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (8, N'Bất động sản', NULL, NULL, 3, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (9, N'Biên phiên dịch', NULL, NULL, 2, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (10, N'Cấp quản lý điều hành', NULL, NULL, 3, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (11, N'Chứng khoán', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (12, N'Cơ khí', NULL, NULL, 2, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (13, N'Công nghệ cao', NULL, NULL, 4, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (14, N'Dầu khí', NULL, NULL, 6, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (15, N'Dệt may/Da giày', NULL, NULL, 7, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (16, N'Dịch vụ khách hàng', NULL, NULL, 5, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (17, N'Dược phẩm/Công nghệ sinh học', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (18, N'Dược sĩ', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (19, N'Giáo dục/Đào tạo', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (20, N'Hàng cao cấp', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (21, N'Hàng gia dụng', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (22, N'Hàng hải', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (23, N'Hàng không/Du lịch', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (24, N'Hàng tiêu dùng', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (25, N'Hành chánh/Thư ký', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (26, N'Hóa học/Sinh học', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (27, N'Hoạch đinh/Dự án', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (28, N'In ấn/Xuất bản', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (29, N'Internet/Online Media', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (30, N'IT-Phần mềm', NULL, NULL, 129, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (31, N'IT-Phần cứng/ Mạng', NULL, NULL, 22, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (32, N'Kế toán', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (33, N'Khác', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (34, N'Kho vận', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (35, N'Kiểm toán', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (36, N'Kiến trúc / Thiết kế nội thất', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (37, N'Marketing', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (38, N'Mới tốt nghiệp', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (39, N'Môi trường / Xử lý rác thải', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (40, N'Mỹ thuật / Nghệ thuật / Thiết kế', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (41, N'Ngân hàng', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (42, N'Người nước ngoài / Việt kiều', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (43, N'Nhà hàng/ Khách sạn', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (44, N'Nhân sự', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (45, N'Nông nghiệp / Lâm nghiệp', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (46, N'Overseas jobs', NULL, NULL, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Cv] ON 

INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (11, N'Huỳnh Minh Tấn', N'Backend', CAST(0x02240B00 AS Date), N'0924404019', NULL, N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'asasasas', N'Cv cho công nghệ', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (14, N'Huỳnh Minh Tấn', N'Backend', CAST(0x02240B00 AS Date), N'0924404019', NULL, N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'asasasas', N'Cv cho công nghệ', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (15, N'Huỳnh Minh Tấn', N'Backend', CAST(0x02240B00 AS Date), N'0924404019', NULL, N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'asasasas', N'Cv cho công nghệ', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (16, N'Huỳnh Minh Tấn', N'Backend', CAST(0x02240B00 AS Date), N'0924404019', NULL, N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', N'asasasas', N'Cv cho công nghệ', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (17, N'Nguyễn Văn A', NULL, NULL, NULL, N'fpt@gmail.com', N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', NULL, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, N'', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM11-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM11-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM11-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM11-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM', N'23-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM29-Dec-20 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM10-Dec-20 12:00:00 AM01-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM11-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM03-Dec-20 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM01-Jan-01 12:00:00 AM')
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (18, N'Nguyễn Văn A', NULL, NULL, NULL, N'fpt@gmail.com', N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', NULL, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, N';;;', N'15-Dec-20 12:00:00 AM;15-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N';;;;', N'11-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N';;;', N'04-Dec-20 12:00:00 AM;18-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N';;;;', N'25-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N';;;;', N'19-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N';;;;', N'01-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;')
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_birth], [cv_phone], [cv_email], [cv_addpress], [cv_website], [cv_target], [cv_interests], [cv_information], [cv_title], [cv_img], [theme_id], [sex_id], [user_id], [cv_font], [cv_size], [cv_line], [cv_education], [cv_graduation], [cv_jobexperience], [cv_datejobexperience], [cv_outdooractivities], [cv_dateoutdooractivities], [cv_certificate], [cv_datecertificate], [cv_prize], [cv_dateprize], [cv_skill], [cv_dateskill]) VALUES (19, N'Nguyễn Văn A', NULL, NULL, NULL, N'fpt@gmail.com', N'25/5 Hiệp An', N'https://www.facebook.com/profile.php?id=100009358125256', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', N'Đọc sách - Mỗi tháng đọc 1 quyển sách về kinh doanh.
Đá bóng - Tham gia hoạt động đá bóng của công ty hàng tuần', NULL, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, N'DHTDM;DHTDM;', N'04-Dec-20 12:00:00 AM;19-Dec-20 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N'', N'01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N'', N'01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N'', N'01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N'', N'01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;', N'', N'01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;01-Jan-01 12:00:00 AM;')
SET IDENTITY_INSERT [dbo].[Cv] OFF
SET IDENTITY_INSERT [dbo].[Employer] ON 

INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_company], [employer_introduct], [employer_yeartoset], [employer_scale], [employer_yotube], [employer_product], [employer_develop], [employer_salary], [employer_promotion], [employer_datecreate], [employer_datelogin], [employer_dateupdate], [employer_logo], [employer_address], [employer_fullname], [employer_pageload], [employer_active], [employer_option], [employer_banner], [employer_fc], [employer_website]) VALUES (11, N'fpt@gmail.com', N'0924404019a@Aa', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000AC8401850A01 AS DateTime), NULL, NULL, N'fpt-cty', 1, 0, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employer] OFF
SET IDENTITY_INSERT [dbo].[ExpYear] ON 

INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (1, N'Không cần kinh nghiệm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (2, N'1 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (3, N'2 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (4, N'3 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (5, N'4 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (6, N'5 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (7, N'6 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (8, N'7 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (9, N'8 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (10, N'9 năm')
INSERT [dbo].[ExpYear] ([expyear_id], [expyear_name]) VALUES (11, N'Trên 10 năm')
SET IDENTITY_INSERT [dbo].[ExpYear] OFF
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (1, N'Không yêu cầu')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (2, N'Bán thời gian')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (3, N'Toàn thời gian')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (4, N'Thực tập')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (5, N'Làm việc từ xa')
SET IDENTITY_INSERT [dbo].[Form] OFF
SET IDENTITY_INSERT [dbo].[Layout] ON 

INSERT [dbo].[Layout] ([layout_id], [ct_1], [ct_2], [ct_3], [ct_4], [ct_5], [ct_6], [ct_7], [ct_8], [ct_9], [ct_10], [ct_11], [ct_12], [ct_13], [ct_14], [ct_15], [ct_16], [ct_17], [ct_18], [ct_19], [ct_20], [ct_21], [ct_22], [ct_23], [ct_24], [ct_25]) VALUES (1, N'Sỡ hữu ngay CV xịn cùng việc làm ước mơ', N'TÌM VIỆC KHÓ - CÓ ALLWORK1S', N'Hoàn thiện hồ sơ xin việc', N'Chuẩn bị hồ sơ xin việc ấn tượng & chuyên nghiệp với Công cụ viết CV số 1 Việt Nam.', N'Chủ động tìm việc', N'Hệ thống gợi ý các công việc phù hợp với CV của bạn, chỉ 1 click để ứng tuyển nhanh chóng.', N'Nhận cơ hội hấp dẫn', N'Nhà tuyển dụng chủ động tìm kiếm bạn qua CV đã tạo trên AllWork1s, nhận ngay nhiều lời mời hấp dẫn.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Layout] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (1, N'Nhân viên', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (2, N'Kế toán', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (3, N'Marketing', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (4, N'Công nhân', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (5, N'Quản lý', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (6, N'Bảo vệ', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (7, N'Trưởng phòng', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (8, N'Giám đốc', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (9, N'Phó giám đốc', NULL, NULL)
INSERT [dbo].[Position] ([position_id], [position_name], [position_datacreate], [position_dateupdate]) VALUES (10, N'Chủ tịch', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (1, N'An Giang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (2, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (3, N'Bắc Giang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (4, N'Bắc Kạn')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (5, N'Bạc Liêu')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (6, N'Bắc Ninh')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (7, N'Bến Tre')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (8, N'Bình Định')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (9, N'Bình Dương')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (10, N'Bình Phước')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (12, N'Cà Mau')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (13, N'Cần Thơ')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (14, N'Cao Bằng')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (15, N'Đà Nẵng')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (16, N'Đắk Lắk')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (17, N'Đắk Nông')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (18, N'Điện Biên')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (19, N'Đồng Nai')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (20, N'Đồng Tháp')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (21, N'Gia Lai')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (22, N'Hà Giang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (23, N'Hà Nam')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (24, N'Hà Nội')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (25, N'Hà Tĩnh')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (26, N'Hải Dương')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (27, N'Hải Phòng')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (28, N'Hậu Giang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (29, N'Hòa Bình')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (30, N'Hưng Yên')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (31, N'Khánh Hòa')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (32, N'Kiên Giang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (33, N'Kon Tum')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (34, N'Lai Châu')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (35, N'Lâm Đồng')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (36, N'Lạng Sơn')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (37, N'Lào Cai')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (38, N'Long An')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (39, N'Nam Định')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (40, N'Nghệ An')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (41, N'Ninh Bình')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (42, N'Ninh Thuận')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (43, N'Phú Thọ')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (44, N'Phú Yên')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (45, N'Quảng Bình')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (46, N'Quảng Nam')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (47, N'Quảng Ngãi')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (48, N'Quảng Ninh')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (49, N'Quảng Trị')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (50, N'Sóc Trăng')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (51, N'Sơn La')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (52, N'Tây Ninh')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (53, N'Thái Bình')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (54, N'Thái Nguyên')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (55, N'Thanh Hóa')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (56, N'Thừa Thiên Huế')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (57, N'Tiền Giang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (58, N'Thành phố Hồ Chí Minh')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (59, N'Trà Vinh')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (60, N'Tuyên Quang')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (61, N'Vĩnh Long')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (62, N'Vĩnh Phúc')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (63, N'Yên Bái')
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[Search] ON 

INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (1, N'An toàn lao động', 6, CAST(0x0000AC7A016DCCF5 AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (2, N'An Giang', 6, CAST(0x0000AC7A016DCCFD AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (3, N'Dược sĩ', 1, CAST(0x0000AC7A01657E89 AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (4, N'Gia Lai', 1, CAST(0x0000AC7A01657E8D AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (5, N'it', 1, CAST(0x0000AC7A016835DB AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (8, N'IT-Phần mềm', 34, CAST(0x0000AC820155EB89 AS DateTime))
SET IDENTITY_INSERT [dbo].[Search] OFF
SET IDENTITY_INSERT [dbo].[Sex] ON 

INSERT [dbo].[Sex] ([sex_id], [sex_name]) VALUES (1, N'Không')
INSERT [dbo].[Sex] ([sex_id], [sex_name]) VALUES (2, N'Nam')
INSERT [dbo].[Sex] ([sex_id], [sex_name]) VALUES (3, N'Nữ')
SET IDENTITY_INSERT [dbo].[Sex] OFF
SET IDENTITY_INSERT [dbo].[Theme] ON 

INSERT [dbo].[Theme] ([theme_id], [theme_title], [vtheme], [theme_img]) VALUES (1, N'Mẫu CV tiêu chuẩn', 1, N'mau-cv-default.jpg')
INSERT [dbo].[Theme] ([theme_id], [theme_title], [vtheme], [theme_img]) VALUES (2, N'Mẫu CV Senior', 1, N'mau-cv-senior.jpg')
SET IDENTITY_INSERT [dbo].[Theme] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_name], [user_active], [user_del], [user_datecreate], [user_datelogin], [user_img], [user_sex], [user_interests]) VALUES (1, N'huynhminhtan4019@gmail.com', N'ThanhYeuThaoNhieuLam11@', N'Tấn Huỳnh', 1, 0, CAST(0x0000AC770116F82E AS DateTime), CAST(0x0000AC770116F82E AS DateTime), N'user-male--v1.png', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_name], [user_active], [user_del], [user_datecreate], [user_datelogin], [user_img], [user_sex], [user_interests]) VALUES (2, N'laptring@gmail.com', N'0924404019Aa@1111', N'Tấn', 1, 0, CAST(0x0000AC7800BDDC40 AS DateTime), CAST(0x0000AC7800BDDC40 AS DateTime), N'user-male--v1.png', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_name], [user_active], [user_del], [user_datecreate], [user_datelogin], [user_img], [user_sex], [user_interests]) VALUES (3, N'tanhuynh123@gmail.com', N'0924404019a@Aa', N'Tấn Huỳnh', 1, 0, CAST(0x0000AC8301361EC9 AS DateTime), CAST(0x0000AC8301361EC9 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_name], [user_active], [user_del], [user_datecreate], [user_datelogin], [user_img], [user_sex], [user_interests]) VALUES (4, N'fpt@gmail.com', N'0924404019a@Aa', N'Thanh', 1, 0, CAST(0x0000AC8500F1207E AS DateTime), CAST(0x0000AC8500F1207E AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[VersionTheme] ON 

INSERT [dbo].[VersionTheme] ([vtheme], [vtheme_name]) VALUES (1, N'Miễn phí')
INSERT [dbo].[VersionTheme] ([vtheme], [vtheme_name]) VALUES (2, N'Cao cấp')
INSERT [dbo].[VersionTheme] ([vtheme], [vtheme_name]) VALUES (3, N'Khử nghiệm')
INSERT [dbo].[VersionTheme] ([vtheme], [vtheme_name]) VALUES (4, N'Sắp ra mắt')
SET IDENTITY_INSERT [dbo].[VersionTheme] OFF
SET IDENTITY_INSERT [dbo].[Work] ON 

INSERT [dbo].[Work] ([work_id], [work_name], [work_img], [work_deadline], [work_createdate], [work_description], [work_request], [work_benefit], [work_address], [work_money], [work_amount], [work_active], [work_option], [work_view], [work_del], [work_status], [work_dateupdate], [employer_id], [position_id], [sex_id], [province_id], [expyear_id], [form_id]) VALUES (7, N'dcm co vay cung lam sai', NULL, CAST(0x0000ACA300000000 AS DateTime), CAST(0x0000AC85010D6495 AS DateTime), N'<p>cccccccccccccccccccc</p>', N'<p>cccccccccccccccccccc</p>', N'<p>cccccccccccccccccccc</p>', N'nhà thằng tấn', NULL, 11, 0, NULL, 0, 0, NULL, NULL, 11, NULL, 1, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Work] OFF
SET IDENTITY_INSERT [dbo].[WorkCategory] ON 

INSERT [dbo].[WorkCategory] ([workcat_id], [work_id], [category_id], [employer_id]) VALUES (1, NULL, 1, 11)
INSERT [dbo].[WorkCategory] ([workcat_id], [work_id], [category_id], [employer_id]) VALUES (2, NULL, 2, 11)
INSERT [dbo].[WorkCategory] ([workcat_id], [work_id], [category_id], [employer_id]) VALUES (3, 7, 1, NULL)
SET IDENTITY_INSERT [dbo].[WorkCategory] OFF
SET IDENTITY_INSERT [dbo].[WorkProvince] ON 

INSERT [dbo].[WorkProvince] ([workprovince_id], [province_id], [work_id], [employer_id]) VALUES (1, 1, NULL, 11)
INSERT [dbo].[WorkProvince] ([workprovince_id], [province_id], [work_id], [employer_id]) VALUES (2, 2, NULL, 11)
INSERT [dbo].[WorkProvince] ([workprovince_id], [province_id], [work_id], [employer_id]) VALUES (3, 1, 7, NULL)
INSERT [dbo].[WorkProvince] ([workprovince_id], [province_id], [work_id], [employer_id]) VALUES (4, 2, 7, NULL)
INSERT [dbo].[WorkProvince] ([workprovince_id], [province_id], [work_id], [employer_id]) VALUES (5, 3, 7, NULL)
SET IDENTITY_INSERT [dbo].[WorkProvince] OFF
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Employer] FOREIGN KEY([employer_id])
REFERENCES [dbo].[Employer] ([employer_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Employer]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD  CONSTRAINT [FK_Cv_Sex] FOREIGN KEY([sex_id])
REFERENCES [dbo].[Sex] ([sex_id])
GO
ALTER TABLE [dbo].[Cv] CHECK CONSTRAINT [FK_Cv_Sex]
GO
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD  CONSTRAINT [FK_Cv_Theme] FOREIGN KEY([theme_id])
REFERENCES [dbo].[Theme] ([theme_id])
GO
ALTER TABLE [dbo].[Cv] CHECK CONSTRAINT [FK_Cv_Theme]
GO
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD  CONSTRAINT [FK_Cv_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cv] CHECK CONSTRAINT [FK_Cv_Users]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_User]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_Work]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comment] ([comment_id])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Comment]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Users]
GO
ALTER TABLE [dbo].[SubmitCV]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCV_Cv] FOREIGN KEY([cv_id])
REFERENCES [dbo].[Cv] ([cv_id])
GO
ALTER TABLE [dbo].[SubmitCV] CHECK CONSTRAINT [FK_SubmitCV_Cv]
GO
ALTER TABLE [dbo].[SubmitCV]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCV_Cv1] FOREIGN KEY([cv_id])
REFERENCES [dbo].[Cv] ([cv_id])
GO
ALTER TABLE [dbo].[SubmitCV] CHECK CONSTRAINT [FK_SubmitCV_Cv1]
GO
ALTER TABLE [dbo].[SubmitCV]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCV_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[SubmitCV] CHECK CONSTRAINT [FK_SubmitCV_Work]
GO
ALTER TABLE [dbo].[SubmitCV]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCV_Work1] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[SubmitCV] CHECK CONSTRAINT [FK_SubmitCV_Work1]
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD  CONSTRAINT [FK_Theme_VersionTheme] FOREIGN KEY([vtheme])
REFERENCES [dbo].[VersionTheme] ([vtheme])
GO
ALTER TABLE [dbo].[Theme] CHECK CONSTRAINT [FK_Theme_VersionTheme]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Employer] FOREIGN KEY([employer_id])
REFERENCES [dbo].[Employer] ([employer_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Employer]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_ExpYear] FOREIGN KEY([expyear_id])
REFERENCES [dbo].[ExpYear] ([expyear_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_ExpYear]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Form] FOREIGN KEY([form_id])
REFERENCES [dbo].[Form] ([form_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Form]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Position] FOREIGN KEY([position_id])
REFERENCES [dbo].[Position] ([position_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Position]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Province] FOREIGN KEY([province_id])
REFERENCES [dbo].[Province] ([province_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Province]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Sex] FOREIGN KEY([sex_id])
REFERENCES [dbo].[Sex] ([sex_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Sex]
GO
ALTER TABLE [dbo].[WorkCategory]  WITH CHECK ADD  CONSTRAINT [FK_WorkCategory_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[WorkCategory] CHECK CONSTRAINT [FK_WorkCategory_Category]
GO
ALTER TABLE [dbo].[WorkCategory]  WITH CHECK ADD  CONSTRAINT [FK_WorkCategory_Employer] FOREIGN KEY([employer_id])
REFERENCES [dbo].[Employer] ([employer_id])
GO
ALTER TABLE [dbo].[WorkCategory] CHECK CONSTRAINT [FK_WorkCategory_Employer]
GO
ALTER TABLE [dbo].[WorkCategory]  WITH CHECK ADD  CONSTRAINT [FK_WorkCategory_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[WorkCategory] CHECK CONSTRAINT [FK_WorkCategory_Work]
GO
ALTER TABLE [dbo].[WorkProvince]  WITH CHECK ADD  CONSTRAINT [FK_WorkProvince_Employer] FOREIGN KEY([employer_id])
REFERENCES [dbo].[Employer] ([employer_id])
GO
ALTER TABLE [dbo].[WorkProvince] CHECK CONSTRAINT [FK_WorkProvince_Employer]
GO
ALTER TABLE [dbo].[WorkProvince]  WITH CHECK ADD  CONSTRAINT [FK_WorkProvince_Province] FOREIGN KEY([province_id])
REFERENCES [dbo].[Province] ([province_id])
GO
ALTER TABLE [dbo].[WorkProvince] CHECK CONSTRAINT [FK_WorkProvince_Province]
GO
ALTER TABLE [dbo].[WorkProvince]  WITH CHECK ADD  CONSTRAINT [FK_WorkProvince_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[WorkProvince] CHECK CONSTRAINT [FK_WorkProvince_Work]
GO
USE [master]
GO
ALTER DATABASE [DataWork_project] SET  READ_WRITE 
GO
