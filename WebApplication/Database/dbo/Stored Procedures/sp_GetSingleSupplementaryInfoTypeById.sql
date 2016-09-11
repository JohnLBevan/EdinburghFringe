create procedure sp_GetSingleSupplementaryInfoTypeById (@Id as bigint) 
as
begin
	set nocount on
	select top 1 Id, Name, UnicodeChar
	from SupplementaryInfoType
	where Id = @Id
	option (fast 1)
end