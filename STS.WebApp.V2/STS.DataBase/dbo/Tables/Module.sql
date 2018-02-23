CREATE TABLE [dbo].[Module] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Order]       INT            NOT NULL,
    [Title]       NVARCHAR (150) NOT NULL,
    [Descreption] NVARCHAR (250) NULL,
    [ImageName]   NVARCHAR (150) NULL,
    CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED ([Id] ASC)
);

