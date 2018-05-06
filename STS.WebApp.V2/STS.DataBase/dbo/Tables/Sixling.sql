CREATE TABLE [dbo].[Sixling] (
    [Id]          INT            NOT NULL,
    [Title]       NVARCHAR (500) NOT NULL,
    [Descreption] NVARCHAR (500) NULL,
    [SoundName]   NVARCHAR (500) NOT NULL,
    [ImageName]   NVARCHAR (500) NOT NULL,
    CONSTRAINT [PK_Sixling] PRIMARY KEY CLUSTERED ([Id] ASC)
);

