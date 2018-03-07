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
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [Username]) VALUES (22, N'admin', N'account', 0x30784136453444443834443242413132443744363139333833463630433745303632384330323136434646383839413235434631344333443930393635303633344237463432393931324143383341323446343043463937343939393234383945444535393237334336443234323232433544323546454236444539323236334132, 0x307834303746384544393136443430383338383730343338453941314146383742384131374632444232354434373539464141414132343736444144463344353635463545383746394630354335343632424441414230324341353234373041313946413644343439454431323932463434313537353333463143383035314438373545414231444633463034434532304238423541463537443532334131334434394632374238323232363744434246334142344439363946383036314537413739304536464330343043313743384231303735343142353846303639444441433442364638383335463337453833443730374645434638463130324244444233, N'admin')
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [Username]) VALUES (1022, N'razan', N'razan', 0xD2DC6114550E6D2AA060F610D1CBC4CAC4529B298EFF0FEA6D8E33A5F5D9F71E4D0D3FC76990DF39312FBDA1C632C074AA398381B29E31925AD712B92C10CFF1, 0xFD85022BA99E8FACC2B3A60CB530C47779DD15494F7907C9A28EE806C5B5AB4D3BEAF6392120E43C3BAD26E3C3685875071B7043E3A2468E89A4F634116AF2E89F7896DAF35CD78F0F297AD27D3AF92A41A37D1CDED753001DEB8211EB622AFA39B57B9F460671AF96C81A800DF9256B766BEF3BD27A065651026BA14D6C56E6, N'razan')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
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
