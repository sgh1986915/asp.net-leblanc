using System;
using System.Linq;
using RobustHaven.Areas.AnalyticsModule.Configuration;
using RobustHaven.Areas.AnalyticsModule.Models;
using RobustHaven.Web.Repositories;
using RobustHaven.Web.Repositories.EntityFramework;
using RobustHaven.Web.Services;
using RobustHaven.Web.Views;

namespace RobustHaven.Areas.AnalyticsModule.Repositories.EntityFramework
{
    public class RouteTrackRepository : EfGenericRepository<RouteTrack, int>, IRouteTrackRepository
    {
    	private readonly IMultitenancyService _multiTenantService;
    	protected readonly Guid CurrentTenantDataGroupId;

        public RouteTrackRepository(
			IAnalyticsModuleConfigurationRepository configRepository, 
			IMultitenancyService multiTenantService, 
			ITenantDataGroupRepository tenantDataGroupRepository,
			AnalyticsModuleObjectContext analyticsModuleObjectContext
			)
			: base(analyticsModuleObjectContext)
        {
        	_multiTenantService = multiTenantService;
        	Context.ContextOptions.LazyLoadingEnabled = true;
            CurrentTenantDataGroupId = tenantDataGroupRepository.GetCurrentTenantDataGroupId();
        }

		public override IQueryable<RouteTrack> GetQuery()
		{
			var context = (AnalyticsModuleObjectContext)Context;
			var currentDomain = _multiTenantService.CurrentDomainName();

			return (from a in ObjectSet
					join t in context.TenantDataGroups
					on a.TenantDataGroup_Id equals t.Id
					join d in context.TenantDomains
						on t.Id equals d.TenantDataGroup_Id
					where d.Domain == (string)currentDomain
                    orderby a.CreatedOn descending
					select a);
		}

        public override void Add(RouteTrack entity)
        {
            entity.TenantDataGroup_Id = CurrentTenantDataGroupId;

            base.Add(entity);
        }

        public void update(Guid uid)
        {
            var context = (AnalyticsModuleObjectContext)Context;

            var entity = context.RouteTracks.Where(x => x.uID == uid).Single();

            entity.LastedOn = DateTime.Now;

            context.SaveChanges();
        }
    }
}