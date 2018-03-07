SET IDENTITY_INSERT [dbo].[Image] ON 

GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1, N'1_Pic_Ambulance')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (2, N'1_Pic_Baby')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (3, N'1_Pic_Bird1')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (4, N'1_Pic_Boy')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (5, N'1_Pic_Car_horn')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (6, N'1_Pic_Cat1')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (7, N'1_Pic_Dog1')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (8, N'1_Pic_Door_knock')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (9, N'1_Pic_Girl')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (10, N'1_Pic_Grandpa')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (11, N'1_Pic_Guitar')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (12, N'1_Pic_Horse1')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (13, N'1_Pic_Ringtene')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (14, N'1_Pic_Piano')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (15, N'1_Pic_Rain')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (16, N'1_Pic_Sheep1')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (17, N'1_Pic_Snake1')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (18, N'1_Pic_Steps')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (19, N'1_Pic_Vacum')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (20, N'1_Pic_Water_tap')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1001, N'1_Pic_Back')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1002, N'1_Pic_Bee')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1003, N'1_Pic_Bird2')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1004, N'1_Pic_Cat2')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1005, N'1_Pic_Chicken')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1006, N'1_Pic_Dog2')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1007, N'1_Pic_Ear')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1008, N'1_Pic_Eye')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1009, N'1_Pic_Face')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1010, N'1_Pic_Finger')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1011, N'1_Pic_Fish')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1012, N'1_Pic_Hair')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1013, N'1_Pic_Hand')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1014, N'1_Pic_Horse2')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1015, N'1_Pic_Leg')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1016, N'1_Pic_Lion')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1017, N'1_Pic_Mouth')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1018, N'1_Pic_Nose')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1019, N'1_Pic_Sheep2')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1020, N'1_Pic_Snake2')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1021, N'1_Pic_Stomach')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1022, N'1_Pic_Tongue')
GO
INSERT [dbo].[Image] ([Id], [Name]) VALUES (1023, N'1_Pic_Tooth')
GO
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Sound] ON 

GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (1, N'1_Sound_Ambulane')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (2, N'1_Sound_Baby _cry')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (3, N'1_Sound_Bird')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (4, N'')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (5, N'1_Sound_Car_horn')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (6, N'1_Sound_Cat')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (7, N'1_Sound_Dog')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (8, N'1_Sound_Door_knocking')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (9, N'')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (10, N'')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (11, N'')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (12, N'1_Sound_Horse')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (13, N'1_Sound_Ringtone')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (15, N'1_Sound_Rain')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (16, N'1_Sound_Sheep bleating')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (1001, N'1_Sound_Piano ')
GO
INSERT [dbo].[Sound] ([Id], [Name]) VALUES (1003, N'')
GO
SET IDENTITY_INSERT [dbo].[Sound] OFF
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (1, 1)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (2, 2)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (3, 3)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (4, 4)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (5, 5)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (6, 6)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (7, 7)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (8, 8)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (1, 9)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (1, 10)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (1, 11)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (12, 12)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (13, 13)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (1, 14)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (15, 15)
GO
INSERT [dbo].[SoundImages] ([SoundId], [ImageId]) VALUES (16, 16)
GO
SET IDENTITY_INSERT [dbo].[Module] ON 

GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (1, 1, N'كشف الأصوات', N'هل تسمع الصوت؟', N'1_Pic_1blue')
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (2, 2, N'تمييز الأصوات', N'ماهذا الصوت؟', N'1_Pic_2blue')
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (4, 3, N'كلمات', NULL, N'1_Pic_3blue')
GO
INSERT [dbo].[Module] ([Id], [Order], [Title], [Descreption], [ImageName]) VALUES (1001, 4, N'جمل', NULL, N'1_Pic_4blue')
GO
SET IDENTITY_INSERT [dbo].[Module] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (1, 2, N'1', NULL)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (2, 2, N'2', NULL)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (1002, 2, N'3', NULL)
GO
INSERT [dbo].[Session] ([Id], [ModuleId], [Title], [Descreption]) VALUES (1003, 2, N'4', NULL)
GO
SET IDENTITY_INSERT [dbo].[Session] OFF

GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 1)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 2)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 3)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1, 4)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 5)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 6)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 7)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (2, 8)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1002, 9)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1002, 10)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1002, 11)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1002, 12)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1003, 13)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1003, 1)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1003, 1)
GO
INSERT [dbo].[SessionsSounds] ([SessionId], [SoundId]) VALUES (1003, 3)
GO
