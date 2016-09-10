CREATE TABLE [dbo].[Location] (
    [Id]                  BIGINT         NOT NULL,
    [Longitude]           NUMERIC (8, 2) NULL,
    [Latitude]            NUMERIC (8, 2) NULL,
    [AddressLine1]        NVARCHAR (256) NULL,
    [AddressLine2]        NVARCHAR (256) NULL,
    [AddressLine3]        NVARCHAR (256) NULL,
    [AddressLine4]        NVARCHAR (256) NULL,
    [CityId]              BIGINT         NULL,
    [CountyStateRegionId] BIGINT         NULL,
    [CountryId]           BIGINT         NULL,
    [ZipCode]             NVARCHAR (12)  NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Location_CityId] FOREIGN KEY ([CityId]) REFERENCES [dbo].[City] ([Id]),
    CONSTRAINT [FK_Location_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_Location_CountyStateRegionId] FOREIGN KEY ([CountyStateRegionId]) REFERENCES [dbo].[CountyStateRegion] ([Id])
);

