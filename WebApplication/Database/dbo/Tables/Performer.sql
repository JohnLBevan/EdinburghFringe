CREATE TABLE [dbo].[Performer] (
    [Id]         BIGINT         NOT NULL,
    [Name]       NVARCHAR (256) NOT NULL,
    [UniqueName] NVARCHAR (512) NOT NULL,
    CONSTRAINT [PK_Performer] PRIMARY KEY CLUSTERED ([Id] ASC)
);

