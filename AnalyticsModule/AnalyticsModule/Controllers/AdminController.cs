using System.Web.Mvc;
using RobustHaven.Web.Attributes;
using RobustHaven.Web.Controllers;

namespace RobustHaven.Areas.AnalyticsModule.Controllers
{
    [AjaxAuthorize]
	public class AdminController : BaseController
    {
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            return View("Index","AdminSite");
        }

        public ActionResult Chat()
        {
            return View("Chat", "AdminSite");
        }
    }
}
