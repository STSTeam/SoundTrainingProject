using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(STS.WebApp.Startup))]
namespace STS.WebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
