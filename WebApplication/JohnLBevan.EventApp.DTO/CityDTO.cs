using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class CityDTO : DTOBase, ICity
    {
        public long? CountryId { get; set; }
        public long? CountyStateRegionId { get; set; }
        public long? Id { get; set; }
        public string Name { get; set; }

        public CityDTO()
        {
            IsNew = true;
            CountryId = default(long?);
            CountyStateRegionId = default(long?);
            Id = default(long?);
            Name = default(string);
        }

        public CityDTO(long? countryId, long? countyStateRegionId, long? id, string name, bool isNew = false)
        {
            IsNew = isNew;
            CountryId = countryId;
            CountyStateRegionId = countyStateRegionId;
            Id = id;
            Name = name;
        }
    }

}