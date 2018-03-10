CREATE TABLE [dbo].[UserCompletedModules] (
    [UserId]      INT      NOT NULL,
    [ModuleId]    INT      NOT NULL,
    [CreatedDate] DATETIME CONSTRAINT [DF_UserCompletedModules_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [FK_UserCompletedModules_Module] FOREIGN KEY ([ModuleId]) REFERENCES [dbo].[Module] ([Id]),
    CONSTRAINT [FK_UserCompletedModules_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [IX_UserCompletedModules] UNIQUE NONCLUSTERED ([UserId] ASC, [ModuleId] ASC)
);

