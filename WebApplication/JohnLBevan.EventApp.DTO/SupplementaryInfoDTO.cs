using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class SupplementaryInfoDTO : DTOBase, ISupplementaryInfo
    {
        public long? Id { get; set; }
        public long? SupplementaryInfoTypeId { get; set; }
        public string Value { get; set; }

        public SupplementaryInfoDTO()
        {
            IsNew = true;
            Id = default(long?);
            SupplementaryInfoTypeId = default(long?);
            Value = default(string);
        }

        public SupplementaryInfoDTO(long? id, long? supplementaryInfoTypeId, string value, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            SupplementaryInfoTypeId = supplementaryInfoTypeId;
            Value = value;
        }
    }

}