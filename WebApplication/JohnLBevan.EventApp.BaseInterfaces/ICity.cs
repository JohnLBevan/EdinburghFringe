namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface ICity
    {
        long? CountryId { get; set; }
        long? CountyStateRegionId { get; set; }
        long? Id { get; set; }
        string Name { get; set; }
    }

}