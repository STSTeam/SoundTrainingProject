namespace STS.WebApp.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using STS.WebApp.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<STS.WebApp.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(STS.WebApp.Models.ApplicationDbContext context)
        {
            var manager = new UserManager<ApplicationUser>(
                new UserStore<ApplicationUser>(
                    new ApplicationDbContext()));

            // Create admin user:
            var user = new ApplicationUser()
            {
                UserName = "admin@sts.com",
                Email = "admin@sts.com"
            };
            manager.Create(user, "P@ssw0rd");

            // create Level
            context.Levels.AddOrUpdate(x => x.Id,
                new Level() { Id = 1, Title = "Sound Detection" });

            // Create session
            context.Sessions.AddOrUpdate(x => x.Id,
                new Session() { Id = 1, LevelId = 1, Title = "Session 1" },
                new Session() { Id = 2, LevelId = 1, Title = "Session 2" },
                new Session() { Id = 3, LevelId = 1, Title = "Session 3" },
                new Session() { Id = 4, LevelId = 1, Title = "Session 4" });
        }
    }
}
