CREATE TABLE [dbo].[Session] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [ModuleId] INT            NOT NULL,
    [Title]    NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Session_Module] FOREIGN KEY ([ModuleId]) REFERENCES [dbo].[Module] ([Id])
);

