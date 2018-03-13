CREATE TABLE [dbo].[Module] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [Order]                INT            NOT NULL,
    [Title]                NVARCHAR (150) NOT NULL,
    [Descreption]          NVARCHAR (250) NULL,
    [ImageName]            NVARCHAR (150) NULL,
    [PrerequisiteModuleId] INT            NULL,
    CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Module_Module] FOREIGN KEY ([PrerequisiteModuleId]) REFERENCES [dbo].[Module] ([Id])
);



