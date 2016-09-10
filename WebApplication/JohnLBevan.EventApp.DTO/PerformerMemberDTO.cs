using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformerMemberDTO : DTOBase, IPerformerMember
    {
        public long? GroupPerformerId { get; set; }
        public long? Id { get; set; }
        public long? MemberPerformerId { get; set; }

        public PerformerMemberDTO()
        {
            IsNew = true;
            GroupPerformerId = default(long?);
            Id = default(long?);
            MemberPerformerId = default(long?);
        }

        public PerformerMemberDTO(long? groupPerformerId, long? id, long? memberPerformerId, bool isNew = false)
        {
            IsNew = isNew;
            GroupPerformerId = groupPerformerId;
            Id = id;
            MemberPerformerId = memberPerformerId;
        }
    }

}