CREATE TABLE [dbo].[UserTest] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [UserId]      INT          NOT NULL,
    [ModuleId]    INT          NOT NULL,
    [SessionId]   INT          NOT NULL,
    [Score]       DECIMAL (18) NULL,
    [IsPassed]    BIT          NOT NULL,
    [CreatedDate] DATETIME     CONSTRAINT [DF_UserTest_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_UserTest] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserTest_Module] FOREIGN KEY ([ModuleId]) REFERENCES [dbo].[Module] ([Id]),
    CONSTRAINT [FK_UserTest_Session] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[Session] ([Id]),
    CONSTRAINT [FK_UserTest_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);



