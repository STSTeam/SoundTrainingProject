using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace STS.WebApp.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
            
        }
        public DbSet<Level> Levels { get; set; }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<Sound> Sounds { get; set; }
        public DbSet<Image> Images { get; set; }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}