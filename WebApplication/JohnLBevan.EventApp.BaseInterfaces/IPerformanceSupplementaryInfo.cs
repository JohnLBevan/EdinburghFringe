namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformanceSupplementaryInfo
    {
        long? Id { get; set; }
        long? PerformanceId { get; set; }
        long? SupplementaryInfoId { get; set; }
    }

}