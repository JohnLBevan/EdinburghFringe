CREATE TABLE [dbo].[PerformerSupplementaryInfo] (
    [Id]                  BIGINT NOT NULL,
    [PerformerId]         BIGINT NOT NULL,
    [SupplementaryInfoId] BIGINT NOT NULL,
    CONSTRAINT [PK_PerformerSupplementaryInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerformerSupplementaryInfo_PerformerId] FOREIGN KEY ([PerformerId]) REFERENCES [dbo].[Performer] ([Id]),
    CONSTRAINT [FK_PerformerSupplementaryInfo_SupplementaryInfoId] FOREIGN KEY ([SupplementaryInfoId]) REFERENCES [dbo].[SupplementaryInfo] ([Id])
);

