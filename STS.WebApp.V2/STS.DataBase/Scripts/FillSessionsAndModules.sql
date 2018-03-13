SET IDENTITY_INSERT [dbo].[Module] ON 

GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId]) VALUES (1, 1, N'كشف الأصوات', N'هل تسمع الصوت؟', N'1_Pic_1blue', NULL)
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId]) VALUES (2, 2, N'تمييز الأصوات', N'ماهذا الصوت؟', N'1_Pic_2blue', 1)
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId]) VALUES (3, 3, N'كلمات', NULL, N'1_Pic_3blue', 2)
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName], [PrerequisiteModuleId]) VALUES (4, 4, N'جمل', NULL, N'1_Pic_4blue', 3)
GO
SET IDENTITY_INSERT [dbo].[Module] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (1, 2, N'1', NULL, 1, NULL, NULL, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (2, 2, N'2', NULL, 2, NULL, 1, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (3, 2, N'3', NULL, 3, NULL, 2, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (4, 2, N'4', NULL, 4, NULL, 3, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (5, 2, N'1', NULL, 5, NULL, 4, 1)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (6, 3, N'2', NULL, 1, NULL, NULL, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (7, 3, N'3', NULL, 2, NULL, 1, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (8, 3, N'4', NULL, 3, NULL, 2, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (9, 3, N'4', NULL, 4, NULL, 3, 0)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption], [Order], [ImageName], [PrerequisiteSessionId], [IsLastSession]) VALUES (10, 3, N'5', NULL, 5, NULL, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
