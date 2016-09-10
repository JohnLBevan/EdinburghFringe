CREATE TABLE [dbo].[PerformerMember] (
    [Id]                BIGINT NOT NULL,
    [GroupPerformerId]  BIGINT NOT NULL,
    [MemberPerformerId] BIGINT NOT NULL,
    CONSTRAINT [PK_PerformerMember] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PerformerMember_GroupPerformerId] FOREIGN KEY ([GroupPerformerId]) REFERENCES [dbo].[Performer] ([Id]),
    CONSTRAINT [FK_PerformerMember_MemberPerformerId] FOREIGN KEY ([MemberPerformerId]) REFERENCES [dbo].[Performer] ([Id])
);

