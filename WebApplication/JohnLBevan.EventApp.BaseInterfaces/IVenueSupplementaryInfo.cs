namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IVenueSupplementaryInfo
    {
        long? Id { get; set; }
        long? SupplementaryInfoId { get; set; }
        long? VenueId { get; set; }
    }

}