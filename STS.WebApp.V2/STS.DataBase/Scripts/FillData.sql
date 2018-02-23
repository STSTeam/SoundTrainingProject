SET IDENTITY_INSERT [dbo].[Module] ON 

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
INSERT [dbo].[Session] ([Id], [ModuleId], [Title]) VALUES (2, 2, N'session 2')
GO
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
