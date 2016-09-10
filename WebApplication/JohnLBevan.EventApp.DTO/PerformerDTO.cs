using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformerDTO : DTOBase, IPerformer
    {
        public long? Id { get; set; }
        public string Name { get; set; }
        public string UniqueName { get; set; }

        public PerformerDTO()
        {
            IsNew = true;
            Id = default(long?);
            Name = default(string);
            UniqueName = default(string);
        }

        public PerformerDTO(long? id, string name, string uniqueName, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            Name = name;
            UniqueName = uniqueName;
        }
    }

}