use EdinburghFringe
go
--if object_id('') is not null drop table 

print 'dropping views'
if object_id('vPerformerMembership') is not null drop view vPerformerMembership
if object_id('vLocationFullAddress') is not null drop view vLocationFullAddress 

print 'dropping tables'

if object_id('VenueSupplementaryInfo') is not null drop table VenueSupplementaryInfo
if object_id('PerformerSupplementaryInfo') is not null drop table PerformerSupplementaryInfo
if object_id('PerformanceSupplementaryInfo') is not null drop table PerformanceSupplementaryInfo
if object_id('PerformanceEventSupplementaryInfo') is not null drop table PerformanceEventSupplementaryInfo
if object_id('SupplementaryInfo') is not null drop table SupplementaryInfo
if object_id('SupplementaryInfoType') is not null drop table SupplementaryInfoType
if object_id('PerformanceEvent') is not null drop table PerformanceEvent  
if object_id('Performance') is not null drop table Performance
if object_id('PerformerMember') is not null drop table PerformerMember 
if object_id('PerformerPerformerType') is not null drop table PerformerPerformerType
if object_id('PerformerType') is not null drop table PerformerType
if object_id('Performer') is not null drop table Performer
if object_id('Venue') is not null drop table Venue
if object_id('Location') is not null drop table Location
if object_id('City') is not null drop table City
if object_id('CountyStateRegion') is not null drop table CountyStateRegion
if object_id('Country') is not null drop table Country

go

print 'creating tables'

