using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.Unity;
using MvcContrib.UI.InputBuilder;
using RobustHaven.Web;
using RobustHaven.Web.Attributes;
using RobustHaven.Web.Services;

namespace MvcApplication1
{
    public class MvcApplication : HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.IgnoreRoute("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });

            routes.MapRoute(
                 null,
                 "{controller}/{action}/{id}", // URL with parameters
                 new { controller = "Host", action = "Index", id = UrlParameter.Optional },
                 new[] { "MvcApplication1.Controllers" }
                 );

            //routes.MapRoute(
            //    null,
            //    "Experience/{controller}/{action}/{id}",
            //    new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //    );

        }

        protected void Application_Start()
        {
            IUnityContainer container = new UnityContainer();

            new RobustHaven.Areas.SecurityModule.AreaRegistration().RegisterRoutes(RouteTable.Routes, container);
            new RobustHaven.Areas.AnalyticsModule.AreaRegistration().RegisterRoutes(RouteTable.Routes, container);


            var modules = new List<IModule>
			{
			    new RobustHaven.Web.ModuleRegistration(container),
			    new RobustHaven.Areas.SecurityModule.ModuleRegistration(container),
			    new RobustHaven.Areas.AnalyticsModule.ModuleRegistration(container)
			};
            modules.ForEach(m => m.Register());

            container.RegisterType<IMultitenancyService, DebugViewService>();

            ControllerBuilder.Current.SetControllerFactory(new UnityControllerFactory(container));

			IFilterProvider oldProvider = FilterProviders.Providers.Single(
				f => f is FilterAttributeFilterProvider
				);
			FilterProviders.Providers.Remove(oldProvider);
			var provider = new UnityFilterAttributeFilterProvider(container);
			FilterProviders.Providers.Add(provider);



            System.Web.Mvc.AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            InputBuilder.BootStrap();
        }
    }
}