using System.Web.Mvc;
using System.Web.Routing;
using MvcContrib.PortableAreas;

namespace RobustHaven.Areas.VideoModule
{
    public class AreaRegistration : PortableAreaRegistration
    {
		private static readonly string[] Namespaces = new[] { "RobustHaven.Areas.VideoModule.Controllers" };

        public override string AreaName
        {
            get { return "VideoModule"; }
        }

        public override void RegisterArea(AreaRegistrationContext context, IApplicationBus bus)
		{
			context.Routes.Add(new Route("areas/videomodule/{resourceName}", new MvcRouteHandler())
			{
				Defaults = new RouteValueDictionary(new
				{
					controller = "EmbeddedResource",
					action = "Index"
				}),
				DataTokens = new RouteValueDictionary(new
				{
					Namespaces = new[] { "MvcContrib.PortableAreas" },
					UseNamespaceFallback = false,
					area = AreaName
				})
			});

            context.Routes.Add(new Route("videomodule/{controller}/{action}", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "Home",
                    action = "Index"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces,
                    UseNamespaceFallback = false,
                    area = AreaName
                })
            });


            RegisterAreaEmbeddedResources();
        }
    }
}