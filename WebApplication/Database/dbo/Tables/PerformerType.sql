CREATE TABLE [dbo].[PerformerType] (
    [Id]   BIGINT         NOT NULL,
    [Name] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_PerformerType] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UK_PerformerType_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);

