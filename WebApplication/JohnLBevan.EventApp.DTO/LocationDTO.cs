using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class LocationDTO : DTOBase, ILocation
    {
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string AddressLine3 { get; set; }
        public string AddressLine4 { get; set; }
        public long? CityId { get; set; }
        public long? CountryId { get; set; }
        public long? CountyStateRegionId { get; set; }
        public long? Id { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public string ZipCode { get; set; }

        public LocationDTO()
        {
            IsNew = true;
            AddressLine1 = default(string);
            AddressLine2 = default(string);
            AddressLine3 = default(string);
            AddressLine4 = default(string);
            CityId = default(long?);
            CountryId = default(long?);
            CountyStateRegionId = default(long?);
            Id = default(long?);
            Latitude = default(decimal);
            Longitude = default(decimal);
            ZipCode = default(string);
        }

        public LocationDTO(string addressLine1, string addressLine2, string addressLine3, string addressLine4, long? cityId, long? countryId, long? countyStateRegionId, long? id, decimal latitude, decimal longitude, string zipCode, bool isNew = false)
        {
            IsNew = isNew;
            AddressLine1 = addressLine1;
            AddressLine2 = addressLine2;
            AddressLine3 = addressLine3;
            AddressLine4 = addressLine4;
            CityId = cityId;
            CountryId = countryId;
            CountyStateRegionId = countyStateRegionId;
            Id = id;
            Latitude = latitude;
            Longitude = longitude;
            ZipCode = zipCode;
        }
    }

}