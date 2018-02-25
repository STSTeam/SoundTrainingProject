﻿SET IDENTITY_INSERT [dbo].[Module] ON 

GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (1, 1, N'Module 1', N'1st module', NULL)
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (2, 2, N'Module 2', N'2nd module', NULL)
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (3, 3, N'Module 3', N'3rd module', NULL)
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (4, 4, N'Module 4', N'4th module', NULL)
GO
SET IDENTITY_INSERT [dbo].[Module] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title]) VALUES (1, 1, N'session 1')
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title]) VALUES (2, 1, N'session 2')
GO
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Sound] ON 

GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (1, 1, N'1_Car_horn')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (2, 1, N'1_Sound_Ambulane')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (3, 1, N'1_Sound_Baby _cry')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (4, 1, N'1_Sound_Bird')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (5, 1, N'1_Sound_Cat')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (6, 1, N'1_Sound_Dog')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (7, 1, N'1_Sound_Door knocking')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (8, 1, N'1_Sound_Foot steps')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (9, 1, N'1_Sound_Horse')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (10, 1, N'1_Sound_Piano')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (11, 1, N'1_Sound_Rain')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (12, 1, N'1_Sound_Ring')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (13, 1, N'1_Sound_Sheep bleating')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (15, 1, N'1_Sound_Snake')
GO
INSERT [dbo].[Sound] ([Id], [SessionId], [Name]) VALUES (16, 1, N'1_Sound_Tap water')
GO
SET IDENTITY_INSERT [dbo].[Sound] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1, N'1_Pic_ambulance')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (2, N'1_Pic_baby')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (3, N'1_Pic_birds')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (4, N'1_Pic_boy')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (5, N'1_Pic_car_horn')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (6, N'1_Pic_cat')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (7, N'1_Pic_dog')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (8, N'1_Pic_door_knock')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (9, N'1_Pic_girl')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (10, N'1_Pic_grandpa')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (11, N'1_Pic_guitar')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (12, N'1_Pic_horse')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (13, N'1_Pic_phone')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (14, N'1_Pic_piano')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (15, N'1_Pic_rain')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (16, N'1_Pic_sheep')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (17, N'1_Pic_snake')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (18, N'1_Pic_steps')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (19, N'1_Pic_vacum')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (20, N'1_Pic_water_tap')
GO
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
