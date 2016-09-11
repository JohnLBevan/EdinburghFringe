create procedure sp_GetSinglePerformanceEventSupplementaryInfoById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, PerformanceEventId, SupplementaryInfoId
	from PerformanceEventSupplementaryInfo
	where Id = @Id
	option (fast 1)
end