create table Country
(
	Id bigint not null constraint PK_Country primary key clustered 
	, Name nvarchar(256) not null constraint UK_Country_Name unique --will require a translation table; we'll hold the English value here (considered using country's native language; but what if they have multiple native languages?
)
create table CountyStateRegion
(
	Id bigint not null constraint PK_CountyStateRegion primary key clustered 
	, CountryId bigint not null constraint FK_CountryStateRegion_CountryId foreign key references Country(Id)
	, Name nvarchar(256) not null --may require a translation table; initially don't bother 
)
create table City
(
	Id bigint not null constraint PK_City primary key clustered 
	, CountryId bigint not null constraint FK_City_CountryId foreign key references Country(Id)
	, CountyStateRegionId bigint constraint FK_City_CountyStateRegionId foreign key references CountyStateRegion(Id) --optional (maybe?); hence needing country too
	, Name nvarchar(256) not null --may require a translation table (e.g. mumbai:bombay?); initially don't bother
)
create table Location --question: what fields should be mandatory?...; long and lat are most uesful, but may be hard to find (though there are services if the user has the rest of the address)
(
	Id bigint not null constraint PK_Location primary key clustered 
	, Longitude numeric(8,2)
	, Latitude numeric(8,2)
	, AddressLine1 nvarchar(256)
	, AddressLine2 nvarchar(256)
	, AddressLine3 nvarchar(256)
	, AddressLine4 nvarchar(256)
	, CityId bigint constraint FK_Location_CityId foreign key references City(Id) --foreign key
	, CountyStateRegionId bigint constraint FK_Location_CountyStateRegionId foreign key references CountyStateRegion(Id) --(fk may not be required if cityId were mandatory, as info could be pulled from that...)
	, CountryId bigint constraint FK_Location_CountryId foreign key references Country(Id) --(fk may not be required if cityId were mandatory, as info could be pulled from that...)
	, ZipCode nvarchar(12)
)
create table Venue
(
	Id bigint not null constraint PK_Venue primary key clustered 
	,Name nvarchar(256) not null
	,LocationId bigint not null constraint FK_Venue_LocationId foreign key references Location(Id)
	,UniqueName nvarchar(512) not null --in case there are 2 "theatre royals", append city / street / etc to ensure unique; may be automatable...
	,IsVenue bit not null
	,IsBoxOffice bit not null
)
create table PerformerType
(
	Id bigint not null constraint PK_PerformerType primary key clustered 
	,Name nvarchar(256) not null constraint UK_PerformerType_Name unique --question: is gender a concern (e.g. comedian, comedienne)
)
create table Performer 
(
	Id bigint not null constraint PK_Performer primary key clustered 
	,Name nvarchar(256) not null
	,UniqueName nvarchar(512) not null --in case there are 2 "Joe Bloggs"
	--,PerformerType bigint not null constraint FK_Performer_PerformerType --not here; performers may be of many types (actress, commedienne, author, etc)
	--something to indicate male/female/group/other?  Or use PerformerType for that too?  May be useful in generated content (e.g. "see *her* at the Theatre Royal")
)
create table PerformerPerformerType
(
	Id bigint not null constraint PK_PerformerPerformerType primary key clustered 
	,PerformerId bigint not null constraint FK_PerformerPerformerType_PerformerId foreign key references Performer(Id)
	,PerformerTypeId bigint not null constraint FK_PerformerPerformerType_PerformerTypeId foreign key references PerformerType(Id)	
)
create table PerformerMember 
(
	Id bigint not null constraint PK_PerformerMember primary key clustered 
	,GroupPerformerId bigint not null constraint FK_PerformerMember_GroupPerformerId foreign key references Performer(Id)
	,MemberPerformerId bigint not null constraint FK_PerformerMember_MemberPerformerId foreign key references Performer(Id)
)
create table Performance 
(
	Id bigint not null constraint PK_Performance primary key clustered 
	,PerformerId bigint not null constraint FK_Performance_PerformerId foreign key references Performer(Id)
	,Name nvarchar(256) not null --unique?
)
create table PerformanceEvent 
(
	Id bigint not null constraint PK_PerformanceEvent primary key clustered 
	,PerformanceId bigint not null constraint FK_PerformanceEvent_PerformanceId foreign key references Performance(Id)
	,VenueId bigint not null constraint FK_PerformanceEvent_VenueId foreign key references Venue(Id)
	,EventDate date not null
	,StartTime datetime not null --datetime rather than time; will handle the clunkiness of this in the UI
	,EndTime datetime not null --time or datetime?  what happens if it goes past midnight?  add constraint that this must be equal to or after the starttime...
)
create table SupplementaryInfoType
(
	Id bigint not null constraint PK_SupplementaryInfoType primary key clustered 
	, Name nvarchar(64) not null constraint UK_SupplementaryInfoType_Name unique
	--, LabelText nvarchar(12) --have in a translation table
	, UnicodeChar nchar(1)
	--maybe include some category field; e.g. mail, phone, mobile etc are contact fields, notes is an information field, etc...
)
create table SupplementaryInfo 
(
	Id bigint not null constraint PK_SupplementaryInfo primary key clustered 
	, SupplementaryInfoTypeId bigint not null constraint FK_SupplementaryInfo_SupplementaryInfoTypeId foreign key references SupplementaryInfoType(Id)
	, Value nvarchar(max) 
)
create table VenueSupplementaryInfo 
(
	Id bigint not null constraint PK_VenueSupplementaryInfo primary key clustered 
	,VenueId bigint not null constraint FK_VenueSupplementaryInfo_VenueId foreign key references Venue(Id)
	,SupplementaryInfoId bigint not null constraint FK_VenueSupplementaryInfo_SupplementaryInfoId foreign key references SupplementaryInfo(Id)
)
create table PerformerSupplementaryInfo 
(
	Id bigint not null constraint PK_PerformerSupplementaryInfo primary key clustered 
	,PerformerId bigint not null constraint FK_PerformerSupplementaryInfo_PerformerId foreign key references Performer(Id)
	,SupplementaryInfoId bigint not null constraint FK_PerformerSupplementaryInfo_SupplementaryInfoId foreign key references SupplementaryInfo(Id)	
)
create table PerformanceSupplementaryInfo 
(
	Id bigint not null constraint PK_PerformanceSupplementaryInfo primary key clustered 
	,PerformanceId bigint not null constraint FK_PerformanceSupplementaryInfo_PerformanceId foreign key references Performance(Id)
	,SupplementaryInfoId bigint not null constraint FK_PerformanceSupplementaryInfo_SupplementaryInfoId foreign key references SupplementaryInfo(Id)	
)
create table PerformanceEventSupplementaryInfo 
(
	Id bigint not null constraint PK_PerformanceEventSupplementaryInfo primary key clustered 
	,PerformanceEventId bigint not null constraint FK_PerformanceEventSupplementaryInfo_PerformanceEventId foreign key references PerformanceEvent(Id)
	,SupplementaryInfoId bigint not null constraint FK_PerformanceEventSupplementaryInfo_SupplementaryInfoId foreign key references SupplementaryInfo(Id)	
)
go

print 'creating views'

go

create view vLocationFullAddress as
select 
  l.Longitude
, l.Latitude
, l.AddressLine1
, l.AddressLine2
, l.AddressLine3
, l.AddressLine4
, ci.Name City
, csr.Name CountyStateRegion
, co.Name Country
, l.ZipCode
from Location l
left outer join City ci on ci.Id = l.CityId 
left outer join CountyStateRegion csr on csr.Id = l.CountyStateRegionId
left outer join Country co on co.Id = l.CountryId

go

create view vPerformerMembership as
with PerformerMemberCte as
(
	select p.Id PerformerId, p.Id PerformerMemberId, p.Name PerformerName, p.UniqueName PerformerNameUnique, 1 HierarchyLevel
	from Performer p

	union all

	select cte.PerformerId, p.Id PerformerMemberId, p.Name PerformerName, p.UniqueName PerformerNameUnique, cte.HierarchyLevel + 1 HierarchyLevel
	from PerformerMemberCte cte
	inner join PerformerMember pm on pm.GroupPerformerId = cte.PerformerMemberId 
	inner join Performer p on p.Id = pm.MemberPerformerId

)
select PerformerId
, PerformerMemberId
, PerformerName
, PerformerNameUnique
, HierarchyLevel
from PerformerMemberCte 

go
print 'done'
