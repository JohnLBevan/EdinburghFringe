using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class VenueSupplementaryInfoDTO : DTOBase, IVenueSupplementaryInfo
    {
        public long? Id { get; set; }
        public long? SupplementaryInfoId { get; set; }
        public long? VenueId { get; set; }

        public VenueSupplementaryInfoDTO()
        {
            IsNew = true;
            Id = default(long?);
            SupplementaryInfoId = default(long?);
            VenueId = default(long?);
        }

        public VenueSupplementaryInfoDTO(long? id, long? supplementaryInfoId, long? venueId, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            SupplementaryInfoId = supplementaryInfoId;
            VenueId = venueId;
        }
    }

}