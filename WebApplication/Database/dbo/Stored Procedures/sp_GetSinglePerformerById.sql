create procedure sp_GetSinglePerformerById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, Name, UniqueName
	from Performer
	where Id = @Id
	option (fast 1)
end