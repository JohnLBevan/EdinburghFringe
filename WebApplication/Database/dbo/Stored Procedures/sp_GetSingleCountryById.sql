create procedure sp_GetSingleCountryById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, Name
	from Country
	where Id = @Id
	option (fast 1)
end