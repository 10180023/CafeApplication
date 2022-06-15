USE [master]
GO
/****** Object:  Database [Cafe]    Script Date: 15.06.2022 13:02:34 ******/
CREATE DATABASE [Cafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cafe', FILENAME = N'D:\Programms\SQL Server Express\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cafe_log', FILENAME = N'D:\Programms\SQL Server Express\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cafe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cafe] SET  MULTI_USER 
GO
ALTER DATABASE [Cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cafe] SET QUERY_STORE = OFF
GO
USE [Cafe]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[ComboID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Combo] PRIMARY KEY CLUSTERED 
(
	[ComboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboProduct]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComboProduct](
	[ComboID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Count] [int] NULL,
	[ComboProductID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ComboProduct] PRIMARY KEY CLUSTERED 
(
	[ComboProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[Sale] [decimal](18, 0) NOT NULL,
	[PromoCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStaff]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStaff](
	[FoodStuffID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CountInStock] [decimal](18, 2) NOT NULL,
	[MinCount] [decimal](18, 2) NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_FoodStaff] PRIMARY KEY CLUSTERED 
(
	[FoodStuffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[OrderDateTime] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[CouponID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCombo]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCombo](
	[OrderID] [int] NOT NULL,
	[ComboID] [int] NOT NULL,
	[Count] [int] NULL,
	[OrderComboID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderCombo] PRIMARY KEY CLUSTERED 
(
	[OrderComboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Count] [int] NULL,
	[OrderProductID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[ProductTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFoodStuff]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFoodStuff](
	[ProductID] [int] NOT NULL,
	[FoodStaffID] [int] NOT NULL,
	[Count] [int] NULL,
	[ProductFoodStaffID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProductFoodStuff] PRIMARY KEY CLUSTERED 
(
	[ProductFoodStaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffRole]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StaffRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.06.2022 13:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nchar](11) NULL,
	[UserCardID] [nvarchar](50) NULL,
	[CardSale] [decimal](18, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (1, N'Пюре с котлетой', CAST(80.00 AS Decimal(18, 2)), NULL, N'../../Images/Combos\combo1.jpeg')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (4, N'Обед №1', CAST(210.00 AS Decimal(18, 2)), N'Комплексный обед', N'../../Images/Combos\combo3.png')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (5, N'Суп и салат', CAST(80.00 AS Decimal(18, 2)), N'ВЫГОДНО', NULL)
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (6, N'Много пюре', CAST(60.00 AS Decimal(18, 2)), N'2 пюре', NULL)
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (8, N'Пюре + салат', CAST(45.00 AS Decimal(18, 2)), N'w', NULL)
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (16, N'w', CAST(12.00 AS Decimal(18, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Combo] OFF
GO
SET IDENTITY_INSERT [dbo].[ComboProduct] ON 

INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1, 1, NULL, 29)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1, 1002, NULL, 30)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (5, 4, NULL, 35)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (5, 1003, NULL, 36)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (8, 1, NULL, 40)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (8, 1003, NULL, 41)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 4, NULL, 42)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 1002, NULL, 43)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 1003, NULL, 44)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 1, NULL, 45)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (6, 1, 3, 61)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (16, 1, 1, 62)
SET IDENTITY_INSERT [dbo].[ComboProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (1, 1, CAST(5 AS Decimal(18, 0)), N'ГАРНИР5')
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodStaff] ON 

INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (1, N'Картошка', CAST(15.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'шт', N'Это же картошка', N'../../Images\FoodStaff/potato.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (2, N'Молоко 2,5%', CAST(16.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'л', N'Молоко 2,5%', N'../../Images/FoodStaff\milk.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (3, N'Морковь', CAST(4.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'кг', NULL, N'../../Images/FoodStaff\carrot.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (1002, N'Фарш свиной', CAST(6.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'кг', NULL, NULL)
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (1003, N'Говядина', CAST(8.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'кг', N'Говядина - высший сорт', N'../../Images/FoodStaff\meet1.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (1004, N'Томаты', CAST(11.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'кг', N'Pomidorka', N'../../Images/FoodStaff\tomato.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [Unit], [Description], [Image]) VALUES (1005, N'Огурцы', CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'кг', N'Kukumberry', N'../../Images/FoodStaff\cucamber.png')
SET IDENTITY_INSERT [dbo].[FoodStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1, 2, CAST(N'2022-05-01T19:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3, 2, CAST(N'2022-04-30T19:04:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1006, 4, CAST(N'2022-05-04T17:42:28.093' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1007, 4, CAST(N'2022-05-11T18:10:30.833' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1008, 2, CAST(N'2022-05-12T16:01:08.793' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1012, 2, CAST(N'2022-05-13T00:48:24.193' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1013, 4, CAST(N'2022-05-13T00:49:50.347' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1014, 2, CAST(N'2022-05-30T00:06:16.400' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (2014, 2, CAST(N'2022-06-04T23:52:22.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3014, 2, CAST(N'2022-06-10T21:54:19.547' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3015, 2, CAST(N'2022-06-10T22:16:24.833' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3016, 2, CAST(N'2022-06-10T22:24:33.123' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3017, 2, CAST(N'2022-06-10T22:28:45.567' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3020, 2, CAST(N'2022-06-14T19:29:50.987' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3021, 2, CAST(N'2022-06-14T19:29:57.437' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3022, 2, CAST(N'2022-06-14T19:31:32.873' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3023, 2, CAST(N'2022-06-14T19:32:40.333' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3024, 2, CAST(N'2022-06-14T19:32:42.123' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3025, 2, CAST(N'2022-06-14T19:32:57.087' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3026, 2, CAST(N'2022-06-14T19:35:04.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3027, 2, CAST(N'2022-06-14T19:35:11.733' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3028, 2, CAST(N'2022-06-14T19:39:40.770' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3029, 2, CAST(N'2022-06-14T19:39:51.043' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3030, 2, CAST(N'2022-06-14T19:39:52.267' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3031, 2, CAST(N'2022-06-14T19:40:08.793' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3032, 2, CAST(N'2022-06-14T19:41:45.310' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3033, 2, CAST(N'2022-06-14T19:54:14.187' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3034, 2, CAST(N'2022-06-14T20:54:57.080' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3035, 2, CAST(N'2022-06-14T21:36:13.867' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3036, 2, CAST(N'2022-06-14T21:37:16.493' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3037, 2, CAST(N'2022-06-14T21:40:06.930' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3038, 2, CAST(N'2022-06-14T21:44:48.510' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3039, 2, CAST(N'2022-06-14T21:46:49.493' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderCombo] ON 

INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3, 1, 1, 38)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1006, 4, 1, 39)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1007, 6, 1, 40)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1008, 8, 1, 41)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1013, 5, 1, 42)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1012, 1, 1, 43)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1014, 8, 1, 44)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (2014, 1, 1, 45)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (1, 4, 3, 46)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3014, 4, 1, 1020)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3014, 5, 1, 1021)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3015, 5, 1, 1022)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3016, 6, 1, 1023)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3017, 8, 1, 1024)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3033, 1, 1, 1025)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3033, 4, 2, 1026)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3038, 1, 2, 1027)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3038, 4, 1, 1028)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3039, 1, 1, 1029)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3039, 5, 1, 1030)
SET IDENTITY_INSERT [dbo].[OrderCombo] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3, 1002, 2, 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (1007, 1002, 1, 27)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (1013, 1003, 3, 33)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (1012, 1002, 1, 36)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (1014, 1, 2, 37)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (2014, 1, 1, 38)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3, 1, 3, 39)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3, 4, 3, 40)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3014, 1, 1, 1038)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3015, 1, 1, 1039)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3016, 1, 1, 1040)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3017, 1, 1, 1041)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3017, 1002, 1, 1042)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3020, 1, 1, 1043)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3020, 4, 1, 1044)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3022, 1, 2, 1045)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3022, 4, 2, 1046)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3023, 1, 2, 1047)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3023, 4, 3, 1048)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3025, 1, 1, 1049)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3025, 4, 1, 1050)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3025, 1002, 1, 1051)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3026, 4, 1, 1052)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3027, 1, 1, 1053)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3027, 4, 1, 1054)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3027, 1002, 3, 1055)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3028, 1, 1, 1056)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3029, 4, 1, 1057)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3029, 1002, 1, 1058)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3031, 1, 1, 1059)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3031, 4, 1, 1060)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3031, 1002, 1, 1061)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3032, 1, 1, 1062)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3032, 4, 1, 1063)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3033, 1, 3, 1064)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3033, 1003, 2, 1065)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3034, 1, 3, 1066)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3034, 4, 2, 1067)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3035, 1, 1, 1068)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3035, 4, 2, 1069)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3036, 1, 10, 1070)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3037, 1, 10, 1071)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3038, 1, 1, 1072)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3038, 4, 2, 1073)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1, N'Пюре', N'Из картофеля с молоком', CAST(38.00 AS Decimal(18, 2)), N'../../Images/Products\smashedpotato.png', 1)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (4, N'Суп с говядиной', NULL, CAST(45.00 AS Decimal(18, 2)), N'../../Images/Products\soup.png', 2)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1002, N'Котлета свиная', N'123', CAST(60.00 AS Decimal(18, 2)), N'../../Images/Products\meet.png', 1005)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1003, N'Салат овощной', NULL, CAST(15.00 AS Decimal(18, 2)), N'../../Images/Products\salat.png', 4)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1006, N'empty', NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 5)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1008, N'Говядина', NULL, CAST(45.00 AS Decimal(18, 2)), N'../../Images/Products\meet.png', 1008)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1009, N'123', N'123', CAST(0.00 AS Decimal(18, 2)), N'../../Images/Products\soup.png', 5)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1010, N'вцф', N'цвфвф', CAST(12.00 AS Decimal(18, 2)), N'../../Images/Products\smashedpotato.png', 1009)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1011, N'w', NULL, CAST(0.00 AS Decimal(18, 2)), N'../../Images/Products\meet.png', 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductFoodStuff] ON 

INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (4, 1, 1, 2144)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (4, 3, 1, 2145)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (4, 1003, 1, 2146)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (4, 1004, 1, 2147)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1003, 3, 1, 2150)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1003, 1004, 1, 2151)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1003, 1005, 1, 2152)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1002, 1002, 1, 2153)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1, 1, 1, 2160)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1, 2, 1, 2161)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1008, 1003, 1, 2162)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1009, 1, 3, 2168)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1009, 2, 5, 2169)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1006, 1, 150, 2170)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1006, 2, 100, 2171)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1010, 1, 1, 2174)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1010, 3, 1, 2175)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1010, 1002, 1, 2176)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1011, 1, 1, 2177)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1011, 2, 1, 2178)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1011, 2, 1, 2179)
SET IDENTITY_INSERT [dbo].[ProductFoodStuff] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1, N'Гарнир')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (2, N'Первое')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (3, N'Основное')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (4, N'Салат')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (5, N'TEST')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1005, N'Котлета')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1008, N'мясо')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1009, N'g')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (1, N'adm', N'йцукен1234', 1, N'Василий', N'Носов', N'Андреевич', N'ADMIN@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (2, N'cash', N'qwerty123', 2, N'Александр', N'Андреев', N'Викторович', N'CASH@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (3, N'adm2', N'qwe', 1, N'Олег', N'Васин', N'Петрович', N'43213132@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (4, N'erch', N'123', 2, N'Павел', N'Ерчук', N'Алексеевич', N'erchpavel@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (8, N'egorSer', N'cRgH123', 2, N'Сергей', N'Егоров', N'Степанович', N'sergey.egorov@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (9, N'1', N'321', 1, N'1', N'1', N'1', N'1', NULL)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[StaffRole] ON 

INSERT [dbo].[StaffRole] ([RoleID], [Title]) VALUES (1, N'Менеджер')
INSERT [dbo].[StaffRole] ([RoleID], [Title]) VALUES (2, N'Кассир')
SET IDENTITY_INSERT [dbo].[StaffRole] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User]    Script Date: 15.06.2022 13:02:35 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[UserCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComboProduct] ADD  CONSTRAINT [DF_ComboProduct_Count]  DEFAULT ((1)) FOR [Count]
GO
ALTER TABLE [dbo].[OrderCombo] ADD  CONSTRAINT [DF_OrderCombo_Count]  DEFAULT ((1)) FOR [Count]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  CONSTRAINT [DF_OrderProduct_Count]  DEFAULT ((1)) FOR [Count]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Image]  DEFAULT (NULL) FOR [Image]
GO
ALTER TABLE [dbo].[ProductFoodStuff] ADD  CONSTRAINT [DF_ProductFoodStuff_Count]  DEFAULT ((1)) FOR [Count]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_Image]  DEFAULT (NULL) FOR [Image]
GO
ALTER TABLE [dbo].[ComboProduct]  WITH CHECK ADD  CONSTRAINT [FK_ComboProduct_Combo] FOREIGN KEY([ComboID])
REFERENCES [dbo].[Combo] ([ComboID])
GO
ALTER TABLE [dbo].[ComboProduct] CHECK CONSTRAINT [FK_ComboProduct_Combo]
GO
ALTER TABLE [dbo].[ComboProduct]  WITH CHECK ADD  CONSTRAINT [FK_ComboProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ComboProduct] CHECK CONSTRAINT [FK_ComboProduct_Product]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_Coupon_ProductType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Coupon] FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Coupon]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staff]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderCombo]  WITH CHECK ADD  CONSTRAINT [FK_OrderCombo_Combo] FOREIGN KEY([ComboID])
REFERENCES [dbo].[Combo] ([ComboID])
GO
ALTER TABLE [dbo].[OrderCombo] CHECK CONSTRAINT [FK_OrderCombo_Combo]
GO
ALTER TABLE [dbo].[OrderCombo]  WITH CHECK ADD  CONSTRAINT [FK_OrderCombo_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderCombo] CHECK CONSTRAINT [FK_OrderCombo_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductFoodStuff]  WITH CHECK ADD  CONSTRAINT [FK_ProductFoodStuff_FoodStaff] FOREIGN KEY([FoodStaffID])
REFERENCES [dbo].[FoodStaff] ([FoodStuffID])
GO
ALTER TABLE [dbo].[ProductFoodStuff] CHECK CONSTRAINT [FK_ProductFoodStuff_FoodStaff]
GO
ALTER TABLE [dbo].[ProductFoodStuff]  WITH CHECK ADD  CONSTRAINT [FK_ProductFoodStuff_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductFoodStuff] CHECK CONSTRAINT [FK_ProductFoodStuff_Product]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_StaffRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[StaffRole] ([RoleID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_StaffRole]
GO
USE [master]
GO
ALTER DATABASE [Cafe] SET  READ_WRITE 
GO
