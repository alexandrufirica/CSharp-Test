using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolRecord.Data
{
    public class SchoolRecordDbContext : DbContext
    {
        public SchoolRecordDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Orase> Orase { get; set; }
        public DbSet<Grupa> Grupa { get; set; } 
        public DbSet<Materie> Materie { get; set; }
        public DbSet<Student> Student { get; set; }
        public DbSet<Note> Note { get; set; }

    }
}
