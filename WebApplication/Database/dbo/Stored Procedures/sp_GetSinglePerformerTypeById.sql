create procedure sp_GetSinglePerformerTypeById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, Name
	from PerformerType
	where Id = @Id
	option (fast 1)
end