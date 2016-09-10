CREATE TABLE [dbo].[PerformanceEventSupplementaryInfo] (
    [Id]                  BIGINT NOT NULL,
    [PerformanceEventId]  BIGINT NOT NULL,
    [SupplementaryInfoId] BIGINT NOT NULL,
    CONSTRAINT [PK_PerformanceEventSupplementaryInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerformanceEventSupplementaryInfo_PerformanceEventId] FOREIGN KEY ([PerformanceEventId]) REFERENCES [dbo].[PerformanceEvent] ([Id]),
    CONSTRAINT [FK_PerformanceEventSupplementaryInfo_SupplementaryInfoId] FOREIGN KEY ([SupplementaryInfoId]) REFERENCES [dbo].[SupplementaryInfo] ([Id])
);

