namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformerSupplementaryInfo
    {
        long? Id { get; set; }
        long? PerformerId { get; set; }
        long? SupplementaryInfoId { get; set; }
    }

}