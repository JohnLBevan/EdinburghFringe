create procedure sp_GetSingleVenueById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, IsBoxOffice, IsVenue, LocationId, Name, UniqueName
	from Venue
	where Id = @Id
	option (fast 1)
end