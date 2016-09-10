CREATE TABLE [dbo].[Performance] (
    [Id]          BIGINT         NOT NULL,
    [PerformerId] BIGINT         NOT NULL,
    [Name]        NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_Performance] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Performance_PerformerId] FOREIGN KEY ([PerformerId]) REFERENCES [dbo].[Performer] ([Id])
);

