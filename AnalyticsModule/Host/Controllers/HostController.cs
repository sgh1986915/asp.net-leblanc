using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
	public class HostController : Controller
	{
		public ActionResult Index()
		{
			ViewBag.Message = "Welcome to ASP.NET MVC!";

			return View();
		}

		[Authorize]
        public ActionResult Admin()
        {
            return View();
        }
	}
}