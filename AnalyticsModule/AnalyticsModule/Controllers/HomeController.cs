using System;
using System.Web.Mvc;
using RobustHaven.Areas.AnalyticsModule.Configuration;
using RobustHaven.Areas.AnalyticsModule.Managers;
using RobustHaven.Web.Controllers;

namespace RobustHaven.Areas.AnalyticsModule.Controllers
{
	public class HomeController : BaseController
    {
        private RouteTrackManager _routeTrackManager;
        private IAnalyticsModuleConfigurationRepository _routeTrackrepository;

        public HomeController(RouteTrackManager routeTrackManager, IAnalyticsModuleConfigurationRepository routeTrackrepository)
        {
            _routeTrackManager = routeTrackManager;
            _routeTrackrepository = routeTrackrepository;
        }

		public ActionResult Index()
		{
			return View("Index", "Site");
		}

        public ActionResult SaveLog(string route, string location, string latlng, string uid)
        {
            _routeTrackManager.Create(new Models.RouteTrack()
                {
                    Route = Request.UrlReferrer.ToString(),
                    CreatedOn = DateTime.Now,
                    IsGoogleTracking = true,
                    UserIP = Request.UserHostAddress,
                    UserAgent = Request.UserAgent,
                    Location = location,
                    Browser = Request.Browser.Browser + Request.Browser.Version,
                    UserHost = Request.UserHostName,
                    Language = Request.UserLanguages[0],
                    Referrer = route, 
                    LatLng = latlng,
                    LastedOn = DateTime.Now,
                    uID = new Guid(uid)
                }
            );

            return Content("");
        }

        public ActionResult UpdateLog(string uid)
        {
            _routeTrackManager.Update(new Guid(uid));

            return Content("");
        }
    }
}
