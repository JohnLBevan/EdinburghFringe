namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface ISupplementaryInfo
    {
        long? Id { get; set; }
        long? SupplementaryInfoTypeId { get; set; }
        string Value { get; set; }
    }

}