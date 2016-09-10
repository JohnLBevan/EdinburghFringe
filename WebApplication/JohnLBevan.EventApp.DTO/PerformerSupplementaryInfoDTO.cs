using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformerSupplementaryInfoDTO : DTOBase, IPerformerSupplementaryInfo
    {
        public long? Id { get; set; }
        public long? PerformerId { get; set; }
        public long? SupplementaryInfoId { get; set; }

        public PerformerSupplementaryInfoDTO()
        {
            IsNew = true;
            Id = default(long?);
            PerformerId = default(long?);
            SupplementaryInfoId = default(long?);
        }

        public PerformerSupplementaryInfoDTO(long? id, long? performerId, long? supplementaryInfoId, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            PerformerId = performerId;
            SupplementaryInfoId = supplementaryInfoId;
        }
    }

}