USE [Cafe]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboProduct]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStaff]    Script Date: 20.06.2022 11:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStaff](
	[FoodStuffID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CountInStock] [decimal](18, 2) NOT NULL,
	[MinCount] [decimal](18, 2) NOT NULL,
	[UnitID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_FoodStaff] PRIMARY KEY CLUSTERED 
(
	[FoodStuffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.06.2022 11:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[OrderDateTime] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[CouponID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCombo]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFoodStuff]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffRole]    Script Date: 20.06.2022 11:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 20.06.2022 11:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.06.2022 11:22:22 ******/
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
	[Phone] [nvarchar](50) NULL,
	[UserCardID] [int] NULL,
	[CardSale] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (1, N'Пюре с котлетой', CAST(63.00 AS Decimal(18, 2)), N'Хороший выбор', N'../../Images/Combos\combo3.png')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (4, N'Обед №1', CAST(210.00 AS Decimal(18, 2)), N'Комплексный обед', N'../../Images/Combos\combo3.png')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (5, N'Суп и салат', CAST(80.00 AS Decimal(18, 2)), N'ВЫГОДНО', N'../../Images/Combos\combo1.jpeg')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (6, N'Много пюре', CAST(66.00 AS Decimal(18, 2)), N'2 пюре', NULL)
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (8, N'Пюре + салат', CAST(61.00 AS Decimal(18, 2)), N'Пюре с овощным салатом', N'../../Images/Combos\combo1.jpeg')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (16, N'Обед №2', CAST(250.00 AS Decimal(18, 2)), NULL, N'../../Images/Combos\combo3.png')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (17, N'Обед сезонный', CAST(330.00 AS Decimal(18, 2)), N'Летний обед', N'../../Images/Combos\combo3.png')
INSERT [dbo].[Combo] ([ComboID], [Title], [Cost], [Description], [Image]) VALUES (1017, N'Сытный обед', CAST(230.00 AS Decimal(18, 2)), NULL, N'../../Images/Combos\combo1.jpeg')
SET IDENTITY_INSERT [dbo].[Combo] OFF
GO
SET IDENTITY_INSERT [dbo].[ComboProduct] ON 

INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (5, 4, NULL, 35)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (5, 1003, NULL, 36)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (8, 1, NULL, 40)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (8, 1003, NULL, 41)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 4, NULL, 42)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1017, 1002, NULL, 43)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1017, 1003, NULL, 44)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1017, 1, NULL, 45)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (16, 1, 1, 62)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (17, 1010, 1, 69)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (17, 4, 1, 70)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1, 1, 1, 1066)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (1, 1002, 1, 1067)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (6, 1, 2, 1073)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (16, 4, 1, 1074)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (16, 1003, 1, 1075)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (16, 4, 1, 1076)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (17, 1009, 2, 1077)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 1002, 1, 1078)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 1003, 1, 1079)
INSERT [dbo].[ComboProduct] ([ComboID], [ProductID], [Count], [ComboProductID]) VALUES (4, 1, 1, 1080)
SET IDENTITY_INSERT [dbo].[ComboProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (1, 1, CAST(5 AS Decimal(18, 0)), N'ГАРНИР5')
INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (2, 1, CAST(3 AS Decimal(18, 0)), N'НАВСЕ3')
INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (3, 4, CAST(10 AS Decimal(18, 0)), N'САЛАТ10')
INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (4, 3, CAST(5 AS Decimal(18, 0)), N'НАВСЕ5')
INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (5, 5, CAST(7 AS Decimal(18, 0)), N'ЛЕТО2022')
INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (6, 1005, CAST(10 AS Decimal(18, 0)), N'СТУДЕНТ10')
INSERT [dbo].[Coupon] ([CouponID], [ProductTypeID], [Sale], [PromoCode]) VALUES (7, 2, CAST(15 AS Decimal(18, 0)), N'ВЫПУСК2022')
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodStaff] ON 

INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1, N'Картошка', CAST(15.30 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 1, N'Это же картошка', N'../../Images\FoodStaff/potato.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (2, N'Молоко 2,5%', CAST(12.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2, N'Молоко 2,5%, пастеризованное', N'../../Images/FoodStaff\milk.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (3, N'Морковь', CAST(4.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1, N'Морковь свежая', N'../../Images/FoodStaff\carrot.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1002, N'Фарш свиной', CAST(6.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1, N'Из свинины', NULL)
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1003, N'Говядина', CAST(8.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1, N'Говядина - высший сорт', N'../../Images/FoodStaff\meet1.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1004, N'Томаты', CAST(5.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'Томаты свежие', N'../../Images/FoodStaff\tomato.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1005, N'Огурцы', CAST(5.70 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'Огурцы короткоплодные', N'../../Images/FoodStaff\cucamber.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1010, N'Яблоки', CAST(2.50 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1, N'Яблоки красные', NULL)
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1011, N'Вода', CAST(32.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 2, N'Вода чистая', N'../../Images/FoodStaff\milk.png')
INSERT [dbo].[FoodStaff] ([FoodStuffID], [Title], [CountInStock], [MinCount], [UnitID], [Description], [Image]) VALUES (1013, N'Масло  подсолнечное', CAST(7.80 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 2, N'Рафинированое', NULL)
SET IDENTITY_INSERT [dbo].[FoodStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1, NULL, CAST(N'2022-05-01T19:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3, 2, CAST(N'2022-04-30T19:04:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1006, 4, CAST(N'2022-05-04T17:42:28.093' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1007, NULL, CAST(N'2022-05-11T18:10:30.833' AS DateTime), 0, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1008, 3, CAST(N'2022-05-12T16:01:08.793' AS DateTime), NULL, 3)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1012, 2, CAST(N'2022-05-13T00:48:24.193' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1013, 4, CAST(N'2022-05-13T00:49:50.347' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (1014, NULL, CAST(N'2022-05-30T00:06:16.400' AS DateTime), 4, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (2014, 3, CAST(N'2022-06-04T23:52:22.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3014, 2, CAST(N'2022-06-10T21:54:19.547' AS DateTime), NULL, 2)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3015, 3, CAST(N'2022-06-10T22:16:24.833' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3016, 2, CAST(N'2022-06-10T22:24:33.123' AS DateTime), NULL, 2)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3017, NULL, CAST(N'2022-06-10T22:28:45.567' AS DateTime), 6, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3020, 2, CAST(N'2022-06-14T19:29:50.987' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3022, 2, CAST(N'2022-06-14T19:31:32.873' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3023, NULL, CAST(N'2022-06-14T19:32:40.333' AS DateTime), 0, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3025, 4, CAST(N'2022-06-14T19:32:57.087' AS DateTime), NULL, 6)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3026, 8, CAST(N'2022-06-14T19:35:04.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3027, 2, CAST(N'2022-06-14T19:35:11.733' AS DateTime), NULL, 7)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3028, 3, CAST(N'2022-06-14T19:39:40.770' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3029, 8, CAST(N'2022-06-14T19:39:51.043' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3031, NULL, CAST(N'2022-06-14T19:40:08.793' AS DateTime), 0, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3032, 3, CAST(N'2022-06-14T19:41:45.310' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3033, 2, CAST(N'2022-06-14T19:54:14.187' AS DateTime), NULL, 5)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3034, 3, CAST(N'2022-06-14T20:54:57.080' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3035, 2, CAST(N'2022-06-14T21:36:13.867' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3036, NULL, CAST(N'2022-06-14T21:37:16.493' AS DateTime), 0, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3037, 8, CAST(N'2022-06-14T21:40:06.930' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3038, 4, CAST(N'2022-06-14T21:44:48.510' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3039, 2, CAST(N'2022-06-14T21:46:49.493' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3041, NULL, CAST(N'2022-06-17T19:02:34.987' AS DateTime), 1, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3042, NULL, CAST(N'2022-06-17T19:07:48.573' AS DateTime), 1, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3043, NULL, CAST(N'2022-06-17T19:08:31.967' AS DateTime), 1, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3046, NULL, CAST(N'2022-06-17T19:14:40.127' AS DateTime), 4, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3047, NULL, CAST(N'2022-06-17T19:25:19.753' AS DateTime), 7, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3048, NULL, CAST(N'2022-06-17T20:10:43.583' AS DateTime), 3, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3049, 2, CAST(N'2022-06-17T20:12:56.480' AS DateTime), NULL, 5)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3050, 8, CAST(N'2022-06-17T20:18:45.960' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3052, 2, CAST(N'2022-06-17T21:35:05.653' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3053, 3, CAST(N'2022-06-17T21:38:57.143' AS DateTime), NULL, 5)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (3056, 4, CAST(N'2022-06-17T21:43:24.220' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4048, NULL, CAST(N'2022-06-18T19:28:07.037' AS DateTime), 2, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4049, NULL, CAST(N'2022-06-18T19:58:41.107' AS DateTime), 1, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4050, 3, CAST(N'2022-06-18T19:59:12.520' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4051, NULL, CAST(N'2022-06-18T20:57:01.487' AS DateTime), 1, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4052, NULL, CAST(N'2022-06-19T15:48:01.843' AS DateTime), 1, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4053, 2, CAST(N'2022-06-19T17:58:21.253' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4054, 3, CAST(N'2022-06-19T18:26:03.003' AS DateTime), NULL, 5)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4055, NULL, CAST(N'2022-06-19T18:27:45.240' AS DateTime), 0, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4056, 4, CAST(N'2022-06-19T18:28:31.663' AS DateTime), NULL, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4057, NULL, CAST(N'2022-06-19T18:37:12.500' AS DateTime), 0, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4058, NULL, CAST(N'2022-06-19T18:41:03.727' AS DateTime), 3, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4059, NULL, CAST(N'2022-06-19T18:43:32.380' AS DateTime), 1, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4060, NULL, CAST(N'2022-06-19T18:54:02.610' AS DateTime), 2, NULL)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4061, NULL, CAST(N'2022-06-19T20:52:51.787' AS DateTime), 7, 1)
INSERT [dbo].[Order] ([OrderID], [StaffID], [OrderDateTime], [UserID], [CouponID]) VALUES (4062, 2, CAST(N'2022-06-20T10:38:17.283' AS DateTime), NULL, 5)
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
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3041, 1, 3, 1031)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3042, 5, 1, 1032)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3042, 5, 1, 1033)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3043, 6, 2, 1034)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3046, 5, 1, 1035)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3047, 4, 1, 1036)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3050, 1, 1, 1037)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (3050, 4, 1, 1038)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4048, 1, 2, 2031)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4048, 6, 4, 2032)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4051, 1, 2, 2036)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4052, 1, 1, 2037)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4052, 4, 1, 2038)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4053, 1, 3, 2039)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4055, 5, 1, 2040)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4055, 8, 1, 2041)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4056, 5, 1, 2042)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4056, 8, 1, 2043)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4058, 1, 1, 2044)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4059, 5, 1, 2045)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4060, 5, 1, 2046)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4060, 6, 1, 2047)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4060, 8, 1, 2048)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4060, 16, 1, 2049)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4060, 4, 1, 2050)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4061, 1, 1, 2051)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4061, 5, 1, 2052)
INSERT [dbo].[OrderCombo] ([OrderID], [ComboID], [Count], [OrderComboID]) VALUES (4062, 17, 1, 2053)
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
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3041, 1, 1, 1074)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3041, 4, 1, 1075)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3041, 1002, 1, 1076)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3046, 1, 1, 1077)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3047, 1, 1, 1078)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3048, 1, 1, 1079)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3049, 1, 1, 1080)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3049, 1006, 1, 1081)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3050, 1, 1, 1082)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3052, 1, 1, 1083)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3053, 1, 1, 1084)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (3056, 1002, 1, 1085)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4048, 1, 2, 2075)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4048, 4, 3, 2076)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4049, 1, 1, 2077)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4049, 4, 1, 2078)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4050, 4, 1, 2079)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4051, 4, 1, 2080)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4052, 1006, 1, 2081)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4052, 1009, 1, 2082)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4052, 1011, 1, 2083)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4053, 1, 1, 2084)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4053, 1002, 2, 2085)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4054, 4, 1, 2086)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4054, 1003, 1, 2087)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4054, 1008, 1, 2088)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4055, 1002, 1, 2089)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4055, 1006, 1, 2090)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4057, 4, 0, 2091)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4059, 4, 1, 2092)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4059, 1002, 1, 2093)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1, 1, 2096)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 4, 1, 2097)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1002, 1, 2098)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1003, 1, 2099)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1006, 1, 2100)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1008, 1, 2101)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1009, 1, 2102)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1010, 1, 2103)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1011, 1, 2104)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4060, 1012, 1, 2105)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4061, 1, 2, 2106)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4061, 1002, 1, 2107)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4062, 1, 2, 2108)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductID], [Count], [OrderProductID]) VALUES (4062, 1003, 1, 2109)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1, N'Пюре', N'Из картофеля с молоком', CAST(55.00 AS Decimal(18, 2)), N'../../Images/Products\smashedpotato.png', 1)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (4, N'Суп с говядиной', NULL, CAST(65.00 AS Decimal(18, 2)), N'../../Images/Products\soup.png', 2)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1002, N'Котлета свиная', N'Из свиного фарша', CAST(60.00 AS Decimal(18, 2)), N'../../Images/Products\meet.png', 3)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1003, N'Салат овощной', N'Из свежих овощей', CAST(35.00 AS Decimal(18, 2)), N'../../Images/Products\salat.png', 4)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1006, N'Сырная нарезка', NULL, CAST(78.00 AS Decimal(18, 2)), NULL, 1009)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1008, N'Говядина', NULL, CAST(45.00 AS Decimal(18, 2)), N'../../Images/Products\meet.png', 3)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1009, N'Булочка с корицей', N'Свежая выпечка', CAST(26.00 AS Decimal(18, 2)), N'../../Images/Products\soup.png', 1005)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1010, N'Морс', N'Из лесных ягод', CAST(12.00 AS Decimal(18, 2)), N'../../Images/Products\smashedpotato.png', 5)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1011, N'Кофе', NULL, CAST(35.00 AS Decimal(18, 2)), N'../../Images/Products\meet.png', 5)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1012, N'Морковь по корейски', N'', CAST(38.00 AS Decimal(18, 2)), NULL, 1009)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1013, N'Овощи свежие', N';', CAST(22.00 AS Decimal(18, 2)), NULL, 1009)
INSERT [dbo].[Product] ([ProductID], [Title], [Description], [Cost], [Image], [ProductTypeID]) VALUES (1014, N'Мороженое', N'Молоко с яблоками', CAST(43.00 AS Decimal(18, 2)), NULL, 1008)
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
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1008, 1003, 1, 2162)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1009, 1, 3, 2168)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1009, 2, 5, 2169)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1006, 1, 150, 2170)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1006, 2, 100, 2171)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1010, 1, 1, 2174)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1010, 3, 1, 2175)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1010, 1002, 1, 2176)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1011, 3, 1, 2180)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1011, 1002, 1, 2181)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1012, 3, 1, 3180)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1, 1, 1, 3186)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1, 2, 1, 3187)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1, 3, 1, 3188)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1013, 1004, 1, 3189)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1013, 1005, 1, 3190)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1014, 2, 1, 3191)
INSERT [dbo].[ProductFoodStuff] ([ProductID], [FoodStaffID], [Count], [ProductFoodStaffID]) VALUES (1014, 1010, 1, 3192)
SET IDENTITY_INSERT [dbo].[ProductFoodStuff] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1, N'Гарнир')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (2, N'Первое')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (3, N'Основное')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (4, N'Салат')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (5, N'Напиток')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1005, N'Выпечка')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1008, N'Десерт')
INSERT [dbo].[ProductType] ([ProductTypeID], [Title]) VALUES (1009, N'Закуска')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (1, N'adm', N'Qwerty!1', 1, N'Василий', N'Неносов', N'Андреевич', N'ADMIN@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (2, N'cash', N'Qwerty!1', 2, N'Александр', N'Андреев', N'Викторович', N'CASH@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (3, N'adm2', N'Qwerty!1', 2, N'Олег', N'Васин', N'Петрович', N'43213132@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (4, N'erch', N'Qwerty!1', 2, N'Павел', N'Ерчук', N'Алексеевич', N'erchpavel@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (8, N'egorSer', N'Qwerty!1', 2, N'Сергей', N'Егоров', N'Степанович', N'sergey.egorov@gmail.com', NULL)
INSERT [dbo].[Staff] ([StaffID], [Login], [Password], [RoleID], [FirstName], [LastName], [Patronymic], [Email], [Image]) VALUES (11, N'da', N'Qwerty!1', 1, N'Сергей', N'Григорьев', N'Валентинович', N'grig@mail.ru', NULL)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[StaffRole] ON 

INSERT [dbo].[StaffRole] ([RoleID], [Title]) VALUES (1, N'Менеджер')
INSERT [dbo].[StaffRole] ([RoleID], [Title]) VALUES (2, N'Кассир')
SET IDENTITY_INSERT [dbo].[StaffRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitID], [Title]) VALUES (1, N'кг')
INSERT [dbo].[Unit] ([UnitID], [Title]) VALUES (2, N'л')
INSERT [dbo].[Unit] ([UnitID], [Title]) VALUES (3, N'шт')
INSERT [dbo].[Unit] ([UnitID], [Title]) VALUES (4, N'г')
INSERT [dbo].[Unit] ([UnitID], [Title]) VALUES (5, N'мл')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (0, N'guest', N'guest', NULL, N'Гость', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (1, N'u1', N'Qwerty1!', N'Дмитрий', N'Федоров', N'Евгеньевич', N'+7 (876) 846 54 65', 1, 3)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (2, N'u2', N'Qwerty1!', N'Андрей', N'Никитин', N'Николаевич', N'+7 (876) 846 54 65', 2, 0)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (3, N'w1', N'Qwerty1!', N'Николай', N'Егоров', N'Егорович', N'+7 (876) 846 54 65', 3, 5)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (4, N'йцу', N'Qwerty1!', N'Иван', N'Иванов', N'Иванович', N'+7 (876) 846 54 65', NULL, 0)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (5, N'fewfwefwe', N'Qwerty!1', N'Павел', N'Анисимов', N'Петрович', N'+7 (876) 846 54 65', 5, 3)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (6, N'jytjtyjt', N'Qwerty!1', N'Сергей', N'Николаев', N'Борисович', N'+7 (987) 777 98 78', 6, 0)
INSERT [dbo].[User] ([UserID], [Login], [Password], [FirstName], [LastName], [Patronymic], [Phone], [UserCardID], [CardSale]) VALUES (7, N'u3', N'Qwerty!1', N'Александр', N'Коровин', N'Константинович', N'+7 (952) 365 48 14', NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
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
ALTER TABLE [dbo].[FoodStaff]  WITH CHECK ADD  CONSTRAINT [FK_FoodStaff_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[FoodStaff] CHECK CONSTRAINT [FK_FoodStaff_Unit]
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
