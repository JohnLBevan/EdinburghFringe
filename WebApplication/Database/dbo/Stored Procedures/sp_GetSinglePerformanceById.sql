create procedure sp_GetSinglePerformanceById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, Name, PerformerId
	from Performance
	where Id = @Id
	option (fast 1)
end