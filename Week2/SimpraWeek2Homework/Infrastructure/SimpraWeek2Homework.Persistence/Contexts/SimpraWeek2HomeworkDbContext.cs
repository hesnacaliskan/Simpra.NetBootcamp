using Microsoft.EntityFrameworkCore;
using SimpraWeek2Homework.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpraWeek2Homework.Persistence.Contexts
{
    public class SimpraWeek2HomeworkDbContext : DbContext
    {
        public SimpraWeek2HomeworkDbContext(DbContextOptions options) : base(options) { }

        public DbSet<Staff> Staffs { get; set; }
    }
}
