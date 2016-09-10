using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class CountyStateRegionDTO : DTOBase, ICountyStateRegion
    {
        public long? CountryId { get; set; }
        public long? Id { get; set; }
        public string Name { get; set; }

        public CountyStateRegionDTO()
        {
            IsNew = true;
            CountryId = default(long?);
            Id = default(long?);
            Name = default(string);
        }

        public CountyStateRegionDTO(long? countryId, long? id, string name, bool isNew = false)
        {
            IsNew = isNew;
            CountryId = countryId;
            Id = id;
            Name = name;
        }
    }

}