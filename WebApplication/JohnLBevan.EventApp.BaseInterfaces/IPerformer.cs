namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformer
    {
        long? Id { get; set; }
        string Name { get; set; }
        string UniqueName { get; set; }
    }

}