CREATE TABLE [dbo].[Country] (
    [Id]   BIGINT         NOT NULL,
    [Name] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UK_Country_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);

