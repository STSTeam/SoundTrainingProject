
SET IDENTITY_INSERT [dbo].[Module] ON 

GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (1, 1, N'كشف الأصوات', N'هل تسمع الصوت؟', N'1_Pic_1blue')
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (2, 2, N'تمييز الأصوات', N'ماهذا الصوت؟', N'1_Pic_2blue')
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (3, 3, N'كلمات', NULL, N'1_Pic_3blue')
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (4, 4, N'جمل', NULL, N'1_Pic_4blue')
GO
SET IDENTITY_INSERT [dbo].[Module] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (1, 2, N'1', NULL)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (2, 2, N'2', NULL)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (3, 2, N'3', NULL)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (4, 2, N'4', NULL)
GO
SET IDENTITY_INSERT [dbo].[Session] OFF
