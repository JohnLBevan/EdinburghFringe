create procedure sp_GetSinglePerformerMemberById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 GroupPerformerId, Id, MemberPerformerId
	from PerformerMember
	where Id = @Id
	option (fast 1)
end