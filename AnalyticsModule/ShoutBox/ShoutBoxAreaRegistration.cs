using MvcContrib.PortableAreas;

namespace RobustHaven.Areas.ShoutBox
{
    public class ShoutBoxAreaRegistration : PortableAreaRegistration
    {
        public override string AreaName
        {
            get { return "ShoutBoxArea"; }
        }

        public override void RegisterArea(System.Web.Mvc.AreaRegistrationContext context, IApplicationBus bus)
        {
            context.MapRoute("ResourceRoute", "shoutbox/resource/{resourceName}",
                new { controller = "EmbeddedResource", action = "Index" },
                new[] { "MvcContrib.PortableAreas" });

            context.MapRoute("ResourceImageRoute", "shoutbox/images/{resourceName}",
                new { controller = "EmbeddedResource", action = "Index", resourcePath = "Images" },
                new[] { "MvcContrib.PortableAreas" });

            base.RegisterArea(context, bus);
        }
    }
}