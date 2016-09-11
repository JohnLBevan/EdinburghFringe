create procedure sp_GetSinglePerformanceSupplementaryInfoById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, PerformanceId, SupplementaryInfoId
	from PerformanceSupplementaryInfo
	where Id = @Id
	option (fast 1)
end