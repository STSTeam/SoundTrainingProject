CREATE TABLE [dbo].[Sound] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Sound] PRIMARY KEY CLUSTERED ([Id] ASC)
);



