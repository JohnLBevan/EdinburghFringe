CREATE TABLE [dbo].[SupplementaryInfo] (
    [Id]                      BIGINT         NOT NULL,
    [SupplementaryInfoTypeId] BIGINT         NOT NULL,
    [Value]                   NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_SupplementaryInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SupplementaryInfo_SupplementaryInfoTypeId] FOREIGN KEY ([SupplementaryInfoTypeId]) REFERENCES [dbo].[SupplementaryInfoType] ([Id])
);

