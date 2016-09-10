namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface ICountyStateRegion
    {
        long? CountryId { get; set; }
        long? Id { get; set; }
        string Name { get; set; }
    }

}