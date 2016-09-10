using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class VenueDTO : DTOBase, IVenue
    {
        public long? Id { get; set; }
        public bool? IsBoxOffice { get; set; }
        public bool? IsVenue { get; set; }
        public long? LocationId { get; set; }
        public string Name { get; set; }
        public string UniqueName { get; set; }

        public VenueDTO()
        {
            IsNew = true;
            Id = default(long?);
            IsBoxOffice = default(bool?);
            IsVenue = default(bool?);
            LocationId = default(long?);
            Name = default(string);
            UniqueName = default(string);
        }

        public VenueDTO(long? id, bool? isBoxOffice, bool? isVenue, long? locationId, string name, string uniqueName, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            IsBoxOffice = isBoxOffice;
            IsVenue = isVenue;
            LocationId = locationId;
            Name = name;
            UniqueName = uniqueName;
        }
    }

}