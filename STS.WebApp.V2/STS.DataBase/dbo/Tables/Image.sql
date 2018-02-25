CREATE TABLE [dbo].[Image] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED ([Id] ASC)
);

