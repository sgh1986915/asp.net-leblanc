using RobustHaven.Areas.AnalyticsModule.Configuration;
using RobustHaven.Areas.AnalyticsModule.Managers;
using RobustHaven.Areas.AnalyticsModule.Models;
using RobustHaven.Web.Attributes;
using RobustHaven.Web.Controllers;

using System.Web.Mvc;

namespace RobustHaven.Areas.AnalyticsModule.Controllers
{
    [AjaxAuthorize]
    public class RouteTrackController : GenericController<RouteTrack,int>
    {
        private RouteTrackManager _routeTrackManager;
        private readonly IAnalyticsModuleConfigurationRepository _routeTrackrepository;

        public RouteTrackController(RouteTrackManager routeTrackManager, IAnalyticsModuleConfigurationRepository routeTrackrepository)
            : base(routeTrackManager)
        {
            _routeTrackManager = routeTrackManager;
            _routeTrackrepository = routeTrackrepository;
            
        	ViewData["ScriptsFolder"] = _routeTrackrepository.GetSection().ScriptsFolder;
        }

        public ActionResult Detail(int id)
        {
            RouteTrack model = _routeTrackManager.GetById(id);

            ViewData["data"] = model;

            return View("Detail", "Site");
        }
    }
}