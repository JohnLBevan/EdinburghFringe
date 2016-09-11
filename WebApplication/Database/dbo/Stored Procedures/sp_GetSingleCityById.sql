create procedure sp_GetSingleCityById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 CountryId, CountyStateRegionId, Id, Name
	from City
	where Id = @Id
	option (fast 1)
end