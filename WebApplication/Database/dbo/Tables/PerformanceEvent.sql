CREATE TABLE [dbo].[PerformanceEvent] (
    [Id]            BIGINT   NOT NULL,
    [PerformanceId] BIGINT   NOT NULL,
    [VenueId]       BIGINT   NOT NULL,
    [EventDate]     DATE     NOT NULL,
    [StartTime]     DATETIME NOT NULL,
    [EndTime]       DATETIME NOT NULL,
    CONSTRAINT [PK_PerformanceEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerformanceEvent_PerformanceId] FOREIGN KEY ([PerformanceId]) REFERENCES [dbo].[Performance] ([Id]),
    CONSTRAINT [FK_PerformanceEvent_VenueId] FOREIGN KEY ([VenueId]) REFERENCES [dbo].[Venue] ([Id])
);

