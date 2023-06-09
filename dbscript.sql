USE [master]
GO
/****** Object:  Database [Vegefoods]    Script Date: 05/07/2023 22:49:24 ******/
CREATE DATABASE [Vegefoods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vegefoods', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.TUANLETHANH\MSSQL\DATA\Vegefoods.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vegefoods_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.TUANLETHANH\MSSQL\DATA\Vegefoods_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Vegefoods] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vegefoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vegefoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vegefoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vegefoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vegefoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vegefoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vegefoods] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vegefoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vegefoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vegefoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vegefoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vegefoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vegefoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vegefoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vegefoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vegefoods] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vegefoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vegefoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vegefoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vegefoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vegefoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vegefoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vegefoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vegefoods] SET RECOVERY FULL 
GO
ALTER DATABASE [Vegefoods] SET  MULTI_USER 
GO
ALTER DATABASE [Vegefoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vegefoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vegefoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vegefoods] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vegefoods] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vegefoods] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vegefoods', N'ON'
GO
ALTER DATABASE [Vegefoods] SET QUERY_STORE = ON
GO
ALTER DATABASE [Vegefoods] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Vegefoods]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05/07/2023 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 05/07/2023 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/07/2023 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[price] [float] NULL,
	[image] [varchar](max) NULL,
	[cate_id] [int] NULL,
	[isWish] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/07/2023 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/07/2023 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[phoneNumber] [varchar](11) NULL,
	[password] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cate_id], [name]) VALUES (1, N'Vegetables')
INSERT [dbo].[Categories] ([cate_id], [name]) VALUES (2, N'Fruits')
INSERT [dbo].[Categories] ([cate_id], [name]) VALUES (3, N'Dried')
INSERT [dbo].[Categories] ([cate_id], [name]) VALUES (4, N'Juices')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (1, N'BELL PEPPER', N'They have dark green lance-shaped leaves, small white flowers, and edible fruits. The fruit is classified as a berry and ranges in color from green, yellow, orange, red, purple, black, and white.', 80, N'product-1.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (2, N'STRAWBERRY', N'The strawberry is a succulent and fragrant fruit of bright red colour, obtained from the plant with the same name. In the West it is considered as the " queen of the fruit"', 120, N'product-2.jpg', 2, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (3, N'GREEN BEANS', N'Green beans are vegetables that grow on vines during the summer and fall months', 100, N'product-3.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (4, N'PURPLE CABBAGE', N'Red cabbage is a nutrient-rich, cruciferous, or Brassica vegetable that''s related to cauliflower and kale. It''s sometimes called purple cabbage since its leaves are a dark purple-reddish color', 90, N'product-4.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (5, N'TOMATO', N'The tomato fruit is globular or ovoid. Botanically, the fruit exhibits all of the common characteristics of berries.', 80, N'product-5.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (6, N'BROCOLLI', N'Fresh broccoli should be dark green in colour, with firm stalks and compact bud clusters. Broccoli is a fast-growing annual plant that grows 60–90 cm (24–35 inches) tall.', 70, N'product-6.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (7, N'CARROTS', N'Carrot: Daucus carota sp. sativus (Hoffm.), (2n = 18) Carrot is a biennial, belonging to the family Apiaceae, and is an important vegetable for its fleshy edible, colorful roots', 80, N'product-7.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (8, N'FRUIT JUICE', N'Fruit juice is 100% pure juice made from the flesh of fresh fruit or from whole fruit, depending on the type used', 60, N'product-8.jpg', 4, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (9, N'ONION', N'An onion is a round vegetable with a light brown skin. It has many white layers on its inside which have a strong, sharp smell and taste.', 50, N'product-9.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (10, N'APPLE', N'The apple is one of the pome (fleshy) fruits. Apples at harvest vary widely in size, shape, colour, and acidity, but most are fairly round and some shade of red or yellow.', 70, N'product-10.jpg', 2, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (11, N'GARLIC', N'A herb growing from a strongly aromatic, rounded bulb composed of around 10 to 20 cloves covered in a papery coat.', 50, N'product-11.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (12, N'CHILLI', N'Chilli (Capsicum annuum L. and Capsicum frutescens L.) is a hot-tasting tropical berry belonging to the Solanaceae family.', 60, N'product-12.jpg', 1, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (13, N'Dried Fruits', N'Dried fruit is fruit that has had almost all of the water content removed through drying methods.', 120, N'product-13.jpg', 3, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (14, N'Pomelo', N'So delicious!', 60, N'pomelo.jpg', 3, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (15, N'Orange', N'Niceeeeeee!', 50, N'orange.jpg', 2, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (17, N'Orange Juices', N'Veryyyyyy Niceeeeeee!', 50, N'orangejuices.jpg', 4, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (18, N'Coconut juices', N'Yummy!', 55, N'coconutjuices.jpg', 4, 1)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (19, N'Fresh Dragon Fruit', N'They have scaly skin that can be pink or yellow, while the inside flesh may be red or white with tiny, black seeds. It has a crunchy texture and sweet flavor like a kiwi or pear.', 49, N'dragonFruit.jpg', 2, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (20, N'Mango', N'Mangoes have a thin, waxy, red and green skin that covers the outside. Inside, there is a large pit in the middle of the bright orange flesh. Mangoes have a sweet, tangy flavor.', 40, N'mango.jpg', 2, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (21, N'Cashew', N'Good for heath!', 80, N'cashew.jpg', 3, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (22, N'Walnuts ', N'Walnuts are loaded with vital Omega-3 fatty acids. (Shutterstock)', 129, N'Walnuts.jpg', 3, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (23, N'Pistachios ', N'Pistachios prevent diabetes and boost immunity', 100, N'Pistachios.webp', 3, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (24, N'MIXED FRUIT JUICE', N'We believe that more is merrier, so we packed the goodness of Sugarcane to keep you naturally energised, Guava for Vitamin C and much more in this delicious mixed fruit juice.', 50, N'MIXED FRUIT JUICE.jpg', 4, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (25, N'Apple juice', N'100% organic apple juice. Glass bottle 700 ml.', 40, N'applejuice.jpg', 4, 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [image], [cate_id], [isWish]) VALUES (26, N'Watermelon Juice', N'cool in summer day', 45, N'Watermelon Juice.jpg', 4, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Roles] ([role_id], [name]) VALUES (2, N'CUSTOMER')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [phoneNumber], [password], [email], [role_id]) VALUES (1, N'0378315207', N'123456', N'thanhtuanle939@gmail.com', 1)
INSERT [dbo].[Users] ([user_id], [phoneNumber], [password], [email], [role_id]) VALUES (2, N'123456789', N'12345', N'thanhtuanle0209@gmail.com', 2)
INSERT [dbo].[Users] ([user_id], [phoneNumber], [password], [email], [role_id]) VALUES (3, N'1234567890', N'123', N'test@gmail.com', 2)
INSERT [dbo].[Users] ([user_id], [phoneNumber], [password], [email], [role_id]) VALUES (4, N'123321', N'123', N'admin@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].[Categories] ([cate_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [Vegefoods] SET  READ_WRITE 
GO
