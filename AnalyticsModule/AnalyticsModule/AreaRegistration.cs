using Microsoft.Practices.Unity;
using MvcContrib.PortableAreas;
using System.Web.Mvc;
using System.Web.Routing;
using RobustHaven.Web;
using RobustHaven.Web.ModelTemplates;

namespace RobustHaven.Areas.AnalyticsModule
{
    public class AreaRegistration : PortableAreaRegistration, IRhPortableArea
    {
        public override string AreaName
        {
            get { return "AnalyticsModule"; }
        }

        public override void RegisterArea(System.Web.Mvc.AreaRegistrationContext context, IApplicationBus bus)
        {
            //setting up metadata provider to support DropDownList
            ModelMetadataProviders.Current = new FieldTemplateMetadataProvider();

            RegisterAreaEmbeddedResources();
        }

        public void RegisterRoutes(RouteCollection routes, IUnityContainer container)
        {
            routes.Add(new Route("areas/analyticsmodule/{resourceName}", new MvcRouteHandler())
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
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("analytics/{action}", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "Home",
                    action = "SaveLog"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("admin/chat", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "Admin",
                    action = "Chat"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("admin/analytics", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "Admin",
                    action = "Index"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("admin/analytics/routetrack", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "RouteTrack",
                    action = "Get"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("admin/analytics/partial", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "RouteTrack",
                    action = "AjaxGet"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("admin/analytics/delete", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "RouteTrack",
                    action = "_DeleteAjax"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });

            routes.Add(null, new Route("admin/analytics/detail", new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(new
                {
                    controller = "RouteTrack",
                    action = "Detail"
                }),
                DataTokens = new RouteValueDictionary(new
                {
                    Namespaces = new[] { "RobustHaven.Areas.AnalyticsModule.*" },
                    UseNamespaceFallback = false,
                    area = "AnalyticsModule"
                })
            });
        }
    }
}