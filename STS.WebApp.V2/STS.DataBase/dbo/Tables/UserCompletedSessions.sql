CREATE TABLE [dbo].[UserCompletedSessions] (
    [UserId]      INT      NOT NULL,
    [SessionId]   INT      NOT NULL,
    [UserTestId]  INT      NOT NULL,
    [CreatedDate] DATETIME CONSTRAINT [DF_UserCompletedSessions_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [FK_UserCompletedSessions_Session] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[Session] ([Id]),
    CONSTRAINT [FK_UserCompletedSessions_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UserCompletedSessions_UserTest] FOREIGN KEY ([UserTestId]) REFERENCES [dbo].[UserTest] ([Id])
);

