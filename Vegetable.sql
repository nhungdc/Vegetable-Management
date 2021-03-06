USE [VegetableManagement]
GO
/****** Object:  Table [dbo].[TblCategory]    Script Date: 10/29/2021 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCategory](
	[categoryID] [nchar](10) NOT NULL,
	[categoryName] [nchar](20) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProduct]    Script Date: 10/29/2021 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProduct](
	[productID] [nchar](10) NOT NULL,
	[productName] [nchar](50) NULL,
	[categoryID] [nchar](10) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[statusID] [bit] NULL,
	[image] [varchar](200) NULL,
 CONSTRAINT [PK_TblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRole]    Script Date: 10/29/2021 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRole](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](10) NULL,
 CONSTRAINT [PK_TblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblStatus]    Script Date: 10/29/2021 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblStatus](
	[status] [bit] NOT NULL,
	[statusName] [varchar](20) NULL,
 CONSTRAINT [PK_TblStatus] PRIMARY KEY CLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUsers]    Script Date: 10/29/2021 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUsers](
	[userID] [varchar](10) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[password] [nvarchar](20) NULL,
	[status] [bit] NULL,
	[roleID] [varchar](10) NULL,
 CONSTRAINT [PK_TblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TblCategory] ([categoryID], [categoryName]) VALUES (N'P001      ', N'Vegetable           ')
INSERT [dbo].[TblCategory] ([categoryID], [categoryName]) VALUES (N'P002      ', N'Fruits              ')
INSERT [dbo].[TblCategory] ([categoryID], [categoryName]) VALUES (N'P003      ', N'Mushroom            ')
INSERT [dbo].[TblCategory] ([categoryID], [categoryName]) VALUES (N'P004      ', N'Seed                ')
GO
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N001      ', N'Broccoli                                          ', N'P001      ', 30000, 100, 1, N'https://th.bing.com/th/id/R.597e54858645d2f75d10b7e98ea9a04e?rik=2lgufMcalVnWhQ&pid=ImgRaw&r=0')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N002      ', N'Potato                                            ', N'P001      ', 20000, 100, 1, N'https://th.bing.com/th/id/R.bcfe1a7155ed9605f6301f5b7bec7e41?rik=7zYpjl8nHjpWQw&pid=ImgRaw&r=0')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N003      ', N'Apple                                             ', N'P003      ', 15000, 100, 1, N'https://www.collinsdictionary.com/images/full/apple_158989157.jpg')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N004      ', N'Orange                                            ', N'P003      ', 20000, 100, 1, N'https://th.bing.com/th/id/OIP.jLI6MID8eYATASXo9sSL7wHaFP?pid=ImgDet&rs=1')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N005      ', N'Walnut                                            ', N'P004      ', 40000, 100, 1, N'http://cdn.tgdd.vn/Files/2019/09/02/1194304/walnuts-la-gi-tac-dung-cua-walnuts-voi-suc-khoe-201909022035231756.jpg')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N006      ', N'Chestnut                                          ', N'P004      ', 40000, 100, 1, N'https://th.bing.com/th/id/OIP.kBjDP3e5cwc5hggBW2Z2pAHaFj?pid=ImgDet&rs=1')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N007      ', N'Ganoderma                                         ', N'P002      ', 20000, 100, 1, N'https://cdn.shopify.com/s/files/1/0003/0041/7038/products/lcttgl_700x700.jpg?v=1571610227')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N008      ', N'Sweet Potato                                      ', N'P001      ', 15000, 100, 1, N'https://th.bing.com/th/id/R.be301d0b5fd3d496f46f35146afe69a4?rik=h0cL05973MxVyA&pid=ImgRaw&r=0')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N009      ', N'Chia Seed                                         ', N'P004      ', 50000, 100, 1, N'https://th.bing.com/th/id/R.a8826fd56dccfb189ed7dd5604c96dcb?rik=vPuNQ2dcr38l5w&pid=ImgRaw&r=0')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N010      ', N'Water Ppinach                                     ', N'P001      ', 20000, 100, 1, N'https://th.bing.com/th/id/OIP.T7Zni7SXCxqbcIzBg9GSywHaHa?pid=ImgDet&rs=1')
INSERT [dbo].[TblProduct] ([productID], [productName], [categoryID], [price], [quantity], [statusID], [image]) VALUES (N'N011      ', N'abc                                               ', N'P001      ', 123, 12, 1, N'abc')
GO
INSERT [dbo].[TblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[TblRole] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[TblStatus] ([status], [statusName]) VALUES (0, N'Disable')
INSERT [dbo].[TblStatus] ([status], [statusName]) VALUES (1, N'Enable')
GO
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'admin', N'Duong Cam Nhung', N'0813636017', N'abc123', N'1', 1, N'AD')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'demo', N'DCN', N'0123456789', N'abc789', N'1', 1, N'AD')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'demo1', N'Pham Hoang Hai', N'0584693548', N'acb345', N'1', 1, N'US')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'demo2', N'Le Thi Ngoc', N'0354993288', N'abc456', N'1', 1, N'US')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'demo3', N'NTN', N'0254832486', N'abc568', N'1', 1, N'US')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'demo4', N'NPL', N'0129259857', N'abc648', N'1', 1, N'US')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'demo5', N'demoo5', N'015643251', N'abc123', N'1', 1, N'US')
INSERT [dbo].[TblUsers] ([userID], [fullName], [phone], [address], [password], [status], [roleID]) VALUES (N'user', N'Nguyen Van An', N'0123456789', N'acb234', N'1', 1, N'US')
GO
ALTER TABLE [dbo].[TblProduct]  WITH CHECK ADD  CONSTRAINT [FK_TblProduct_TblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[TblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[TblProduct] CHECK CONSTRAINT [FK_TblProduct_TblCategory]
GO
ALTER TABLE [dbo].[TblProduct]  WITH CHECK ADD  CONSTRAINT [FK_TblProduct_TblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[TblStatus] ([status])
GO
ALTER TABLE [dbo].[TblProduct] CHECK CONSTRAINT [FK_TblProduct_TblStatus]
GO
ALTER TABLE [dbo].[TblUsers]  WITH CHECK ADD  CONSTRAINT [FK_TblUsers_TblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[TblRole] ([roleID])
GO
ALTER TABLE [dbo].[TblUsers] CHECK CONSTRAINT [FK_TblUsers_TblRole]
GO
ALTER TABLE [dbo].[TblUsers]  WITH CHECK ADD  CONSTRAINT [FK_TblUsers_TblStatus] FOREIGN KEY([status])
REFERENCES [dbo].[TblStatus] ([status])
GO
ALTER TABLE [dbo].[TblUsers] CHECK CONSTRAINT [FK_TblUsers_TblStatus]
GO
