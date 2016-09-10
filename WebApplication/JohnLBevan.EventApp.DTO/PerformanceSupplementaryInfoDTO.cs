using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformanceSupplementaryInfoDTO : DTOBase, IPerformanceSupplementaryInfo
    {
        public long? Id { get; set; }
        public long? PerformanceId { get; set; }
        public long? SupplementaryInfoId { get; set; }

        public PerformanceSupplementaryInfoDTO()
        {
            IsNew = true;
            Id = default(long?);
            PerformanceId = default(long?);
            SupplementaryInfoId = default(long?);
        }

        public PerformanceSupplementaryInfoDTO(long? id, long? performanceId, long? supplementaryInfoId, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            PerformanceId = performanceId;
            SupplementaryInfoId = supplementaryInfoId;
        }
    }

}