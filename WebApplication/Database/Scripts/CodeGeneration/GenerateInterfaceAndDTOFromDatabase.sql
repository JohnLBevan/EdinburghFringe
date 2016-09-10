
use EdinburghFringe
go

--code to generate c# interfaces & DTOs
--could add an attribute to say these are generated; but they're generated manually so existing attributes don't apply: https://blogs.msdn.microsoft.com/codeanalysis/2007/04/27/correct-usage-of-the-compilergeneratedattribute-and-the-generatedcodeattribute/

--Mapping info https://msdn.microsoft.com/en-us/library/cc716729(v=vs.110).aspx / https://msdn.microsoft.com/en-us/library/cc716729(v=vs.110).aspx
declare @TypeMap table 
(
	sqlname sysname
	, system_type_id int
	, user_type_id int
	, cSharpName nvarchar(128)
)
insert @TypeMap (sqlname, system_type_id, user_type_id, cSharpName)
select t.name, t.system_type_id, t.user_type_id, coalesce(map.c,'/* todo: map to c# equivelant of sql ' + t.name + ' */')
from sys.types t 
left outer join
( 
	values ('bigint', 'long?')
	,('binary', 'byte[]')
	,('bit', 'bool?')
	,('char', 'char?')
	,('date', 'DateOnly?') --custom c# class (Only included to help future proof in case MS ever introduce their own Date)
	,('datetime', 'DateTime?')
	,('datetime2', 'DateTime?')
	,('datetimeoffset', 'DateTimeOffset?')
	,('decimal', 'decimal?')
	,('float', 'double?')
	,('geography', 'SqlGeography') --Microsoft.SqlServer.Types
	,('geometry', 'SqlGeometry')
	,('hierarchyid', 'SqlHierarchyId')
	,('image', 'byte[]')
	,('int', 'int?')
	,('money', 'decimal?')
	,('nchar', 'string')
	,('ntext', 'string')
	,('numeric', 'decimal')
	,('nvarchar', 'string')
	,('real', 'single')
	,('smalldatetime', 'datetime?')
	,('smallint', 'int16?')
	,('smallmoney', 'decimal?')
	,('sql_variant', 'object')
	,('sysname', 'string')
	,('text', 'string')
	,('time', 'TimeSpan')
	,('timestamp', 'byte[]')
	,('tinyint', 'byte?')
	,('uniqueidentifier', 'Guid')
	,('varbinary', 'byte[]')
	,('varchar', 'string')
	,('xml', 'Xml')
) map(s,c)
on map.s = t.name

declare
@cSharpCodeInterface nvarchar(max) = ''
, @cSharpCodeDTO nvarchar(max) = ''
, @cSharpCodeDTOConstructor nvarchar(max) = ''
, @cSharpCodeDTOConstructorParameter nvarchar(max) = ''
, @cSharpCodeDTOConstructorParameterAssignments nvarchar(max) = ''
, @object_id bigint
, @t_name sysname
, @c_name sysname
, @c_nameLCase sysname
, @c_cSharpType nvarchar(128)

declare table_cursor cursor fast_forward for
select t.object_id, t.name
from sys.tables t
where t.type = 'U'
and t.name not like 'Asp%'
and t.name not like '[_]%'

open table_cursor
fetch next from table_cursor into @object_id, @t_name
while @@FETCH_STATUS = 0
begin
	
	select @cSharpCodeInterface = @cSharpCodeInterface + char(10) + 'public interface I' + @t_name + char(10) + '{' + char(10)
	, @cSharpCodeDTO = @cSharpCodeDTO + char(10) + 'public class ' + @t_name + 'DTO: DTOBase, I' + @t_name + char(10) + '{' + char(10)
	, @cSharpCodeDTOConstructor = char(10) + char(9) + 'public ' + @t_name + 'DTO() ' + char(10) + char(9) + '{' + char(10) + char(9) + char(9) + 'IsNew = true;' + char(10)
	, @cSharpCodeDTOConstructorParameter = char(10) + char(9) + 'public ' + @t_name + 'DTO('
	, @cSharpCodeDTOConstructorParameterAssignments = 'bool isNew = false) ' + char(10) + char(9) + '{' + char(10) + char(9) + char(9) + 'IsNew = isNew;' + char(10)

	declare column_cursor cursor fast_forward for
	select c.name, tm.cSharpName
	from sys.columns c
	inner join @TypeMap tm
	on tm.system_type_id = c.system_type_id
	and tm.user_type_id = c.user_type_id
	where c.object_id = @object_id
	order by c.name 

	open column_cursor
	fetch next from column_cursor into @c_name, @c_cSharpType
	while @@FETCH_STATUS = 0
	begin

		set @c_nameLCase = lower(substring(@c_name,1,1)) + substring(@c_name,2,len(@c_name)-1) 

		select @cSharpCodeInterface = @cSharpCodeInterface + char(9) + @c_cSharpType + ' ' + @c_name + ' {get; set;}' + char(10)
		, @cSharpCodeDTO = @cSharpCodeDTO + char(9) + 'public ' + @c_cSharpType + ' ' + @c_name + ' {get; set;}' + char(10)
		, @cSharpCodeDTOConstructor = @cSharpCodeDTOConstructor + char(9) + char(9) + @c_name + ' = default(' + @c_cSharpType + ');' + char(10)
		, @cSharpCodeDTOConstructorParameter = @cSharpCodeDTOConstructorParameter + @c_cSharpType + ' ' + @c_nameLCase + ', '
		, @cSharpCodeDTOConstructorParameterAssignments = @cSharpCodeDTOConstructorParameterAssignments + char(9) + char(9) + @c_name + ' = ' + @c_nameLCase + ';' + char(10)

		fetch next from column_cursor into @c_name, @c_cSharpType
	end
	close column_cursor
	deallocate column_cursor

	select @cSharpCodeInterface = @cSharpCodeInterface + '}' + char(10) 
	, @cSharpCodeDTO = @cSharpCodeDTO 
		+ @cSharpCodeDTOConstructor + char(9) + '}' + char(10)
		+ @cSharpCodeDTOConstructorParameter + @cSharpCodeDTOConstructorParameterAssignments + char(9) + '}' + char(10)
		+ '}' + char(10) 
	
	fetch next from table_cursor into @object_id, @t_name
end
close table_cursor
deallocate table_cursor

print @cSharpCodeInterface
print @cSharpCodeDTO

select @cSharpCodeInterface
select @cSharpCodeDTO

