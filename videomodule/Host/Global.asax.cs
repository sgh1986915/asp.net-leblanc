using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.Unity;
using MvcContrib.UI.InputBuilder;
using RobustHaven.Areas.VideoModule;
using RobustHaven.Web;
using AreaRegistration = System.Web.Mvc.AreaRegistration;

namespace MvcApplication1
{
    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
		{
			routes.IgnoreRoute("{resource}.svc/{*pathInfo}");
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
			routes.IgnoreRoute("{resource}.jpg/{*pathInfo}");

            routes.IgnoreRoute("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });


            routes.MapRoute(
                null,
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional }, 
                new[] { "MvcApplication1.Controllers" }
            );
        }

        protected void Application_Start()
        {

            IUnityContainer container = new UnityContainer();

            var modules = new List<IModule>
                              {
                                  new ModuleRegistration(container)
                              };
            modules.ForEach(m => m.Register());

            container.RegisterType<IUserIdentity, UserIdentity>();

            ControllerBuilder.Current.SetControllerFactory(new UnityControllerFactory(container));


            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);


            InputBuilder.BootStrap();
        }
    }
}