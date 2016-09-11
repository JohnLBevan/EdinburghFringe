create procedure sp_GetSingleSupplementaryInfoById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, SupplementaryInfoTypeId, Value
	from SupplementaryInfo
	where Id = @Id
	option (fast 1)
end