CREATE TABLE [dbo].[SupplementaryInfoType] (
    [Id]          BIGINT        NOT NULL,
    [Name]        NVARCHAR (64) NOT NULL,
    [UnicodeChar] NCHAR (1)     NULL,
    CONSTRAINT [PK_SupplementaryInfoType] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UK_SupplementaryInfoType_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);

