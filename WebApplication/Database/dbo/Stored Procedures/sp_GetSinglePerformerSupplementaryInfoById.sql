create procedure sp_GetSinglePerformerSupplementaryInfoById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, PerformerId, SupplementaryInfoId
	from PerformerSupplementaryInfo
	where Id = @Id
	option (fast 1)
end