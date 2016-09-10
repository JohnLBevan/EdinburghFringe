using JohnLBevan.EventApp.BaseInterfaces;

namespace JohnLBevan.EventApp.DTO
{

    public class CountryDTO : DTOBase, ICountry
    {
        public long? Id { get; set; }
        public string Name { get; set; }

        public CountryDTO()
        {
            IsNew = true;
            Id = default(long?);
            Name = default(string);
        }

        public CountryDTO(long? id, string name, bool isNew = false)
        {
            IsNew = isNew;
            Id = id;
            Name = name;
        }
    }

}