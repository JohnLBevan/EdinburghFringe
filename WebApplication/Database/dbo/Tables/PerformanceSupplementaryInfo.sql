CREATE TABLE [dbo].[PerformanceSupplementaryInfo] (
    [Id]                  BIGINT NOT NULL,
    [PerformanceId]       BIGINT NOT NULL,
    [SupplementaryInfoId] BIGINT NOT NULL,
    CONSTRAINT [PK_PerformanceSupplementaryInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerformanceSupplementaryInfo_PerformanceId] FOREIGN KEY ([PerformanceId]) REFERENCES [dbo].[Performance] ([Id]),
    CONSTRAINT [FK_PerformanceSupplementaryInfo_SupplementaryInfoId] FOREIGN KEY ([SupplementaryInfoId]) REFERENCES [dbo].[SupplementaryInfo] ([Id])
);

