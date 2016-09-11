create procedure sp_GetSinglePerformanceEventById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 EndTime, EventDate, Id, PerformanceId, StartTime, VenueId
	from PerformanceEvent
	where Id = @Id
	option (fast 1)
end