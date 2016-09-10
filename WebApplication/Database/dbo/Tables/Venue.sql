CREATE TABLE [dbo].[Venue] (
    [Id]          BIGINT         NOT NULL,
    [Name]        NVARCHAR (256) NOT NULL,
    [LocationId]  BIGINT         NOT NULL,
    [UniqueName]  NVARCHAR (512) NOT NULL,
    [IsVenue]     BIT            NOT NULL,
    [IsBoxOffice] BIT            NOT NULL,
    CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Venue_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([Id])
);

