create procedure sp_GetSinglePerformerPerformerTypeById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, PerformerId, PerformerTypeId
	from PerformerPerformerType
	where Id = @Id
	option (fast 1)
end