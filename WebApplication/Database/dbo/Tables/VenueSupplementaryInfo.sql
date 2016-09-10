CREATE TABLE [dbo].[VenueSupplementaryInfo] (
    [Id]                  BIGINT NOT NULL,
    [VenueId]             BIGINT NOT NULL,
    [SupplementaryInfoId] BIGINT NOT NULL,
    CONSTRAINT [PK_VenueSupplementaryInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_VenueSupplementaryInfo_SupplementaryInfoId] FOREIGN KEY ([SupplementaryInfoId]) REFERENCES [dbo].[SupplementaryInfo] ([Id]),
    CONSTRAINT [FK_VenueSupplementaryInfo_VenueId] FOREIGN KEY ([VenueId]) REFERENCES [dbo].[Venue] ([Id])
);

