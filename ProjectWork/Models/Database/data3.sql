USE [master]
GO
/****** Object:  Database [DataWork_project]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Cv]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
	[cv_bird] [datetime] NULL,
	[cv_sex] [int] NULL,
	[cv_phone] [varchar](50) NULL,
	[cv_email] [nvarchar](200) NULL,
	[cv_address] [nvarchar](200) NULL,
	[cv_linkfc] [nvarchar](300) NULL,
	[cv_target] [nvarchar](max) NULL,
	[cv_datebegineducation] [datetime] NULL,
	[cv_dateendeducation] [datetime] NULL,
	[cv_contenteducation] [nvarchar](max) NULL,
	[cv_datebeginexp] [datetime] NULL,
	[cv_dateendexp] [datetime] NULL,
	[cv_contentexp] [nvarchar](max) NULL,
	[cv_datebeginexptwo] [date] NULL,
	[cv_dateendexptwo] [date] NULL,
	[cv_contentexptwo] [nvarchar](max) NULL,
	[cv_datebeginactivate] [datetime] NULL,
	[cv_dateendactivate] [datetime] NULL,
	[cv_contentactivate] [nvarchar](max) NULL,
	[cv_contentcertificate] [nvarchar](max) NULL,
	[cv_contentreward] [nvarchar](max) NULL,
	[cv_english] [nvarchar](max) NULL,
	[cv_IT] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[cv_numbertheme] [int] NULL,
	[cv_yearre] [nvarchar](50) NULL,
	[cv_yearcerti] [nvarchar](50) NULL,
	[cv_schools] [nvarchar](200) NULL,
	[cv_industrystory] [nvarchar](200) NULL,
	[cv_species] [int] NULL,
	[cv_point] [varchar](100) NULL,
	[cv_roleexp] [nvarchar](100) NULL,
	[cv_roleexptwo] [nvarchar](100) NULL,
	[cv_activate] [bit] NULL,
	[cv_option] [bit] NULL,
	[cv_datecreated] [datetime] NULL,
	[career_id] [int] NULL,
	[cv_schoolname] [nvarchar](100) NULL,
	[cv_companyname] [nvarchar](100) NULL,
	[cv_companynametwo] [nvarchar](100) NULL,
	[cv_images] [nvarchar](2000) NULL,
	[cv_theme] [int] NULL,
	[cv_dateupdate] [datetime] NULL,
 CONSTRAINT [PK_Cv] PRIMARY KEY CLUSTERED 
(
	[cv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
	[employer_fullname] [varchar](100) NULL,
	[employer_company] [nvarchar](150) NULL,
	[employer_position] [int] NULL,
	[employer_address] [nvarchar](300) NULL,
	[employer_phone] [varchar](15) NULL,
	[employer_token] [nvarchar](max) NULL,
	[employer_datelogin] [datetime] NULL,
	[employer_datecreated] [datetime] NULL,
	[employer_active] [bit] NULL,
	[employer_status] [bit] NULL,
	[employer_logo] [nvarchar](max) NULL,
	[employer_specialized] [nvarchar](200) NULL,
	[employer_version] [int] NULL,
	[employer_option] [bit] NULL,
	[employer_personalpage] [bit] NULL,
	[employer_name] [nvarchar](200) NULL,
	[employer_introduce] [nvarchar](max) NULL,
	[employer_linkfc] [nvarchar](300) NULL,
	[employer_recruitment] [nvarchar](500) NULL,
	[employer_addressmain] [nvarchar](200) NULL,
	[employer_ifamemapmain] [nvarchar](max) NULL,
	[employer_addresstwo] [nvarchar](200) NULL,
	[employer_ifamemaptwo] [nvarchar](max) NULL,
	[employer_addressthree] [nvarchar](200) NULL,
	[employer_ifamemapthree] [nvarchar](max) NULL,
	[employer_province] [nvarchar](200) NULL,
	[employer_recrequirement] [nvarchar](2000) NULL,
	[employer_limit] [int] NULL,
	[employer_emailcompany] [varchar](100) NULL,
	[employer_banner] [nvarchar](1000) NULL,
	[employer_scale] [int] NULL,
	[employer_bonus] [nvarchar](300) NULL,
	[employer_foundedyear] [int] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[employer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpYear]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Favourite]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Form]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Layout]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Reply]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Search]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Sex]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[SubmitCV]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[Work]    Script Date: 23-Nov-20 10:48:19 PM ******/
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
/****** Object:  Table [dbo].[WorkCategory]    Script Date: 23-Nov-20 10:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCategory](
	[workcat_id] [int] IDENTITY(1,1) NOT NULL,
	[work_id] [int] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_WorkCategory] PRIMARY KEY CLUSTERED 
(
	[workcat_id] ASC
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
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (30, N'IT-Phần mềm', NULL, NULL, 116, 1, 0)
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
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (1, N'hahaha', 1, CAST(0x0000AC7B00000000 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (2, N'hahaha', 1, CAST(0x0000AC7B00000000 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (3, N'hahaha', 1, CAST(0x0000AC7B00000000 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (4, N'hahaha', 1, CAST(0x0000AC7B00000000 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (5, N'hahaha', 1, CAST(0x0000AC7B00000000 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (6, N'hahaha', 1, CAST(0x0000AC7B00000000 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (10, N'cc', 1, CAST(0x0000AC7B0176FDF5 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (11, N'cc1', 1, CAST(0x0000AC7B01776368 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (12, N'cc2', 1, CAST(0x0000AC7B0177C364 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (13, N'cc2', 1, CAST(0x0000AC7B0177DEA1 AS DateTime), 2)
INSERT [dbo].[Comment] ([comment_id], [comment_contents], [user_id], [comment_datepost], [employer_id]) VALUES (14, N'cc', 1, CAST(0x0000AC7C012A8065 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Cv] ON 

INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_bird], [cv_sex], [cv_phone], [cv_email], [cv_address], [cv_linkfc], [cv_target], [cv_datebegineducation], [cv_dateendeducation], [cv_contenteducation], [cv_datebeginexp], [cv_dateendexp], [cv_contentexp], [cv_datebeginexptwo], [cv_dateendexptwo], [cv_contentexptwo], [cv_datebeginactivate], [cv_dateendactivate], [cv_contentactivate], [cv_contentcertificate], [cv_contentreward], [cv_english], [cv_IT], [user_id], [cv_numbertheme], [cv_yearre], [cv_yearcerti], [cv_schools], [cv_industrystory], [cv_species], [cv_point], [cv_roleexp], [cv_roleexptwo], [cv_activate], [cv_option], [cv_datecreated], [career_id], [cv_schoolname], [cv_companyname], [cv_companynametwo], [cv_images], [cv_theme], [cv_dateupdate]) VALUES (1, N'ha tan thanh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000AC7C00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000AC7C00000000 AS DateTime))
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_bird], [cv_sex], [cv_phone], [cv_email], [cv_address], [cv_linkfc], [cv_target], [cv_datebegineducation], [cv_dateendeducation], [cv_contenteducation], [cv_datebeginexp], [cv_dateendexp], [cv_contentexp], [cv_datebeginexptwo], [cv_dateendexptwo], [cv_contentexptwo], [cv_datebeginactivate], [cv_dateendactivate], [cv_contentactivate], [cv_contentcertificate], [cv_contentreward], [cv_english], [cv_IT], [user_id], [cv_numbertheme], [cv_yearre], [cv_yearcerti], [cv_schools], [cv_industrystory], [cv_species], [cv_point], [cv_roleexp], [cv_roleexptwo], [cv_activate], [cv_option], [cv_datecreated], [career_id], [cv_schoolname], [cv_companyname], [cv_companynametwo], [cv_images], [cv_theme], [cv_dateupdate]) VALUES (2, N'ha tan thanh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000AC7C00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, 2, CAST(0x0000AC7C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Cv] OFF
SET IDENTITY_INSERT [dbo].[Employer] ON 

INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_token], [employer_datelogin], [employer_datecreated], [employer_active], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_recrequirement], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (2, N'lg@gmail.com', N'123', NULL, N'LG Development Center Vietnam', 1, NULL, N'0924404019', NULL, NULL, CAST(0x0000AC340101CE97 AS DateTime), 1, NULL, N'lg-development-center-vietnam-logo.png', NULL, 3, 1, 1, N'LG', N'<p>With the advent of the Smart Car era, LG hopes to become an innovative partner in vehicle electrification through development of advanced technology components. Vehicle Component Solutions Company (VS) is developing a wide variety of highly competitive products. Our products include In Vehicle Infotainment system such as Telematics, AV Navigation, Display Audio, Integrated Display System, and Advanced Driver Assistant System (ADAS) called ‘intelligent safe’, and other convenient devices. Our company is also focusing on vehicle engineering, to include Powertrain, electronic vehicle Battery Packs, etc. and is providing them to major customers in the world-wide vehicle industry.<br><br>We offer an environment that enables colleagues to demonstrate their capabilities, focus on their work and create value.&nbsp;</p>', NULL, N'Back end,...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, NULL, N'Giao-duc-Han-Quoc.jpg', NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_token], [employer_datelogin], [employer_datecreated], [employer_active], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_recrequirement], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_token], [employer_datelogin], [employer_datecreated], [employer_active], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_recrequirement], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (4, N'huynhminhtan4019@gmail.com', N'Tanthao11@', N'tan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_token], [employer_datelogin], [employer_datecreated], [employer_active], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_recrequirement], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (5, N'tanthanh141214@gmail.com', N'Thanh1412@', N'tanthanh141214@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[Reply] ON 

INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (1, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (2, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (3, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (4, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (5, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (6, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
INSERT [dbo].[Reply] ([rep_id], [rep_contents], [comment_id], [user_id], [rep_datepost]) VALUES (7, N'hahahah', 5, 1, CAST(0x0000AC7B00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Reply] OFF
SET IDENTITY_INSERT [dbo].[Search] ON 

INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (1, N'An toàn lao động', 6, CAST(0x0000AC7A016DCCF5 AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (2, N'An Giang', 6, CAST(0x0000AC7A016DCCFD AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (3, N'Dược sĩ', 1, CAST(0x0000AC7A01657E89 AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (4, N'Gia Lai', 1, CAST(0x0000AC7A01657E8D AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (5, N'it', 1, CAST(0x0000AC7A016835DB AS DateTime))
INSERT [dbo].[Search] ([search_id], [search_key], [search_count], [search_date]) VALUES (8, N'IT-Phần mềm', 21, CAST(0x0000AC7B017B4B12 AS DateTime))
SET IDENTITY_INSERT [dbo].[Search] OFF
SET IDENTITY_INSERT [dbo].[Sex] ON 

INSERT [dbo].[Sex] ([sex_id], [sex_name]) VALUES (1, N'Không yêu cầu giới tính')
INSERT [dbo].[Sex] ([sex_id], [sex_name]) VALUES (2, N'Nam')
INSERT [dbo].[Sex] ([sex_id], [sex_name]) VALUES (3, N'Nữ')
SET IDENTITY_INSERT [dbo].[Sex] OFF
SET IDENTITY_INSERT [dbo].[SubmitCV] ON 

INSERT [dbo].[SubmitCV] ([submitcv_id], [work_id], [submitcv_datesubmit], [cv_id]) VALUES (4, 1, CAST(0x0000AC7C01777CB7 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SubmitCV] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_name], [user_active], [user_del], [user_datecreate], [user_datelogin], [user_img], [user_sex], [user_interests]) VALUES (1, N'huynhminhtan4019@gmail.com', N'Tanthao11@', N'Tấn Huỳnh', 1, 0, CAST(0x0000AC770116F82E AS DateTime), CAST(0x0000AC770116F82E AS DateTime), N'user-male--v1.png', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_email], [user_pass], [user_name], [user_active], [user_del], [user_datecreate], [user_datelogin], [user_img], [user_sex], [user_interests]) VALUES (2, N'laptring@gmail.com', N'0924404019Aa@1111', N'Tấn', 1, 0, CAST(0x0000AC7800BDDC40 AS DateTime), CAST(0x0000AC7800BDDC40 AS DateTime), N'user-male--v1.png', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Work] ON 

INSERT [dbo].[Work] ([work_id], [work_name], [work_img], [work_deadline], [work_createdate], [work_description], [work_request], [work_benefit], [work_address], [work_money], [work_amount], [work_active], [work_option], [work_view], [work_del], [work_status], [work_dateupdate], [employer_id], [position_id], [sex_id], [province_id], [expyear_id], [form_id]) VALUES (1, N'IT BUSINESS ANALYST / PRODUCT OWNER ( LƯƠNG UPTO 25TR)', NULL, CAST(0x0000AC340101CE97 AS DateTime), CAST(0x0000AC340101CE97 AS DateTime), N'- Nghiên cứu, đánh giá các xu hướng hình thức quảng cáo hiển thị và quảng cáo theo nội dung; Xu hướng hành vi người dùng online trên 24h.com.vn và Việt Nam; Xu hướng thị trường quảng cáo trong nước và thế giới.

- Đề xuất các hình thức quảng cáo mới cho trang 24h.com.vn

- Theo dõi đánh giá, cải tiến sản phẩm hiện có để để tăng hiệu quả quảng cáo (CTR, Viewable...).

- Tối ưu doanh thu quảng cáo theo vị trí/sản phẩm.

- Phối hợp cùng các bộ phận (quản lý tài nguyên, trung tâm công nghệ, thiết kế...) để xây dựng, triển khai các sản phẩm quảng cáo mới và xử lý các vấn đề phát sinh liên quan đến hiệu quả QC trên site 24h', N'- Kinh nghiệm trong các vị trí Product Owner, Business Analyst hoặc UX Designer 

- Ưu tiên có nền tảng về tech và am hiểu về các kênh truyền thông như Google, Facebook, Zalo, Admicro, VnExpress, 24h, ...

- Thành thạo 1 công cụ để dựng wireframe (vd: Axure).

- Khả năng làm việc nhóm tốt, theo sát tiến độ và đốc thúc các bộ phận liên quan theo tiến độ.

- Có khả năng thuyết trình thuyết phục.

- Tư duy logic, phân tích số liệu, giải quyết vấn đề tốt.

- Yêu thích và đam mê phát triển sự nghiệp trong lĩnh vực quảng cáo trực tuyến.', N'- Thưởng Tết. Xét tăng lương hàng năm theo năng lực và hiệu quả công việc (1 lần/ năm).

- Được hưởng đầy đủ các chế độ đãi ngộ đối với người lao động theo Luật Lao động Việt Nam, bảo hiểm xã hội theo quy định nhà nước.

- Du lịch 1 - 2 lần mỗi năm tại các khách sạn, resort 5 sao. 

- Khám sức khoẻ định kỳ hàng năm ở các bệnh viện lớn như Vinmec, Thu Cúc, Hồng Ngọc. 

- Môi trường trẻ, năng động, kích thích sự sáng tạo và phát triển bản thân.  

- Nghỉ thứ 7, CN. 

- Văn phòng hạng A, cơ sở vật chất rất tốt. 

- Bảo hiểm xã hội theo quy định Nhà nước.', N'Tại Hà Nội: Tầng 12, Tòa nhà Geleximco, 36 Hoàng Cầu, Phường Ô Chợ Dừa, Quận Đống Đa, TP Hà Nội', N' 18-25 triệu', 1, 1, 1, 1, 0, 1, NULL, 2, 1, 1, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Work] OFF
SET IDENTITY_INSERT [dbo].[WorkCategory] ON 

INSERT [dbo].[WorkCategory] ([workcat_id], [work_id], [category_id]) VALUES (1, 1, 30)
SET IDENTITY_INSERT [dbo].[WorkCategory] OFF
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
ALTER TABLE [dbo].[SubmitCV]  WITH CHECK ADD  CONSTRAINT [FK_SubmitCV_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[SubmitCV] CHECK CONSTRAINT [FK_SubmitCV_Work]
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
ALTER TABLE [dbo].[WorkCategory]  WITH CHECK ADD  CONSTRAINT [FK_WorkCategory_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[WorkCategory] CHECK CONSTRAINT [FK_WorkCategory_Work]
GO
USE [master]
GO
ALTER DATABASE [DataWork_project] SET  READ_WRITE 
GO
