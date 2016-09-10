namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformanceEventSupplementaryInfo
    {
        long? Id { get; set; }
        long? PerformanceEventId { get; set; }
        long? SupplementaryInfoId { get; set; }
    }

}