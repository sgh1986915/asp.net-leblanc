using System;
using System.Web;
using GeoLite;
using RobustHaven.Areas.AnalyticsModule.Models;
using RobustHaven.Areas.AnalyticsModule.Repositories;
using RobustHaven.Web.Managers;
using RobustHaven.Web.Validation;

namespace RobustHaven.Areas.AnalyticsModule.Managers
{
    public class RouteTrackManager : ManagerBase<RouteTrack, int>
    {
        IRouteTrackRepository _routeTrackRepository;

        public RouteTrackManager( IValidation<RouteTrack> validation, IRouteTrackRepository routeTrackRepository)
            : base(routeTrackRepository, validation)
        {
            _routeTrackRepository = routeTrackRepository;
        }

        public override void Create(RouteTrack entity)
        {
            /*Location loc = GetLocationFromIP(entity.UserIP);
            if (loc != null) entity.Location = loc.countryName + ", " + loc.region + ", " + loc.city;
            else entity.Location = "undefined";*/

            base.Create(entity);
        }

        public void Update(Guid uid)
        {
            _routeTrackRepository.update(uid);
        }

        public virtual Location GetLocationFromIP(string ipAddress)
        {
            string databasePath = HttpContext.Current.Server.MapPath("~/app_data/GeoLiteCity.dat");
            LookupService service = new LookupService(databasePath);
            Location loc = service.getLocation(ipAddress);

            return loc;
        }
    }
}