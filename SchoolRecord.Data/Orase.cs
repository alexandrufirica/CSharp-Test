

namespace SchoolRecord.Data
{
    public class Orase
    {
        public Orase(int id, string denumire)
        {
            //Id = Guid.NewGuid().GetHashCode();
            Id = id;
            Denumire = denumire;
        }

        public int Id { get; set; }
        public string Denumire { get; set; }


    }


}
