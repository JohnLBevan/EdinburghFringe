using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformanceEventSupplementaryInfoDTO : DTOBase, IPerformanceEventSupplementaryInfo
    {
        public long? Id { get; set; }
        public long? PerformanceEventId { get; set; }
        public long? SupplementaryInfoId { get; set; }

        public PerformanceEventSupplementaryInfoDTO()
        {
            IsNew = true;
            Id = default(long?);
            PerformanceEventId = default(long?);
            SupplementaryInfoId = default(long?);
        }

        public PerformanceEventSupplementaryInfoDTO(long? id, long? performanceEventId, long? supplementaryInfoId, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            PerformanceEventId = performanceEventId;
            SupplementaryInfoId = supplementaryInfoId;
        }
    }

}