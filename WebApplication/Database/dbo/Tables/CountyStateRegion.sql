CREATE TABLE [dbo].[CountyStateRegion] (
    [Id]        BIGINT         NOT NULL,
    [CountryId] BIGINT         NOT NULL,
    [Name]      NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_CountyStateRegion] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CountryStateRegion_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);

