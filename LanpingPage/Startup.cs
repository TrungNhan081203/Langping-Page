using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LanpingPage.Startup))]
namespace LanpingPage
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
