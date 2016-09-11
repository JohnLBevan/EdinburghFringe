create procedure sp_GetSingleLocationById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 AddressLine1, AddressLine2, AddressLine3, AddressLine4, CityId, CountryId, CountyStateRegionId, Id, Latitude, Longitude, ZipCode
	from Location
	where Id = @Id
	option (fast 1)
end