namespace JohnLBevan.EventApp.BaseInterfaces
{

    public interface IPerformerMember
    {
        long? GroupPerformerId { get; set; }
        long? Id { get; set; }
        long? MemberPerformerId { get; set; }
    }

}