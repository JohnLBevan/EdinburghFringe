namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IVenue
    {
        long? Id { get; set; }
        bool? IsBoxOffice { get; set; }
        bool? IsVenue { get; set; }
        long? LocationId { get; set; }
        string Name { get; set; }
        string UniqueName { get; set; }
    }

}