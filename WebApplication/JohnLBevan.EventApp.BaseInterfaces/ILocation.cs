namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface ILocation
    {
        string AddressLine1 { get; set; }
        string AddressLine2 { get; set; }
        string AddressLine3 { get; set; }
        string AddressLine4 { get; set; }
        long? CityId { get; set; }
        long? CountryId { get; set; }
        long? CountyStateRegionId { get; set; }
        long? Id { get; set; }
        decimal Latitude { get; set; }
        decimal Longitude { get; set; }
        string ZipCode { get; set; }
    }

}