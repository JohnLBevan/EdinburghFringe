create procedure sp_GetSingleCountyStateRegionById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 CountryId, Id, Name
	from CountyStateRegion
	where Id = @Id
	option (fast 1)
end