using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class PerformerTypeDTO : DTOBase, IPerformerType
    {
        public long? Id { get; set; }
        public string Name { get; set; }

        public PerformerTypeDTO()
        {
            IsNew = true;
            Id = default(long?);
            Name = default(string);
        }

        public PerformerTypeDTO(long? id, string name, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            Name = name;
        }
    }

}