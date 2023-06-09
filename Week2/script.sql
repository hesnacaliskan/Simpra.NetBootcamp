USE [SimpraHwDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17.05.2023 16:12:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 17.05.2023 16:12:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[AddressLine1] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Province] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230516122149_mig_1', N'6.0.16')
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (3, N'Hesna', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Hüdanur', N'Engin', N'hudanurengin@gmail.com', N'05426319586', CAST(N'2000-06-15T14:11:05.5150000' AS DateTime2), N'barbaros mah. çağla sk. hicret apt. no:12 daire: 3', N'Çanakkale', N'Türkiye', N'Merkez')
INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (4, N'Hesna', CAST(N'2023-05-16T14:27:58.7385762' AS DateTime2), N'Hatice Hesna', N'Çalışkan', N'hhesnacaliskan@gmail.com', N'05438896617', CAST(N'2000-10-30T00:00:00.0000000' AS DateTime2), N'barbaros mah. hamidiye sk. eker apt. no:12 daire: 4', N'Çanakkale', N'Türkiye', N'Merkez')
INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (5, N'Seha', CAST(N'2023-05-16T14:47:39.3729406' AS DateTime2), N'İsmail Seha', N'Çalışkan', N'isehacaliskan@gmail.com', N'05425863308', CAST(N'2003-05-28T00:00:00.0000000' AS DateTime2), N'barbaros mah. hamidiye sk. eker apt. no:12 daire: 4', N'Çanakkale', N'Türkiye', N'Merkez')
INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (9, N'Hesna', CAST(N'2023-05-17T12:03:50.4032289' AS DateTime2), N'Zeynep', N'Şallı', N'zeynepsalli@gmail.com', N'05423697536', CAST(N'1996-05-17T00:00:00.0000000' AS DateTime2), N'Esenler Mah. Güllü Sk. Lale Apt. No:20 daire:15', N'İstanbul', N'Türkiye', N'Esenler')
INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (10, N'Hüda', CAST(N'2023-05-17T12:08:02.1691318' AS DateTime2), N'Zeynep', N'Yılmaz', N'zeynepyilmaz@gmail.com', N'05438895218', CAST(N'1998-02-11T00:00:00.0000000' AS DateTime2), N'Muratpaşa mah. Evci Sk. No:5', N'İstanbul', N'Türkiye', N'Bayrampaşa')
INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (11, N'Hesna', CAST(N'2023-05-17T12:19:34.9201589' AS DateTime2), N'Zeynep', N'Yalçın', N'zeynepyalcin@gmail.com', N'05367425600', CAST(N'1999-11-27T00:00:00.0000000' AS DateTime2), N'Hamitler Mah. Gür Cd. No:32 Daire:16', N'Bursa', N'Türkiye', N'Osmangazi')
INSERT [dbo].[Staff] ([Id], [CreatedBy], [CreatedAt], [FirstName], [LastName], [Email], [Phone], [DateOfBirth], [AddressLine1], [City], [Country], [Province]) VALUES (12, N'Seha', CAST(N'2023-05-17T12:22:48.2621930' AS DateTime2), N'İpek', N'Katik', N'ipekkatik@gmail.com', N'05358544508', CAST(N'1999-06-12T00:00:00.0000000' AS DateTime2), N'Bağlarbaşı Mah., 2. Nilüfer Cad. No:16 Daire:22', N'Bursa', N'Türkiye', N'Osmangazi')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
