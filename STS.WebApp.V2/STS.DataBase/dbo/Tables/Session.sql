CREATE TABLE [dbo].[Session] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [ModuleId]              INT             NOT NULL,
    [Title]                 NVARCHAR (150)  NOT NULL,
    [Descreption]           NVARCHAR (1000) NULL,
    [Order]                 INT             NULL,
    [ImageName]             NVARCHAR (500)  NULL,
    [PrerequisiteSessionId] INT             NULL,
    [IsLastSession]         BIT             CONSTRAINT [DF_Session_IsLastSession] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Session_Module] FOREIGN KEY ([ModuleId]) REFERENCES [dbo].[Module] ([Id]),
    CONSTRAINT [FK_Session_Session1] FOREIGN KEY ([PrerequisiteSessionId]) REFERENCES [dbo].[Session] ([Id])
);





