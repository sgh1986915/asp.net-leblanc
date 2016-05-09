using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace RobustHaven.Areas.ShoutBox
{
    public static class HtmlHelperExt
    {
        public static void RenderQuickLinks(this HtmlHelper htmlHelper)
        {
            htmlHelper.RenderAction("Chat", "ShoutBox", new { area = "ShoutBoxArea" });
        }

        public static void RenderQuickLinks1(this HtmlHelper htmlHelper)
        {
            htmlHelper.RenderAction("AdminChat", "ShoutBox", new { area = "ShoutBoxArea" });
        }
    }
}