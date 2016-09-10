namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformance
    {
        long? Id { get; set; }
        string Name { get; set; }
        long? PerformerId { get; set; }
    }

}