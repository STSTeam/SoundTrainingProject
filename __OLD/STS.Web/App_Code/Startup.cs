using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(STS.Web.Startup))]
namespace STS.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
