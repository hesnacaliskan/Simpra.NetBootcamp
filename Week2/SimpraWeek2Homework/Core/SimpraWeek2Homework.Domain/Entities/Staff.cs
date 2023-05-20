using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpraWeek2Homework.Domain.Entities
{
    [Table("Staff", Schema = "dbo")]
    public class Staff
    {
        public int Id { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string AddressLine1 { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Province { get; set; }
        
        [NotMapped]
        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }
    }

    public class ProductConfiguration : IEntityTypeConfiguration<Staff>
    {
        public void Configure(EntityTypeBuilder<Staff> builder)
        {
            builder.HasKey(x => x.Id);
            builder.HasIndex(x => x.Email).IsUnique();
            builder.Property(x => x.Email).HasMaxLength(50);
            builder.Property(x => x.FirstName).HasMaxLength(50);
            builder.Property(x => x.LastName).HasMaxLength(50);
            builder.Property(x => x.Phone).HasMaxLength(11);
            builder.Property(x => x.AddressLine1).HasMaxLength(1000);
            builder.Property(x => x.City).HasMaxLength(100);
            builder.Property(x => x.Country).HasMaxLength(100);
            builder.Property(x => x.Province).HasMaxLength(100);            
            builder.Property(x => x.CreatedBy).HasMaxLength(50);

        }
    }
}
