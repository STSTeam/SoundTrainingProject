CREATE TABLE [dbo].[SessionsSounds] (
    [SessionId] INT NOT NULL,
    [SoundId]   INT NOT NULL,
    CONSTRAINT [FK_SessionsSounds_Session] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[Session] ([Id]),
    CONSTRAINT [FK_SessionsSounds_Sound] FOREIGN KEY ([SoundId]) REFERENCES [dbo].[Sound] ([Id])
);

