using System.Configuration;
using System.Data.Objects;
using RobustHaven.Areas.AnalyticsModule.Configuration;
using RobustHaven.Web.Extensions;
using RobustHaven.Web.Repositories;

namespace RobustHaven.Areas.AnalyticsModule.Models
{
	public class AnalyticsModuleObjectContext : TenantObjectContext
    {
		public AnalyticsModuleObjectContext(IAnalyticsModuleConfigurationRepository configurationRepository)
			: base(
				ConfigurationManager.ConnectionStrings[configurationRepository.GetSection().ConnectionStringKey].
					ConnectionString.GetEfConnectionString())
        {

        }

        private ObjectSet<RouteTrack> _routeTracks;
        public ObjectSet<RouteTrack> RouteTracks
        {
            get
            {
                return _routeTracks ?? (_routeTracks = CreateObjectSet<RouteTrack>());
            }
        }
    }
}