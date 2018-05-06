CREATE TABLE [dbo].[SoundImages] (
    [Id]      INT IDENTITY (1, 1) NOT NULL,
    [SoundId] INT NOT NULL,
    [ImageId] INT NOT NULL,
    CONSTRAINT [PK_SoundImages] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SoundImages_Image] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Image] ([Id]),
    CONSTRAINT [FK_SoundImages_Sound] FOREIGN KEY ([SoundId]) REFERENCES [dbo].[Sound] ([Id])
);





