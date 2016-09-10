using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformerPerformerTypeDTO : DTOBase, IPerformerPerformerType
    {
        public long? Id { get; set; }
        public long? PerformerId { get; set; }
        public long? PerformerTypeId { get; set; }

        public PerformerPerformerTypeDTO()
        {
            IsNew = true;
            Id = default(long?);
            PerformerId = default(long?);
            PerformerTypeId = default(long?);
        }

        public PerformerPerformerTypeDTO(long? id, long? performerId, long? performerTypeId, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            PerformerId = performerId;
            PerformerTypeId = performerTypeId;
        }
    }

}