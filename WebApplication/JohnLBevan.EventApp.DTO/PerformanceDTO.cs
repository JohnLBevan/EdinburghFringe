using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformanceDTO : DTOBase, IPerformance
    {
        public long? Id { get; set; }
        public string Name { get; set; }
        public long? PerformerId { get; set; }

        public PerformanceDTO()
        {
            IsNew = true;
            Id = default(long?);
            Name = default(string);
            PerformerId = default(long?);
        }

        public PerformanceDTO(long? id, string name, long? performerId, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            Name = name;
            PerformerId = performerId;
        }
    }

}