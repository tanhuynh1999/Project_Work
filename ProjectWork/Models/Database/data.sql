USE [master]
GO
/****** Object:  Database [DataWork_project]    Script Date: 11/18/2020 11:43:22 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/18/2020 11:43:22 AM ******/
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
/****** Object:  Table [dbo].[Layout]    Script Date: 11/18/2020 11:43:22 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/18/2020 11:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/18/2020 11:43:22 AM ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (16, N'Dịch vụ khách hàng', NULL, NULL, 4, 1, 0)
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
INSERT [dbo].[Category] ([category_id], [category_name], [category_datecreate], [category_dateupdate], [category_view], [category_active], [category_del]) VALUES (30, N'IT-Phần mềm', NULL, NULL, 66, 1, 0)
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
SET IDENTITY_INSERT [dbo].[Layout] ON 

INSERT [dbo].[Layout] ([layout_id], [ct_1], [ct_2], [ct_3], [ct_4], [ct_5], [ct_6], [ct_7], [ct_8], [ct_9], [ct_10], [ct_11], [ct_12], [ct_13], [ct_14], [ct_15], [ct_16], [ct_17], [ct_18], [ct_19], [ct_20], [ct_21], [ct_22], [ct_23], [ct_24], [ct_25]) VALUES (1, N'Sỡ hữu ngay CV xịn cùng việc làm ước mơ', N'TÌM VIỆC KHÓ - CÓ ALLWORK1S', N'Hoàn thiện hồ sơ xin việc', N'Chuẩn bị hồ sơ xin việc ấn tượng & chuyên nghiệp với Công cụ viết CV số 1 Việt Nam.', N'Chủ động tìm việc', N'Hệ thống gợi ý các công việc phù hợp với CV của bạn, chỉ 1 click để ứng tuyển nhanh chóng.', N'Nhận cơ hội hấp dẫn', N'Nhà tuyển dụng chủ động tìm kiếm bạn qua CV đã tạo trên AllWork1s, nhận ngay nhiều lời mời hấp dẫn.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Layout] OFF
USE [master]
GO
ALTER DATABASE [DataWork_project] SET  READ_WRITE 
GO
