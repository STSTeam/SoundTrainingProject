CREATE TABLE [dbo].[SoundImages] (
    [SoundId] INT NOT NULL,
    [ImageId] INT NOT NULL,
    CONSTRAINT [FK_SoundImages_Image] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Image] ([Id]),
    CONSTRAINT [FK_SoundImages_Sound] FOREIGN KEY ([SoundId]) REFERENCES [dbo].[Sound] ([Id])
);



