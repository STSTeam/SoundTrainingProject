CREATE TABLE [dbo].[Sound] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [Name]                NVARCHAR (150) NOT NULL,
    [DisplayName]         NVARCHAR (150) NULL,
    [IsAlphabeticIndexed] BIT            NULL,
    [GroupId]             INT            NULL,
    CONSTRAINT [PK_Sound] PRIMARY KEY CLUSTERED ([Id] ASC)
);







