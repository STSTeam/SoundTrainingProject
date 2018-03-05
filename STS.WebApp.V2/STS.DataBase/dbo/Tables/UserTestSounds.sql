CREATE TABLE [dbo].[UserTestSounds] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [UserTestId]      INT NOT NULL,
    [SoundId]         INT NOT NULL,
    [SelectedImageId] INT NOT NULL,
    [IsCorrect]       BIT NOT NULL,
    CONSTRAINT [PK_TestSounds] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TestSounds_Image] FOREIGN KEY ([SelectedImageId]) REFERENCES [dbo].[Image] ([Id]),
    CONSTRAINT [FK_TestSounds_Sound] FOREIGN KEY ([SoundId]) REFERENCES [dbo].[Sound] ([Id]),
    CONSTRAINT [FK_TestSounds_UserTest] FOREIGN KEY ([UserTestId]) REFERENCES [dbo].[UserTest] ([Id])
);

