CREATE TABLE [dbo].[City] (
    [Id]                  BIGINT         NOT NULL,
    [CountryId]           BIGINT         NOT NULL,
    [CountyStateRegionId] BIGINT         NULL,
    [Name]                NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_City_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_City_CountyStateRegionId] FOREIGN KEY ([CountyStateRegionId]) REFERENCES [dbo].[CountyStateRegion] ([Id])
);

