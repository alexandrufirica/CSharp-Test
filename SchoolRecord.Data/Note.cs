using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolRecord.Data
{
    public class Note
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int MaterieId { get; set; }
        public int Nota { get; set; }
    }
}
