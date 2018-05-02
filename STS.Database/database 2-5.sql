USE [master]
GO
/****** Object:  Database [STSDb]    Script Date: 02/05/2018 13:57:02 ******/
CREATE DATABASE [STSDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STSDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\STSDb.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STSDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\STSDb_0.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STSDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STSDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STSDb] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [STSDb] SET ANSI_NULLS ON 
GO
ALTER DATABASE [STSDb] SET ANSI_PADDING ON 
GO
ALTER DATABASE [STSDb] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [STSDb] SET ARITHABORT ON 
GO
ALTER DATABASE [STSDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STSDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STSDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STSDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STSDb] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [STSDb] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [STSDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STSDb] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [STSDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STSDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STSDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STSDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STSDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STSDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STSDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STSDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STSDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STSDb] SET RECOVERY FULL 
GO
ALTER DATABASE [STSDb] SET  MULTI_USER 
GO
ALTER DATABASE [STSDb] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [STSDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STSDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STSDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STSDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [STSDb]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Module]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Descreption] [nvarchar](250) NULL,
	[ImageName] [nvarchar](150) NULL,
	[PrerequisiteModuleId] [int] NULL,
	[ImageName2] [nvarchar](50) NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Descreption] [nvarchar](1000) NULL,
	[Order] [int] NULL,
	[ImageName] [nvarchar](500) NULL,
	[PrerequisiteSessionId] [int] NULL,
	[IsLastSession] [bit] NOT NULL CONSTRAINT [DF_Session_IsLastSession]  DEFAULT ((0)),
	[LevelId] [int] NOT NULL,
	[LevelName] [nvarchar](150) NOT NULL,
	[LevelDescreption] [nvarchar](500) NOT NULL,
	[LevelImageName] [nvarchar](500) NOT NULL,
	[NumberOfChoices] [int] NOT NULL CONSTRAINT [DF_Session_NumberOfChoices]  DEFAULT ((2)),
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionsSounds]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionsSounds](
	[SessionId] [int] NOT NULL,
	[SoundId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sound]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sound](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DisplayName] [nvarchar](150) NULL,
	[IsAlphabeticIndexed] [bit] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_Sound] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SoundImages]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoundImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SoundId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_SoundImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCompletedModules]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompletedModules](
	[UserId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCompletedSessions]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompletedSessions](
	[UserId] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
	[UserTestId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserCompletedSessions_CreatedDate]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Username] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[UserTest]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
	[Score] [decimal](18, 0) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserTest_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_UserTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTestSounds]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTestSounds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserTestId] [int] NOT NULL,
	[SoundId] [int] NOT NULL,
	[SelectedImageId] [int] NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_TestSounds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [Name]) VALUES (1, N'1_pic_door_knock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (2, N'1_pic_steps')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (3, N'1_pic_ringtone')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (4, N'1_pic_water_tap')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (5, N'1_pic_ambulance')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (6, N'1_pic_car_horn')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (7, N'1_pic_rain')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (8, N'1_pic_vacuum')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (9, N'1_pic_bird2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (10, N'1_pic_cat2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (11, N'1_pic_dog1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (12, N'1_pic_snake1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (13, N'1_pic_cow')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (14, N'1_pic_duck')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (15, N'1_pic_rooster')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (16, N'1_pic_sheep1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (17, N'1_pic_baby')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (18, N'1_pic_guitar')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (19, N'1_pic_horse1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (20, N'1_pic_piano')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (21, N'1_pic_bee')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (22, N'1_pic_bee')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (23, N'1_pic_bee')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (24, N'1_pic_chicken')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (25, N'1_pic_chicken')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (26, N'1_pic_chicken')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (27, N'1_pic_fish')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (28, N'1_pic_fish')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (29, N'1_pic_fish')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (30, N'1_pic_lion')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (31, N'1_pic_lion')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (32, N'1_pic_lion')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (33, N'1_pic_sheep1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (34, N'1_pic_sheep1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (35, N'1_pic_sheep1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (36, N'1_pic_bear')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (37, N'1_pic_bear')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (38, N'1_pic_bear')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (39, N'1_pic_camel')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (40, N'1_pic_camel')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (41, N'1_pic_camel')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (42, N'1_pic_cow')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (43, N'1_pic_cow')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (44, N'1_pic_cow')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (45, N'1_pic_donkey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (46, N'1_pic_donkey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (47, N'1_pic_donkey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (48, N'1_pic_duck')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (49, N'1_pic_duck')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (50, N'1_pic_duck')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (51, N'1_pic_cucumber')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (52, N'1_pic_cucumber')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (53, N'1_pic_cucumber')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (54, N'1_pic_lemon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (55, N'1_pic_lemon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (56, N'1_pic_lemon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (57, N'1_pic_onion')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (58, N'1_pic_onion')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (59, N'1_pic_onion')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (60, N'1_pic_potato')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (61, N'1_pic_potato')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (62, N'1_pic_potato')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (63, N'1_pic_tomato')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (64, N'1_pic_tomato')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (65, N'1_pic_tomato')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (66, N'1_pic_apple')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (67, N'1_pic_apple')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (68, N'1_pic_apple')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (69, N'1_pic_banana')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (70, N'1_pic_banana')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (71, N'1_pic_banana')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (72, N'1_pic_banana')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (73, N'1_pic_grape')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (74, N'1_pic_grape')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (75, N'1_pic_grape')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (76, N'1_pic_grape')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (77, N'1_pic_strawberry')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (78, N'1_pic_strawberry')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (79, N'1_pic_strawberry')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (80, N'1_pic_strawberry')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (81, N'1_pic_watermelon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (82, N'1_pic_watermelon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (83, N'1_pic_watermelon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (84, N'1_pic_watermelon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (85, N'1_pic_blouse')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (86, N'1_pic_blouse')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (87, N'1_pic_blouse')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (88, N'1_pic_blouse')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (89, N'1_pic_dress')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (90, N'1_pic_dress')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (91, N'1_pic_dress')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (92, N'1_pic_dress')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (93, N'1_pic_jacket')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (94, N'1_pic_jacket')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (95, N'1_pic_jacket')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (96, N'1_pic_jacket')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (97, N'1_pic_pants')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (98, N'1_pic_pants')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (99, N'1_pic_pants')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (100, N'1_pic_pants')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (101, N'1_pic_comb')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (102, N'1_pic_comb')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (103, N'1_pic_comb')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (104, N'1_pic_comb')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (105, N'1_pic_perfume')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (106, N'1_pic_perfume')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (107, N'1_pic_perfume')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (108, N'1_pic_perfume')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (109, N'1_pic_shampoo')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (110, N'1_pic_shampoo')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (111, N'1_pic_shampoo')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (112, N'1_pic_shampoo')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (113, N'1_pic_soup')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (114, N'1_pic_soup')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (115, N'1_pic_soup')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (116, N'1_pic_soup')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (117, N'1_pic_toothpaste')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (118, N'1_pic_toothpaste')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (119, N'1_pic_toothpaste')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (120, N'1_pic_toothpaste')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (121, N'1_pic_ambulance')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (122, N'1_pic_ambulance')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (123, N'1_pic_ambulance')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (124, N'1_pic_ambulance')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (125, N'1_pic_boat')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (126, N'1_pic_boat')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (127, N'1_pic_boat')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (128, N'1_pic_boat')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (129, N'1_pic_car1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (130, N'1_pic_car1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (131, N'1_pic_car1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (132, N'1_pic_car1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (133, N'1_pic_plane')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (134, N'1_pic_plane')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (135, N'1_pic_plane')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (136, N'1_pic_plane')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (137, N'1_pic_taxi')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (138, N'1_pic_taxi')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (139, N'1_pic_taxi')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (140, N'1_pic_taxi')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (141, N'1_pic_bread')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (142, N'1_pic_bread')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (143, N'1_pic_bread')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (144, N'1_pic_bread')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (145, N'1_pic_egg')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (146, N'1_pic_egg')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (147, N'1_pic_egg')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (148, N'1_pic_egg')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (149, N'1_pic_honey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (150, N'1_pic_honey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (151, N'1_pic_honey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (152, N'1_pic_honey')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (153, N'1_pic_milk')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (154, N'1_pic_milk')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (155, N'1_pic_milk')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (156, N'1_pic_milk')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (157, N'1_pic_oil')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (158, N'1_pic_oil')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (159, N'1_pic_oil')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (160, N'1_pic_oil')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (161, N'1_pic_cake')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (162, N'1_pic_cake')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (163, N'1_pic_cake')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (164, N'1_pic_cake')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (165, N'1_pic_cheese')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (166, N'1_pic_cheese')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (167, N'1_pic_cheese')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (168, N'1_pic_cheese')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (169, N'1_pic_salad')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (170, N'1_pic_salad')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (171, N'1_pic_salad')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (172, N'1_pic_salad')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (173, N'1_pic_sandwich')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (174, N'1_pic_sandwich')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (175, N'1_pic_sandwich')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (176, N'1_pic_sandwich')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (177, N'1_pic_tea')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (178, N'1_pic_tea')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (179, N'1_pic_tea')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (180, N'1_pic_tea')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (181, N'1_pic_circle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (182, N'1_pic_circle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (183, N'1_pic_circle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (184, N'1_pic_circle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (185, N'1_pic_heart')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (186, N'1_pic_heart')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (187, N'1_pic_heart')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (188, N'1_pic_heart')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (189, N'1_pic_square')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (190, N'1_pic_square')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (191, N'1_pic_square')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (192, N'1_pic_square')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (193, N'1_pic_star')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (194, N'1_pic_star')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (195, N'1_pic_star')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (196, N'1_pic_star')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (197, N'1_pic_triangle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (198, N'1_pic_triangle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (199, N'1_pic_triangle')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (200, N'1_pic_triangle')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (201, N'1_pic_autumn')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (202, N'1_pic_autumn')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (203, N'1_pic_autumn')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (204, N'1_pic_autumn')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (205, N'1_pic_spring')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (206, N'1_pic_spring')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (207, N'1_pic_spring')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (208, N'1_pic_spring')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (209, N'1_pic_summer')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (210, N'1_pic_summer')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (211, N'1_pic_summer')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (212, N'1_pic_summer')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (213, N'1_pic_winter')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (214, N'1_pic_winter')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (215, N'1_pic_winter')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (216, N'1_pic_winter')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (217, N'1_pic_bed')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (218, N'1_pic_bed')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (219, N'1_pic_bed')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (220, N'1_pic_bed')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (221, N'1_pic_closet')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (222, N'1_pic_closet')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (223, N'1_pic_closet')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (224, N'1_pic_closet')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (225, N'1_pic_door_knock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (226, N'1_pic_door_knock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (227, N'1_pic_door_knock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (228, N'1_pic_door_knock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (229, N'1_pic_light')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (230, N'1_pic_light')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (231, N'1_pic_light')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (232, N'1_pic_light')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (233, N'1_pic_window')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (234, N'1_pic_window')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (235, N'1_pic_window')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (236, N'1_pic_window')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (237, N'1_pic_chair')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (238, N'1_pic_chair')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (239, N'1_pic_chair')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (240, N'1_pic_chair')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (241, N'1_pic_key')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (242, N'1_pic_key')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (243, N'1_pic_key')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (244, N'1_pic_key')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (245, N'1_pic_mirror')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (246, N'1_pic_mirror')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (247, N'1_pic_mirror')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (248, N'1_pic_mirror')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (249, N'1_pic_table')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (250, N'1_pic_table')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (251, N'1_pic_table')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (252, N'1_pic_table')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (253, N'1_pic_clock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (254, N'1_pic_clock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (255, N'1_pic_clock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (256, N'1_pic_clock')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (257, N'1_pic_bathroom')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (258, N'1_pic_bathroom')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (259, N'1_pic_bathroom')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (260, N'1_pic_bathroom')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (261, N'1_pic_garden')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (262, N'1_pic_garden')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (263, N'1_pic_garden')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (264, N'1_pic_garden')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (265, N'1_pic_heater')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (266, N'1_pic_heater')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (267, N'1_pic_heater')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (268, N'1_pic_heater')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (269, N'1_pic_house')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (270, N'1_pic_house')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (271, N'1_pic_house')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (272, N'1_pic_house')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (273, N'1_pic_kitchen')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (274, N'1_pic_kitchen')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (275, N'1_pic_kitchen')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (276, N'1_pic_kitchen')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (277, N'1_pic_fridge')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (278, N'1_pic_fridge')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (279, N'1_pic_fridge')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (280, N'1_pic_fridge')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (281, N'1_pic_oven')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (282, N'1_pic_oven')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (283, N'1_pic_oven')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (284, N'1_pic_oven')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (285, N'1_pic_television')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (286, N'1_pic_television')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (287, N'1_pic_television')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (288, N'1_pic_television')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (289, N'1_pic_vacuum')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (290, N'1_pic_vacuum')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (291, N'1_pic_vacuum')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (292, N'1_pic_vacuum')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (293, N'1_pic_washing_machine')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (294, N'1_pic_washing_machine')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (295, N'1_pic_washing_machine')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (296, N'1_pic_washing_machine')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (297, N'1_pic_fork')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (298, N'1_pic_fork')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (299, N'1_pic_fork')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (300, N'1_pic_fork')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (301, N'1_pic_glass')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (302, N'1_pic_glass')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (303, N'1_pic_glass')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (304, N'1_pic_glass')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (305, N'1_pic_knife')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (306, N'1_pic_knife')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (307, N'1_pic_knife')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (308, N'1_pic_knife')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (309, N'1_pic_plate')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (310, N'1_pic_plate')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (311, N'1_pic_plate')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (312, N'1_pic_plate')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (313, N'1_pic_spoon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (314, N'1_pic_spoon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (315, N'1_pic_spoon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (316, N'1_pic_spoon')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (317, N'1_pic_ear')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (318, N'1_pic_ear')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (319, N'1_pic_eye')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (320, N'1_pic_eye')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (321, N'1_pic_mouth')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (322, N'1_pic_mouth')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (323, N'1_pic_nose')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (324, N'1_pic_nose')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (325, N'1_pic_tongue')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (326, N'1_pic_tongue')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (327, N'1_pic_face')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (328, N'1_pic_face')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (329, N'1_pic_face')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (330, N'1_pic_face')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (331, N'1_pic_hair')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (332, N'1_pic_hair')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (333, N'1_pic_moustache')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (334, N'1_pic_moustache')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (335, N'1_pic_tooth')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (336, N'1_pic_tooth')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (337, N'1_pic_back')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (338, N'1_pic_back')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (339, N'1_pic_finger')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (340, N'1_pic_finger')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (341, N'1_pic_hand')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (342, N'1_pic_hand')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (343, N'1_pic_leg')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (344, N'1_pic_leg')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (345, N'1_pic_stomach')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (346, N'1_pic_stomach')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (347, N'1_pic_bird1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (348, N'1_pic_bird1')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (349, N'1_pic_cat2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (350, N'1_pic_cat2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (351, N'1_pic_dog2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (352, N'1_pic_dog2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (353, N'1_pic_horse2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (354, N'1_pic_horse2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (355, N'1_pic_snake2')
INSERT [dbo].[Image] ([Id], [Name]) VALUES (356, N'1_pic_snake2')
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Module] ON 

INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId], [ImageName2]) VALUES (1, 1, N'إكتشاف الأصوات', N'انتباه لوجود صوت', N'1_Pic_1blue', NULL, N'1_Pic_Sound')
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId], [ImageName2]) VALUES (2, 2, N'تمييز الأصوات', N'التعرف على الأصوات البيئية', N'1_Pic_2blue', NULL, N'1_Pic_Enviroment')
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId], [ImageName2]) VALUES (3, 3, N'كلمات', N'التعرف على أكثر الكلمات المستعملة يوميا', N'1_Pic_3blue', NULL, N'1_Pic_Words')
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId], [ImageName2]) VALUES (4, 4, N'جمل', N'الإستماع الى محادثات يومية مع اضافة ضوضاء لزيادة الصعوبة ', N'1_Pic_4blue', NULL, N'1_Pic_Sentence')
SET IDENTITY_INSERT [dbo].[Module] OFF
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (1, 2, N'الدرس الأول', N'عين - تم - أنف - أذن - لسان', 1, N'1_Pic_1fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 1 Desc', N'1_Pic_1fish', 2)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (2, 2, N'الدرس الثاني', NULL, 2, N'1_Pic_2fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 1 Desc', N'1_Pic_1fish', 2)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (3, 2, N'الدرس الثالث', NULL, 3, N'1_Pic_3fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 1 Desc', N'1_Pic_1fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (4, 2, N'الدرس الرابع', NULL, 4, N'1_Pic_4fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 1 Desc', N'1_Pic_1fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (5, 2, N'الدرس الخامس', NULL, 5, N'1_Pic_5fish', NULL, 1, 1, N'المرحلة الأولى', N'Level 1 Desc', N'1_Pic_1fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (6, 3, N'الدرس الأول', N'عين - تم - أنف - أذن - لسان', 1, N'1_Pic_1fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 2 Desc', N'1_Pic_3fish', 2)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (7, 3, N'الدرس الثاني', NULL, 2, N'1_Pic_2fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 2 Desc', N'1_Pic_3fish', 2)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (8, 3, N'الدرس الثالث', NULL, 3, N'1_Pic_3fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 2 Desc', N'1_Pic_3fish', 2)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (9, 3, N'الدرس الرابع', NULL, 4, N'1_Pic_4fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (10, 3, N'الدرس الخامس', NULL, 5, N'1_Pic_5fish', NULL, 0, 1, N'المرحلة الأولى', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (11, 3, N'الدرس الأول', NULL, 6, N'1_Pic_5fish', NULL, 0, 2, N'المرحلة االثانية', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (12, 3, N'الدرس الثاني', NULL, 7, N'1_Pic_5fish', NULL, 0, 2, N'المرحلة االثانية', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (13, 3, N'الدرس الثالث', NULL, 8, N'1_Pic_5fish', NULL, 0, 2, N'المرحلة االثانية', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (14, 3, N'الدرس الرابع', NULL, 9, N'1_Pic_5fish', NULL, 0, 2, N'المرحلة االثانية', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (15, 3, N'الدرس الخامس', N'عين - تم - أنف - أذن - لسان', 10, N'1_Pic_5fish', NULL, 0, 2, N'المرحلة االثانية', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (16, 3, N'الدرس الأول', NULL, 11, N'1_Pic_5fish', NULL, 0, 3, N'المرحلة الثالثة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (17, 3, N'الدرس الثاني', NULL, 12, N'1_Pic_5fish', NULL, 0, 3, N'المرحلة الثالثة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (18, 3, N'الدرس الثالث', NULL, 13, N'1_Pic_5fish', NULL, 0, 3, N'المرحلة الثالثة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (19, 3, N'الدرس الرابع', NULL, 14, N'1_Pic_5fish', NULL, 0, 3, N'المرحلة الثالثة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (20, 3, N'الدرس الخامس', NULL, 15, N'1_Pic_5fish', NULL, 0, 3, N'المرحلة الثالثة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (21, 3, N'الدرس الأول', NULL, 16, N'1_Pic_5fish', NULL, 0, 4, N'المرحلة الرابعة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (22, 3, N'الدرس الثاني', NULL, 17, N'1_Pic_5fish', NULL, 0, 4, N'المرحلة الرابعة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (23, 3, N'الدرس الثالث', NULL, 18, N'1_Pic_5fish', NULL, 0, 4, N'المرحلة الرابعة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (24, 3, N'الدرس الرابع', NULL, 19, N'1_Pic_5fish', NULL, 0, 4, N'المرحلة الرابعة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession], [LevelId], [LevelName], [LevelDescreption], [LevelImageName], [NumberOfChoices]) VALUES (25, 3, N'الدرس الخامس', NULL, 20, N'1_Pic_5fish', NULL, 1, 4, N'المرحلة الرابعة', N'Level 2 Desc', N'1_Pic_3fish', 3)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 1)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 2)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 3)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 4)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 5)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 6)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 7)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 8)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (3, 9)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (3, 10)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (3, 11)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (3, 12)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (4, 13)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (4, 14)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (4, 15)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (4, 16)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (5, 17)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (5, 18)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (5, 19)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (5, 20)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 21)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 22)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 23)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 24)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 25)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 26)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 27)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 28)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 29)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 30)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 31)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 32)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 33)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (10, 34)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 35)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 36)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 37)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 38)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 39)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 40)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 41)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 42)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 43)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 44)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 45)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 46)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 47)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 48)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (11, 49)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 50)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 51)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 52)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 53)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 54)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 55)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 56)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 57)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 58)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 59)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 60)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 61)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 62)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (12, 63)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 64)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 65)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 66)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 67)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 68)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 69)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 70)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 71)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 72)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 73)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 74)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 75)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 76)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 77)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 78)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 79)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 80)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 81)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (13, 82)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 83)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 84)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 85)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 86)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 87)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 88)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 89)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 90)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 91)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 92)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 93)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 94)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 95)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 96)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 97)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (14, 98)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 99)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 100)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 101)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 102)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 103)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 104)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 105)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 106)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 107)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 108)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 109)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 110)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 111)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 112)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 113)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 114)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 115)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 116)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 117)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (15, 118)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 119)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 120)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 121)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 122)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 123)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 124)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 125)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 126)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 127)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 128)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 129)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 130)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 131)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 132)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 133)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 134)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 135)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 136)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 137)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (16, 138)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 139)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 140)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 141)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 142)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 143)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 144)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 145)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 146)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 147)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 148)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 149)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 150)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 151)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 152)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 153)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 154)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 155)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 156)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 157)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (17, 158)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 159)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 160)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 161)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 162)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 163)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 164)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 165)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 166)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 167)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 168)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 169)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 170)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 171)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 172)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 173)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 174)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 175)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 176)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 177)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (18, 178)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 179)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 180)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 181)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 182)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 183)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 184)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 185)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 186)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 187)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 188)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 189)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 190)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 191)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 192)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 193)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 194)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 195)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 196)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 197)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 198)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (19, 199)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 200)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 201)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 202)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 203)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 204)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 205)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 206)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 207)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 208)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 209)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 210)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 211)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 212)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 213)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 214)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (20, 215)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 216)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 217)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 218)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 219)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 220)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 221)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 222)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 223)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 224)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 225)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 226)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 227)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 228)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 229)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 230)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 231)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 232)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 233)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 234)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (21, 235)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 236)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 237)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 238)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 239)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 240)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 241)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 242)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 243)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 244)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 245)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 246)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 247)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 248)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 249)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 250)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 251)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 252)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 253)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 254)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (22, 255)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 256)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 257)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 258)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 259)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 260)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 261)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 262)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 263)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 264)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 265)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 266)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 267)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 268)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 269)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 270)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 271)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 272)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 273)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 274)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (23, 275)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 276)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 277)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 278)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 279)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 280)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 281)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 282)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 283)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 284)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 285)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 286)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 287)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 288)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 289)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 290)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 291)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 292)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 293)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 294)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (24, 295)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 296)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 297)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 298)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 299)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 300)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 301)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 302)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 303)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 304)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 305)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 306)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 307)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 308)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 309)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 310)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 311)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 312)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 313)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 314)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (25, 315)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 316)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 317)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 318)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 319)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 320)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 321)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 322)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 323)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 324)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (6, 325)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 326)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 327)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 328)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 329)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 330)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 331)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 332)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 333)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 334)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (7, 335)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 336)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 337)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 338)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 339)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 340)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 341)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 342)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 343)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (8, 344)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 345)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 346)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 347)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 348)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 349)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 350)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 351)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 352)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 353)
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (9, 354)
SET IDENTITY_INSERT [dbo].[Sound] ON 

INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (1, N'1_sound_door_knocking', N'دقة باب', 1, 1)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (2, N'1_sound_foot steps', N'خطوات', 1, 2)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (3, N'1_sound_ringtone', N'رنة تلفون', 1, 3)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (4, N'1_sound_tap_water', N'صنبور ماء', 1, 4)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (5, N'1_sound_ambulane', N'زامور سيارة إسعاف', 1, 5)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (6, N'1_sound_car_horn', N'زامور سيارة', 1, 6)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (7, N'1_sound_rain', N'مطر', 1, 7)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (8, N'1_sound_vacum', N'مكنسة', 1, 8)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (9, N'1_sound_bird', N'عصفور', 1, 9)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (10, N'1_sound_cat', N'مواء قطة', 1, 10)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (11, N'1_sound_dog', N'عواء كلب', 1, 11)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (12, N'1_sound_snake', N'فحيح الحية', 1, 12)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (13, N'1_sound_cow', N'خوار البقرة', 1, 13)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (14, N'1_sound_duck', N'بطبطة البطة', 1, 14)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (15, N'1_sound_rooster', N'صياح الديك', 1, 15)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (16, N'1_sound_sheep', N'مأمأة خروف', 1, 16)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (17, N'1_sound_baby', N'بكاء طفل', 1, 17)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (18, N'1_sound_guitar', N'عزف غيتار', 1, 18)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (19, N'1_sound_horse', N'صهيل الحصان', 1, 19)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (20, N'1_sound_piano', N'عزف حصان', 1, 20)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (21, N'1_sound_3bee', N'نحلة', 0, 21)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (22, N'1_sound_4bee', N'نحلة', 0, 21)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (23, N'1_sound_2chicken', N'دجاجة', 0, 22)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (24, N'1_sound_3chicken', N'دجاجة', 0, 22)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (25, N'1_sound_4chicken', N'دجاجة', 0, 22)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (26, N'1_sound_2fish', N'سمكة', 0, 23)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (27, N'1_sound_3fish', N'سمكة', 0, 23)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (28, N'1_sound_4fish', N'سمكة', 0, 23)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (29, N'1_sound_2lion', N'أسد', 0, 24)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (30, N'1_sound_4lion', N'أسد', 0, 24)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (31, N'1_sound_3lion', N'أسد', 0, 24)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (32, N'1_sound_2sheep', N'خروف', 0, 25)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (33, N'1_sound_3sheep', N'خروف', 0, 25)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (34, N'1_sound_4sheep', N'خروف', 0, 25)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (35, N'1_sound_2beer', N'دب', 0, 26)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (36, N'1_sound_3bear', N'دب', 0, 26)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (37, N'1_sound_4bear', N'دب', 0, 26)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (38, N'1_sound_2camel', N'جمل', 0, 27)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (39, N'1_sound_3camel', N'جمل', 0, 27)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (40, N'1_sound_4camel', N'جمل', 0, 27)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (41, N'1_sound_2cow', N'بقرة', 0, 28)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (42, N'1_sound_3cow', N'بقرة', 0, 28)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (43, N'1_sound_4cow', N'بقرة', 0, 28)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (44, N'1_sound_2donkey', N'قرد', 0, 29)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (45, N'1_sound_3donkey', N'قرد', 0, 29)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (46, N'1_sound_4donkey', N'قرد', 0, 29)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (47, N'1_sound_2duck', N'بطة', 0, 30)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (48, N'1_sound_3duck', N'بطة', 0, 30)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (49, N'1_sound_4duck', N'بطة', 0, 30)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (50, N'1_sound_2cucumber', N'خيار', 0, 31)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (51, N'1_sound_3cucumber', N'خيار', 0, 31)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (52, N'1_sound_4cucumber', N'خيار', 0, 31)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (53, N'1_sound_2lemon', N'ليمون', 0, 32)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (54, N'1_sound_3lemon', N'ليمون', 0, 32)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (55, N'1_sound_2onion', N'بصل', 0, 33)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (56, N'1_sound_3onion', N'بصل', 0, 33)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (57, N'1_sound_4onion', N'بصل', 0, 33)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (58, N'1_sound_2potato', N'بطاطا', 0, 34)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (59, N'1_sound_3potato', N'بطاطا', 0, 34)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (60, N'1_sound_4potato', N'بطاطا', 0, 34)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (61, N'1_sound_2tomato', N'بندورة', 0, 35)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (62, N'1_sound_3tomato', N'بندورة', 0, 35)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (63, N'1_sound_4tomato', N'بندورة', 0, 35)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (64, N'1_sound_2apple', N'تفاحة', 0, 36)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (65, N'1_sound_3apple', N'تفاحة', 0, 36)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (66, N'1_sound_4apple', N'تفاحة', 0, 36)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (67, N'1_sound_2banana', N'موز', 0, 37)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (68, N'1_sound_3banana', N'موز', 0, 37)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (69, N'1_sound_4banana', N'موز', 0, 37)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (70, N'1_sound_5banana', N'موز', 0, 37)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (71, N'1_sound_2grape', N'عنب', 0, 38)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (72, N'1_sound_3grape', N'عنب', 0, 38)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (73, N'1_sound_4grape', N'عنب', 0, 38)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (74, N'1_sound_5grape', N'عنب', 0, 38)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (75, N'1_sound_2strawberry', N'فراولة', 0, 39)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (76, N'1_sound_3strawberry', N'فراولة', 0, 39)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (77, N'1_sound_4strawberry', N'فراولة', 0, 39)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (78, N'1_sound_5strawberry', N'فراولة', 0, 39)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (79, N'1_sound_2watermelon', N'بطيخ', 0, 40)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (80, N'1_sound_3watermelon', N'بطيخ', 0, 40)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (81, N'1_sound_4watermelon', N'بطيخ', 0, 40)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (82, N'1_sound_5watermelon', N'بطيخ', 0, 40)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (83, N'1_sound_2blouse', N'قميص', 0, 41)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (84, N'1_sound_3blouse', N'قميص', 0, 41)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (85, N'1_sound_4blouse', N'قميص', 0, 41)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (86, N'1_sound_5blouse', N'قميص', 0, 41)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (87, N'1_sound_2dress', N'فستان', 0, 42)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (88, N'1_sound_3dress', N'فستان', 0, 42)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (89, N'1_sound_4dress', N'فستان', 0, 42)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (90, N'1_sound_5dress', N'فستان', 0, 42)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (91, N'1_sound_2jacket', N'جاكيت', 0, 43)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (92, N'1_sound_3jacket', N'جاكيت', 0, 43)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (93, N'1_sound_4jacket', N'جاكيت', 0, 43)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (94, N'1_sound_5jacket', N'جاكيت', 0, 43)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (95, N'1_sound_2pants', N'بنطلون', 0, 44)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (96, N'1_sound_3pants', N'بنطلون', 0, 44)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (97, N'1_sound_4pants', N'بنطلون', 0, 44)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (98, N'1_sound_5pants', N'بنطلون', 0, 44)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (99, N'1_sound_2comb', N'مشط', 0, 45)
GO
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (100, N'1_sound_3comb', N'مشط', 0, 45)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (101, N'1_sound_4comb', N'مشط', 0, 45)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (102, N'1_sound_5comb', N'مشط', 0, 45)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (103, N'1_sound_2perfume', N'عطر', 0, 46)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (104, N'1_sound_3perfume', N'عطر', 0, 46)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (105, N'1_sound_4perfume', N'عطر', 0, 46)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (106, N'1_sound_5perfume', N'عطر', 0, 46)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (107, N'1_sound_2shampoo', N'شامبو', 0, 47)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (108, N'1_sound_3shampoo', N'شامبو', 0, 47)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (109, N'1_sound_4shampoo', N'شامبو', 0, 47)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (110, N'1_sound_5shampoo', N'شامبو', 0, 47)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (111, N'1_sound_2soap', N'صابون', 0, 48)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (112, N'1_sound_3soap', N'صابون', 0, 48)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (113, N'1_sound_4soap', N'صابون', 0, 48)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (114, N'1_sound_5soap', N'صابون', 0, 48)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (115, N'1_sound_2toothpaste', N'معجون أسنان', 0, 49)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (116, N'1_sound_3toothpaste', N'معجون أسنان', 0, 49)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (117, N'1_sound_4toothpaste', N'معجون أسنان', 0, 49)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (118, N'1_sound_5toothpaste', N'معجون أسنان', 0, 49)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (119, N'1_sound_2ambulance', N'سيارة إسعاف', 0, 50)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (120, N'1_sound_3ambulance', N'سيارة إسعاف', 0, 50)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (121, N'1_sound_1ambulance', N'سيارة إسعاف', 0, 50)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (122, N'1_sound_5ambulance', N'سيارة إسعاف', 0, 50)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (123, N'1_sound_2boat', N'قارب', 0, 51)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (124, N'1_sound_3boat', N'قارب', 0, 51)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (125, N'1_sound_1boat', N'قارب', 0, 51)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (126, N'1_sound_5boat', N'قارب', 0, 51)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (127, N'1_sound_2car', N'سيارة', 0, 52)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (128, N'1_sound_3car', N'سيارة', 0, 52)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (129, N'1_sound_1car', N'سيارة', 0, 52)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (130, N'1_sound_5car', N'سيارة', 0, 52)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (131, N'1_sound_2plane', N'طيارة', 0, 53)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (132, N'1_sound_3plane', N'طيارة', 0, 53)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (133, N'1_sound_1plane', N'طيارة', 0, 53)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (134, N'1_sound_5plane', N'طيارة', 0, 53)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (135, N'1_sound_2taxi', N'تاكسي', 0, 54)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (136, N'1_sound_3taxi', N'تاكسي', 0, 54)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (137, N'1_sound_1taxi', N'تاكسي', 0, 54)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (138, N'1_sound_5taxi', N'تاكسي', 0, 54)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (139, N'1_sound_2bread', N'خبز', 0, 55)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (140, N'1_sound_3bread', N'خبز', 0, 55)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (141, N'1_sound_1bread', N'خبز', 0, 55)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (142, N'1_sound_5bread', N'خبز', 0, 55)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (143, N'1_sound_2egg', N'بيضة', 0, 56)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (144, N'1_sound_3egg', N'بيضة', 0, 56)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (145, N'1_sound_1egg', N'بيضة', 0, 56)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (146, N'1_sound_5egg', N'بيضة', 0, 56)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (147, N'1_sound_2honey', N'عسل', 0, 57)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (148, N'1_sound_3honey', N'عسل', 0, 57)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (149, N'1_sound_1honey', N'عسل', 0, 57)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (150, N'1_sound_5honey', N'عسل', 0, 57)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (151, N'1_sound_2milk', N'حليب', 0, 58)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (152, N'1_sound_3milk', N'حليب', 0, 58)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (153, N'1_sound_1milk', N'حليب', 0, 58)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (154, N'1_sound_5milk', N'حليب', 0, 58)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (155, N'1_sound_2oil', N'زيت', 0, 59)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (156, N'1_sound_3oil', N'زيت', 0, 59)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (157, N'1_sound_1oil', N'زيت', 0, 59)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (158, N'1_sound_5oil', N'زيت', 0, 59)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (159, N'1_sound_2cake', N'كيك', 0, 60)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (160, N'1_sound_3cake', N'كيك', 0, 60)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (161, N'1_sound_1cake', N'كيك', 0, 60)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (162, N'1_sound_5cake', N'كيك', 0, 60)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (163, N'1_sound_2cheese', N'جبنة', 0, 61)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (164, N'1_sound_3cheese', N'جبنة', 0, 61)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (165, N'1_sound_1cheese', N'جبنة', 0, 61)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (166, N'1_sound_5cheese', N'جبنة', 0, 61)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (167, N'1_sound_2salad', N'سلطة', 0, 62)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (168, N'1_sound_3salad', N'سلطة', 0, 62)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (169, N'1_sound_1salad', N'سلطة', 0, 62)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (170, N'1_sound_5salad', N'سلطة', 0, 62)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (171, N'1_sound_2sandwich', N'ساندويشة', 0, 63)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (172, N'1_sound_3sandwish', N'ساندويشة', 0, 63)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (173, N'1_sound_1sandwich', N'ساندويشة', 0, 63)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (174, N'1_sound_5sandwich', N'ساندويشة', 0, 63)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (175, N'1_sound_2tea', N'شاي', 0, 64)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (176, N'1_sound_3tea', N'شاي', 0, 64)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (177, N'1_sound_1tea', N'شاي', 0, 64)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (178, N'1_sound_5tea', N'شاي', 0, 64)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (179, N'1_sound_2circle', N'دائرة', 0, 65)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (180, N'1_sound_3circle', N'دائرة', 0, 65)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (181, N'1_sound_1circle', N'دائرة', 0, 65)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (182, N'1_sound_2circle', N'دائرة', 0, 65)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (183, N'1_sound_5circle', N'دائرة', 0, 65)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (184, N'1_sound_2heart', N'قلب', 0, 66)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (185, N'1_sound_3heart', N'قلب', 0, 66)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (186, N'1_sound_1heart', N'قلب', 0, 66)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (187, N'1_sound_5heart', N'قلب', 0, 66)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (188, N'1_sound_2square', N'مربع', 0, 67)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (189, N'1_sound_3square', N'مربع', 0, 67)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (190, N'1_sound_1square', N'مربع', 0, 67)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (191, N'1_sound_5square', N'مربع', 0, 67)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (192, N'1_sound_2star', N'نجمة', 0, 68)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (193, N'1_sound_3star', N'نجمة', 0, 68)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (194, N'1_sound_1star', N'نجمة', 0, 68)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (195, N'1_sound_5star', N'نجمة', 0, 68)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (196, N'1_sound_2triangle', N'مثلث', 0, 69)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (197, N'1_sound_3triangle', N'مثلث', 0, 69)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (198, N'1_sound_1triangle', N'مثلث', 0, 69)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (199, N'1_sound_5triangle', N'مثلث', 0, 69)
GO
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (200, N'1_sound_2autumn', N'خريف', 0, 70)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (201, N'1_sound_3autumn', N'خريف', 0, 70)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (202, N'1_sound_1autumn', N'خريف', 0, 70)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (203, N'1_sound_5autumn', N'خريف', 0, 70)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (204, N'1_sound_1spring', N'ربيع', 0, 71)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (205, N'1_sound_2spring', N'ربيع', 0, 71)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (206, N'1_sound_3spring', N'ربيع', 0, 71)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (207, N'1_sound_5spring', N'ربيع', 0, 71)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (208, N'1_sound_2summer', N'صيف', 0, 72)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (209, N'1_sound_3summer', N'صيف', 0, 72)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (210, N'1_sound_1summer', N'صيف', 0, 72)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (211, N'1_sound_5summer', N'صيف', 0, 72)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (212, N'1_sound_2winter', N'شتاء', 0, 73)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (213, N'1_sound_3winter', N'شتاء', 0, 73)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (214, N'1_sound_1winter', N'شتاء', 0, 73)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (215, N'1_sound_5winter', N'شتاء', 0, 73)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (216, N'1_sound_2bed', N'تخت', 0, 74)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (217, N'1_sound_3bed', N'تخت', 0, 74)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (218, N'1_sound_1bed', N'تخت', 0, 74)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (219, N'1_sound_5bed', N'تخت', 0, 74)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (220, N'1_sound_2closet', N'خزانة', 0, 75)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (221, N'1_sound_3closet', N'خزانة', 0, 75)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (222, N'1_sound_1closet', N'خزانة', 0, 75)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (223, N'1_sound_5closet', N'خزانة', 0, 75)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (224, N'1_sound_2door', N'باب', 0, 76)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (225, N'1_sound_3door', N'باب', 0, 76)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (226, N'1_sound_1door', N'باب', 0, 76)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (227, N'1_sound_5door', N'باب', 0, 76)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (228, N'1_sound_2light', N'ضو', 0, 77)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (229, N'1_sound_3light', N'ضو', 0, 77)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (230, N'1_sound_1light', N'ضو', 0, 77)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (231, N'1_sound_5light', N'ضو', 0, 77)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (232, N'1_sound_2window', N'شباك', 0, 78)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (233, N'1_sound_3window', N'شباك', 0, 78)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (234, N'1_sound_1window', N'شباك', 0, 78)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (235, N'1_sound_5window', N'شباك', 0, 78)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (236, N'1_sound_2chair', N'كرسي', 0, 79)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (237, N'1_sound_3chair', N'كرسي', 0, 79)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (238, N'1_sound_1chair', N'كرسي', 0, 79)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (239, N'1_sound_5chair', N'كرسي', 0, 79)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (240, N'1_sound_2key', N'مفتاح', 0, 80)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (241, N'1_sound_3key', N'مفتاح', 0, 80)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (242, N'1_sound_1key', N'مفتاح', 0, 80)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (243, N'1_sound_5key', N'مفتاح', 0, 80)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (244, N'1_sound_2mirror', N'مراية', 0, 81)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (245, N'1_sound_3mirror', N'مراية', 0, 81)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (246, N'1_sound_1mirror', N'مراية', 0, 81)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (247, N'1_sound_5mirror', N'مراية', 0, 81)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (248, N'1_sound_2table', N'طاولة', 0, 82)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (249, N'1_sound_3table', N'طاولة', 0, 82)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (250, N'1_sound_1table', N'طاولة', 0, 82)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (251, N'1_sound_5table', N'طاولة', 0, 82)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (252, N'1_sound_2watch', N'ساعة', 0, 83)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (253, N'1_sound_3watch', N'ساعة', 0, 83)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (254, N'1_sound_1watch', N'ساعة', 0, 83)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (255, N'1_sound_5watch', N'ساعة', 0, 83)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (256, N'1_sound_2bathroom', N'حمام', 0, 84)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (257, N'1_sound_3bathroom', N'حمام', 0, 84)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (258, N'1_sound_1bathroom', N'حمام', 0, 84)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (259, N'1_sound_5bathroom', N'حمام', 0, 84)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (260, N'1_sound_2garden', N'حديقة', 0, 85)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (261, N'1_sound_3garden', N'حديقة', 0, 85)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (262, N'1_sound_1garden', N'حديقة', 0, 85)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (263, N'1_sound_5garden', N'حديقة', 0, 85)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (264, N'1_sound_2heater', N'صوبا', 0, 86)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (265, N'1_sound_3heater', N'صوبا', 0, 86)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (266, N'1_sound_1heater', N'صوبا', 0, 86)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (267, N'1_sound_5heater', N'صوبا', 0, 86)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (268, N'1_sound_2house', N'بيت', 0, 87)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (269, N'1_sound_3house', N'بيت', 0, 87)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (270, N'1_sound_1house', N'بيت', 0, 87)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (271, N'1_sound_5house', N'بيت', 0, 87)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (272, N'1_sound_2kitchen', N'مطبخ', 0, 88)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (273, N'1_sound_3kitchen', N'مطبخ', 0, 88)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (274, N'1_sound_1kitchen', N'مطبخ', 0, 88)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (275, N'1_sound_5kitchen', N'مطبخ', 0, 88)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (276, N'1_sound_2fridge', N'ثلاجة', 0, 89)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (277, N'1_sound_3fridge', N'ثلاجة', 0, 89)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (278, N'1_sound_1fridge', N'ثلاجة', 0, 89)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (279, N'1_sound_5fridge', N'ثلاجة', 0, 89)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (280, N'1_sound_2oven', N'فرن', 0, 90)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (281, N'1_sound_3oven', N'فرن', 0, 90)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (282, N'1_sound_1oven', N'فرن', 0, 90)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (283, N'1_sound_5oven', N'فرن', 0, 90)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (284, N'1_sound_2television', N'تلفزيون', 0, 91)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (285, N'1_sound_3television', N'تلفزيون', 0, 91)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (286, N'1_sound_1televesion', N'تلفزيون', 0, 91)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (287, N'1_sound_5television', N'تلفزيون', 0, 91)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (288, N'1_sound_2vacume', N'مكنسة ', 0, 92)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (289, N'1_sound_3vacume', N'مكنسة ', 0, 92)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (290, N'1_sound_1vacume', N'مكنسة ', 0, 92)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (291, N'1_sound_5vacume', N'مكنسة ', 0, 92)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (292, N'1_sound_2wash machine', N'غسالة ', 0, 93)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (293, N'1_sound_3wash machine', N'غسالة ', 0, 93)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (294, N'1_sound_1wash machine', N'غسالة ', 0, 93)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (295, N'1_sound_5wash machine', N'غسالة ', 0, 93)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (296, N'1_sound_2fork', N'شوكة', 0, 94)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (297, N'1_sound_3fork', N'شوكة', 0, 94)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (298, N'1_sound_1fork', N'شوكة', 0, 94)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (299, N'1_sound_5fork', N'شوكة', 0, 94)
GO
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (300, N'1_sound_2glass', N'كاسة', 0, 95)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (301, N'1_sound_3glass', N'كاسة', 0, 95)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (302, N'1_sound_1glass', N'كاسة', 0, 95)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (303, N'1_sound_5glass', N'كاسة', 0, 95)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (304, N'1_sound_2knife', N'سكين', 0, 96)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (305, N'1_sound_3knife', N'سكين', 0, 96)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (306, N'1_sound_1knife', N'سكين', 0, 96)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (307, N'1_sound_5knife', N'سكين', 0, 96)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (308, N'1_sound_2plate', N'صحن', 0, 97)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (309, N'1_sound_3plate', N'صحن', 0, 97)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (310, N'1_sound_1plate', N'صحن', 0, 97)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (311, N'1_sound_5plate', N'صحن', 0, 97)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (312, N'1_sound_2spoon', N'ملعقه ', 0, 98)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (313, N'1_sound_3spoon', N'ملعقه ', 0, 98)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (314, N'1_sound_1spoon', N'ملعقه ', 0, 98)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (315, N'1_sound_5spoon', N'ملعقه ', 0, 98)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (316, N'1_sound_2ear', N'أذن', 0, 99)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (317, N'1_sound_3ear', N'أذن', 0, 99)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (318, N'1_sound_3eye', N'عين', 0, 101)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (319, N'1_sound_3eye', N'عين', 0, 101)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (320, N'1_sound_2mouth', N'فم', 0, 102)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (321, N'1_sound_3mouth', N'فم', 0, 102)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (322, N'1_sound_2nose', N'أنف', 0, 103)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (323, N'1_sound_3nose', N'أنف', 0, 103)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (324, N'1_sound_2tongue', N'لسان', 0, 104)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (325, N'1_sound_3tongue', N'لسان', 0, 104)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (326, N'1_sound_2cheek', N'خد', 0, 105)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (327, N'1_sound_3cheek', N'خد', 0, 105)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (328, N'1_sound_2face', N'وجه', 0, 106)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (329, N'1_sound_3face', N'وجه', 0, 106)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (330, N'1_sound_2hair', N'شعر', 0, 107)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (331, N'1_sound_3hair', N'شعر', 0, 107)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (332, N'1_sound_2mustache', N'شوارب', 0, 108)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (333, N'1_sound_3mustache', N'شوارب', 0, 108)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (334, N'1_sound_2tooth', N'سن', 0, 109)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (335, N'1_sound_3tooth', N'سن', 0, 109)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (336, N'1_sound_3back', N'ظهر', 0, 110)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (337, N'1_sound_2finger', N'إصبع', 0, 111)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (338, N'1_sound_3finger', N'إصبع', 0, 111)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (339, N'1_sound_2hand', N'يد', 0, 112)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (340, N'1_sound_3hand', N'يد', 0, 112)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (341, N'1_sound_2leg', N'رجل', 0, 113)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (342, N'1_sound_3leg', N'رجل', 0, 113)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (343, N'1_sound_2stomach', N'بطن', 0, 114)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (344, N'1_sound_3stomach', N'بطن', 0, 114)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (345, N'1_sound_2bird', N'عصفور', 0, 115)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (346, N'1_sound_3bird', N'عصفور', 0, 115)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (347, N'1_sound_2cat', N'بسة', 0, 116)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (348, N'1_sound_3cat', N'بسة', 0, 116)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (349, N'1_sound_2dog', N'كلب', 0, 117)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (350, N'1_sound_3dog', N'كلب', 0, 117)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (351, N'1_sound_2horse', N'حصان', 0, 118)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (352, N'1_sound_3horse', N'حصان', 0, 118)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (353, N'1_sound_2snake', N'حية', 0, 119)
INSERT [dbo].[Sound] ([Id], [Name], [DisplayName], [IsAlphabeticIndexed], [GroupId]) VALUES (354, N'1_sound_3snake', N'حية', 0, 119)
SET IDENTITY_INSERT [dbo].[Sound] OFF
SET IDENTITY_INSERT [dbo].[SoundImages] ON 

INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (44, 1, 1)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (45, 2, 2)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (46, 3, 3)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (47, 4, 4)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (48, 5, 5)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (49, 6, 6)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (50, 7, 7)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (51, 8, 8)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (52, 9, 9)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (53, 10, 10)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (54, 11, 11)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (55, 12, 12)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (56, 13, 13)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (57, 14, 14)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (58, 15, 15)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (59, 16, 16)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (60, 17, 17)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (61, 18, 18)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (62, 19, 19)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (63, 20, 20)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (64, 21, 22)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (65, 22, 23)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (66, 23, 24)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (67, 24, 25)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (68, 25, 26)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (69, 26, 27)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (70, 27, 28)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (71, 28, 29)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (72, 29, 30)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (73, 30, 31)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (74, 31, 32)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (75, 32, 33)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (76, 33, 34)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (77, 34, 35)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (78, 35, 36)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (79, 36, 37)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (80, 37, 38)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (81, 38, 39)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (82, 39, 40)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (83, 40, 41)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (84, 41, 42)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (85, 42, 43)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (86, 43, 44)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (87, 44, 45)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (88, 45, 46)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (89, 46, 47)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (90, 47, 48)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (91, 48, 49)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (92, 49, 50)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (93, 50, 51)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (94, 51, 52)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (95, 52, 53)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (96, 53, 54)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (97, 54, 55)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (98, 55, 57)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (99, 56, 58)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (100, 57, 59)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (101, 58, 60)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (102, 59, 61)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (103, 60, 62)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (104, 61, 63)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (105, 62, 64)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (106, 63, 65)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (107, 64, 66)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (108, 65, 67)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (109, 66, 68)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (110, 67, 69)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (111, 68, 70)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (112, 69, 71)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (113, 70, 72)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (114, 71, 73)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (115, 72, 74)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (116, 73, 75)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (117, 74, 76)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (118, 75, 77)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (119, 76, 78)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (120, 77, 79)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (121, 78, 80)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (122, 79, 81)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (123, 80, 82)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (124, 81, 83)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (125, 82, 84)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (126, 83, 85)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (127, 84, 86)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (128, 85, 87)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (129, 86, 88)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (130, 87, 89)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (131, 88, 90)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (132, 89, 91)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (133, 90, 92)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (134, 91, 93)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (135, 92, 94)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (136, 93, 95)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (137, 94, 96)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (138, 95, 97)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (139, 96, 98)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (140, 97, 99)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (141, 98, 100)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (142, 99, 101)
GO
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (143, 100, 102)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (144, 101, 103)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (145, 102, 104)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (146, 103, 105)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (147, 104, 106)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (148, 105, 107)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (149, 106, 108)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (150, 107, 109)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (151, 108, 110)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (152, 109, 111)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (153, 110, 112)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (154, 111, 113)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (155, 112, 113)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (156, 113, 115)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (157, 114, 116)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (158, 115, 117)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (159, 116, 118)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (160, 117, 119)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (161, 118, 120)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (162, 119, 121)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (163, 120, 122)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (164, 121, 123)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (165, 122, 124)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (166, 123, 125)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (167, 124, 126)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (168, 125, 127)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (169, 126, 128)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (170, 127, 129)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (171, 128, 130)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (172, 129, 131)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (173, 130, 132)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (174, 131, 133)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (175, 132, 134)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (176, 133, 135)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (177, 134, 136)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (178, 135, 137)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (179, 136, 138)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (180, 137, 139)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (181, 138, 140)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (182, 139, 141)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (183, 140, 142)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (184, 141, 143)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (185, 142, 144)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (186, 143, 145)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (187, 144, 146)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (188, 145, 147)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (189, 146, 148)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (190, 147, 149)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (191, 148, 150)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (192, 149, 151)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (193, 150, 152)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (194, 151, 153)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (195, 152, 154)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (196, 153, 155)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (197, 154, 156)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (198, 155, 157)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (199, 156, 158)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (200, 157, 159)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (201, 158, 160)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (202, 159, 161)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (203, 160, 162)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (204, 161, 163)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (205, 162, 164)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (206, 163, 165)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (207, 164, 166)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (208, 165, 167)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (209, 166, 168)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (210, 167, 169)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (211, 168, 170)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (212, 169, 171)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (213, 170, 172)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (214, 171, 173)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (215, 172, 174)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (216, 173, 175)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (217, 174, 176)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (218, 175, 178)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (219, 176, 178)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (220, 177, 179)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (221, 178, 180)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (222, 179, 181)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (223, 180, 182)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (224, 181, 183)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (225, 182, 183)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (226, 183, 184)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (227, 184, 185)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (228, 185, 186)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (229, 186, 188)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (230, 187, 188)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (231, 188, 189)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (232, 189, 190)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (233, 190, 192)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (234, 191, 192)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (235, 192, 193)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (236, 193, 194)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (237, 194, 195)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (238, 195, 196)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (239, 196, 197)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (240, 197, 198)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (241, 198, 199)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (242, 199, 200)
GO
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (243, 200, 201)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (244, 201, 202)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (245, 202, 203)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (246, 203, 204)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (247, 204, 205)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (248, 205, 205)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (249, 206, 206)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (250, 207, 208)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (251, 208, 209)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (252, 209, 210)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (253, 210, 211)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (254, 211, 212)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (255, 212, 213)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (256, 213, 214)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (257, 214, 215)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (258, 215, 216)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (259, 216, 217)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (260, 217, 218)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (261, 218, 219)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (262, 219, 220)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (263, 220, 221)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (264, 221, 222)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (265, 222, 223)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (266, 223, 224)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (267, 224, 225)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (268, 225, 226)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (269, 226, 227)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (270, 227, 228)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (271, 228, 229)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (272, 229, 230)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (273, 230, 231)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (274, 231, 232)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (275, 232, 233)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (276, 233, 234)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (277, 234, 235)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (278, 235, 236)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (279, 236, 237)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (280, 237, 238)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (281, 238, 239)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (282, 239, 240)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (283, 240, 241)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (284, 241, 242)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (285, 242, 243)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (286, 243, 244)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (287, 244, 245)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (288, 245, 246)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (289, 246, 247)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (290, 247, 248)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (291, 248, 249)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (292, 249, 250)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (293, 250, 251)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (294, 251, 252)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (295, 252, 253)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (296, 253, 254)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (297, 254, 255)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (298, 255, 256)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (299, 256, 257)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (300, 257, 258)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (301, 258, 259)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (302, 259, 260)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (303, 260, 261)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (304, 261, 262)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (305, 262, 263)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (306, 263, 264)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (307, 264, 265)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (308, 265, 266)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (309, 266, 267)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (310, 267, 268)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (311, 268, 269)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (312, 269, 270)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (313, 270, 271)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (314, 271, 272)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (315, 272, 273)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (316, 273, 274)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (317, 274, 275)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (318, 275, 276)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (319, 276, 277)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (320, 277, 278)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (321, 278, 279)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (322, 279, 280)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (323, 280, 281)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (324, 281, 282)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (325, 282, 283)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (326, 283, 284)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (327, 284, 285)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (328, 285, 286)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (329, 286, 287)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (330, 287, 288)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (331, 288, 289)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (332, 289, 290)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (333, 290, 291)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (334, 291, 292)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (335, 292, 293)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (336, 293, 294)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (337, 294, 295)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (338, 295, 296)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (339, 296, 297)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (340, 297, 298)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (341, 298, 299)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (342, 299, 300)
GO
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (343, 300, 301)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (344, 301, 302)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (345, 302, 303)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (346, 303, 304)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (347, 304, 305)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (348, 305, 306)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (349, 306, 307)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (350, 307, 308)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (351, 308, 309)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (352, 309, 310)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (353, 310, 311)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (354, 311, 312)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (355, 312, 313)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (356, 313, 314)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (357, 314, 315)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (358, 315, 316)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (359, 316, 317)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (360, 317, 318)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (361, 318, 319)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (362, 319, 320)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (363, 320, 321)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (364, 321, 322)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (365, 322, 323)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (366, 323, 324)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (367, 324, 325)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (368, 325, 326)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (369, 326, 327)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (370, 327, 328)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (371, 328, 329)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (372, 329, 330)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (373, 330, 331)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (374, 331, 332)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (375, 332, 333)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (376, 333, 334)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (377, 334, 335)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (378, 335, 336)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (379, 336, 338)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (380, 337, 339)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (381, 338, 340)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (382, 339, 341)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (383, 340, 342)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (384, 341, 343)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (385, 342, 344)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (386, 343, 345)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (387, 344, 346)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (388, 345, 347)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (389, 346, 348)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (390, 347, 349)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (391, 348, 350)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (392, 349, 351)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (393, 350, 352)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (394, 351, 353)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (395, 352, 354)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (396, 353, 355)
INSERT [dbo].[SoundImages] ([Id], [SoundId], [ImageId]) VALUES (397, 354, 356)
SET IDENTITY_INSERT [dbo].[SoundImages] OFF
INSERT [dbo].[UserCompletedSessions] ([UserId], [SessionId], [UserTestId], [CreatedDate]) VALUES (2, 6, 47, CAST(N'2018-04-29 23:52:52.873' AS DateTime))
INSERT [dbo].[UserCompletedSessions] ([UserId], [SessionId], [UserTestId], [CreatedDate]) VALUES (2, 8, 48, CAST(N'2018-04-30 00:37:25.503' AS DateTime))
INSERT [dbo].[UserCompletedSessions] ([UserId], [SessionId], [UserTestId], [CreatedDate]) VALUES (2, 17, 49, CAST(N'2018-04-30 00:39:09.357' AS DateTime))
INSERT [dbo].[UserCompletedSessions] ([UserId], [SessionId], [UserTestId], [CreatedDate]) VALUES (2, 12, 51, CAST(N'2018-04-29 13:04:01.443' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [Username]) VALUES (1, N'admin', N'account', 0x30784136453444443834443242413132443744363139333833463630433745303632384330323136434646383839413235434631344333443930393635303633344237463432393931324143383341323446343043463937343939393234383945444535393237334336443234323232433544323546454236444539323236334132, 0x307834303746384544393136443430383338383730343338453941314146383742384131374632444232354434373539464141414132343736444144463344353635463545383746394630354335343632424441414230324341353234373041313946413644343439454431323932463434313537353333463143383035314438373545414231444633463034434532304238423541463537443532334131334434394632374238323232363744434246334142344439363946383036314537413739304536464330343043313743384231303735343142353846303639444441433442364638383335463337453833443730374645434638463130324244444233, N'admin')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [Username]) VALUES (2, N'razan', N'razan', 0xD2DC6114550E6D2AA060F610D1CBC4CAC4529B298EFF0FEA6D8E33A5F5D9F71E4D0D3FC76990DF39312FBDA1C632C074AA398381B29E31925AD712B92C10CFF1, 0xFD85022BA99E8FACC2B3A60CB530C47779DD15494F7907C9A28EE806C5B5AB4D3BEAF6392120E43C3BAD26E3C3685875071B7043E3A2468E89A4F634116AF2E89F7896DAF35CD78F0F297AD27D3AF92A41A37D1CDED753001DEB8211EB622AFA39B57B9F460671AF96C81A800DF9256B766BEF3BD27A065651026BA14D6C56E6, N'razan')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [Username]) VALUES (3, N'adib', N'adib', 0x0092C910A66D98B2B6E52105C4D1D1B47A4E31D252C0F0107054F276DE71EBB0C6872D606437276BDF00D530C94D18B4362F1735D1014F8871147F79D37574EA, 0xC30FF9263AF162841C11253197AC2C35411BA15988BB40EEC0421E2BDC92BE839C2078649AF52DBD4EDB907FBC67CE480EBB1AEED928CBA5B7905A08F8EFB4705A5E6F7E6B15B5087665F097597C43E038CC997AF9671531DC6BCFA6A66E0F0C3DE210E9E352CF2D659C6C0638BAAF94EEF35550743DCFF2ECFE7E1E6306C44F, N'adib')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTest] ON 

INSERT [dbo].[UserTest] ([Id], [UserId], [SessionId], [Score], [CreatedDate]) VALUES (47, 2, 6, CAST(60 AS Decimal(18, 0)), CAST(N'2018-04-29 23:52:52.633' AS DateTime))
INSERT [dbo].[UserTest] ([Id], [UserId], [SessionId], [Score], [CreatedDate]) VALUES (48, 2, 8, CAST(60 AS Decimal(18, 0)), CAST(N'2018-04-30 00:37:25.287' AS DateTime))
INSERT [dbo].[UserTest] ([Id], [UserId], [SessionId], [Score], [CreatedDate]) VALUES (49, 2, 17, CAST(80 AS Decimal(18, 0)), CAST(N'2018-04-30 00:39:09.207' AS DateTime))
INSERT [dbo].[UserTest] ([Id], [UserId], [SessionId], [Score], [CreatedDate]) VALUES (50, 2, 17, CAST(20 AS Decimal(18, 0)), CAST(N'2018-04-30 00:41:15.500' AS DateTime))
INSERT [dbo].[UserTest] ([Id], [UserId], [SessionId], [Score], [CreatedDate]) VALUES (51, 2, 12, CAST(60 AS Decimal(18, 0)), CAST(N'2018-04-29 13:04:01.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserTest] OFF
SET IDENTITY_INSERT [dbo].[UserTestSounds] ON 

INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (187, 47, 324, 325, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (188, 47, 320, 321, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (189, 47, 322, 323, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (190, 47, 316, 323, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (191, 47, 318, 325, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (192, 48, 336, 338, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (193, 48, 337, 339, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (194, 48, 343, 339, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (195, 48, 339, 341, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (196, 48, 341, 338, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (197, 49, 139, 141, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (198, 49, 147, 149, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (199, 49, 145, 147, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (200, 49, 157, 159, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (201, 49, 153, 145, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (202, 50, 147, 141, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (203, 50, 155, 141, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (204, 50, 141, 149, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (205, 50, 153, 141, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (206, 50, 145, 147, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (207, 51, 61, 63, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (208, 51, 59, 51, 0)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (209, 51, 50, 51, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (210, 51, 55, 57, 1)
INSERT [dbo].[UserTestSounds] ([Id], [UserTestId], [SoundId], [SelectedImageId], [IsCorrect]) VALUES (211, 51, 53, 57, 0)
SET IDENTITY_INSERT [dbo].[UserTestSounds] OFF
/****** Object:  Index [IX_UserCompletedModules]    Script Date: 02/05/2018 13:57:02 ******/
ALTER TABLE [dbo].[UserCompletedModules] ADD  CONSTRAINT [IX_UserCompletedModules] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserCompletedModules] ADD  CONSTRAINT [DF_UserCompletedModules_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_Module] FOREIGN KEY([PrerequisiteModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Module_Module]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Module] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Module]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Session] FOREIGN KEY([Id])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Session]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Session1] FOREIGN KEY([PrerequisiteSessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Session1]
GO
ALTER TABLE [dbo].[SessionsSounds]  WITH CHECK ADD  CONSTRAINT [FK_SessionsSounds_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[SessionsSounds] CHECK CONSTRAINT [FK_SessionsSounds_Session]
GO
ALTER TABLE [dbo].[SessionsSounds]  WITH CHECK ADD  CONSTRAINT [FK_SessionsSounds_Sound] FOREIGN KEY([SoundId])
REFERENCES [dbo].[Sound] ([Id])
GO
ALTER TABLE [dbo].[SessionsSounds] CHECK CONSTRAINT [FK_SessionsSounds_Sound]
GO
ALTER TABLE [dbo].[SoundImages]  WITH CHECK ADD  CONSTRAINT [FK_SoundImages_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[SoundImages] CHECK CONSTRAINT [FK_SoundImages_Image]
GO
ALTER TABLE [dbo].[SoundImages]  WITH CHECK ADD  CONSTRAINT [FK_SoundImages_Sound] FOREIGN KEY([SoundId])
REFERENCES [dbo].[Sound] ([Id])
GO
ALTER TABLE [dbo].[SoundImages] CHECK CONSTRAINT [FK_SoundImages_Sound]
GO
ALTER TABLE [dbo].[UserCompletedModules]  WITH CHECK ADD  CONSTRAINT [FK_UserCompletedModules_Module] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[UserCompletedModules] CHECK CONSTRAINT [FK_UserCompletedModules_Module]
GO
ALTER TABLE [dbo].[UserCompletedModules]  WITH CHECK ADD  CONSTRAINT [FK_UserCompletedModules_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserCompletedModules] CHECK CONSTRAINT [FK_UserCompletedModules_Users]
GO
ALTER TABLE [dbo].[UserCompletedSessions]  WITH CHECK ADD  CONSTRAINT [FK_UserCompletedSessions_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[UserCompletedSessions] CHECK CONSTRAINT [FK_UserCompletedSessions_Session]
GO
ALTER TABLE [dbo].[UserCompletedSessions]  WITH CHECK ADD  CONSTRAINT [FK_UserCompletedSessions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserCompletedSessions] CHECK CONSTRAINT [FK_UserCompletedSessions_Users]
GO
ALTER TABLE [dbo].[UserCompletedSessions]  WITH CHECK ADD  CONSTRAINT [FK_UserCompletedSessions_UserTest] FOREIGN KEY([UserTestId])
REFERENCES [dbo].[UserTest] ([Id])
GO
ALTER TABLE [dbo].[UserCompletedSessions] CHECK CONSTRAINT [FK_UserCompletedSessions_UserTest]
GO
ALTER TABLE [dbo].[UserTest]  WITH CHECK ADD  CONSTRAINT [FK_UserTest_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([Id])
GO
ALTER TABLE [dbo].[UserTest] CHECK CONSTRAINT [FK_UserTest_Session]
GO
ALTER TABLE [dbo].[UserTest]  WITH CHECK ADD  CONSTRAINT [FK_UserTest_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserTest] CHECK CONSTRAINT [FK_UserTest_Users]
GO
ALTER TABLE [dbo].[UserTestSounds]  WITH CHECK ADD  CONSTRAINT [FK_TestSounds_Image] FOREIGN KEY([SelectedImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[UserTestSounds] CHECK CONSTRAINT [FK_TestSounds_Image]
GO
ALTER TABLE [dbo].[UserTestSounds]  WITH CHECK ADD  CONSTRAINT [FK_TestSounds_Sound] FOREIGN KEY([SoundId])
REFERENCES [dbo].[Sound] ([Id])
GO
ALTER TABLE [dbo].[UserTestSounds] CHECK CONSTRAINT [FK_TestSounds_Sound]
GO
ALTER TABLE [dbo].[UserTestSounds]  WITH CHECK ADD  CONSTRAINT [FK_TestSounds_UserTest] FOREIGN KEY([UserTestId])
REFERENCES [dbo].[UserTest] ([Id])
GO
ALTER TABLE [dbo].[UserTestSounds] CHECK CONSTRAINT [FK_TestSounds_UserTest]
GO
/****** Object:  StoredProcedure [dbo].[images_GetBySessionId]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[images_GetBySessionId]
	@sessionId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select DISTINCT 
		Image.*
	from SoundImages
		inner join SessionsSounds on SoundImages.SoundId = SessionsSounds.SoundId
		inner join Image on SoundImages.ImageId = image.Id
	where SessionsSounds.SessionId = @sessionId
END
GO
/****** Object:  StoredProcedure [dbo].[images_GetBySessionIdAndSoundId]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[images_GetBySessionIdAndSoundId]
	-- Add the parameters for the stored procedure here
	@sessionId int,
	@soundId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select 
	image.*
 from SoundImages
inner join Image on Image.Id =SoundImages.ImageId
inner join SessionsSounds on SessionsSounds.SoundId = SoundImages.SoundId
where SoundImages.SoundId = @soundId and SessionsSounds.SessionId = @sessionId

END
GO
/****** Object:  StoredProcedure [dbo].[images_GetBySoundId]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[images_GetBySoundId]
	-- Add the parameters for the stored procedure here
	@soundId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select 
	Image.Id
	,Image.Name
 from SoundImages
inner join Image on Image.Id =SoundImages.ImageId
where SoundImages.SoundId = @soundId

END
GO
/****** Object:  StoredProcedure [dbo].[sounds_GetBySessionId]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sounds_GetBySessionId]
	-- Add the parameters for the stored procedure here
	@sessionId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  select 
	 Sound.Id 
	, Sound.Name 
	, Sound.DisplayName
	, Sound.GroupId
   from SessionsSounds
  inner join Sound on SessionsSounds.SoundId = Sound.Id
where SessionsSounds.SessionId = @sessionId
order by GroupId, Sound.Id ASC
END
GO
/****** Object:  StoredProcedure [dbo].[UserCompletedModules_insert]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserCompletedModules_insert]
	@userId int,
	@moduleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[UserCompletedModules]
           ([UserId]
           ,[ModuleId]
           ,[CreatedDate])
     VALUES
           (@userId, @moduleId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[UserCompletedSessions_insert]    Script Date: 02/05/2018 13:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserCompletedSessions_insert]
	@userId int,
	@sessionId int,
	@userTestId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[UserCompletedSessions]
           ([UserId]
           ,SessionId
           ,UserTestId
		   ,CreatedDate)
     VALUES
           (@userId, @sessionId, @userTestId, GETDATE())
END
GO
USE [master]
GO
ALTER DATABASE [STSDb] SET  READ_WRITE 
GO
