create procedure sp_GetSingleVenueSupplementaryInfoById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, SupplementaryInfoId, VenueId
	from VenueSupplementaryInfo
	where Id = @Id
	option (fast 1)
end