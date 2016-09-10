using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class SupplementaryInfoTypeDTO : DTOBase, ISupplementaryInfoType
    {
        public long? Id { get; set; }
        public string Name { get; set; }
        public string UnicodeChar { get; set; }

        public SupplementaryInfoTypeDTO()
        {
            IsNew = true;
            Id = default(long?);
            Name = default(string);
            UnicodeChar = default(string);
        }

        public SupplementaryInfoTypeDTO(long? id, string name, string unicodeChar, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            Name = name;
            UnicodeChar = unicodeChar;
        }
    }

}