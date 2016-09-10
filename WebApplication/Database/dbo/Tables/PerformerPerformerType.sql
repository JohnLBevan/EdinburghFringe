CREATE TABLE [dbo].[PerformerPerformerType] (
    [Id]              BIGINT NOT NULL,
    [PerformerId]     BIGINT NOT NULL,
    [PerformerTypeId] BIGINT NOT NULL,
    CONSTRAINT [PK_PerformerPerformerType] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerformerPerformerType_PerformerId] FOREIGN KEY ([PerformerId]) REFERENCES [dbo].[Performer] ([Id]),
    CONSTRAINT [FK_PerformerPerformerType_PerformerTypeId] FOREIGN KEY ([PerformerTypeId]) REFERENCES [dbo].[PerformerType] ([Id])
);

