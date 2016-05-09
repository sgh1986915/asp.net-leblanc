using Microsoft.Practices.Unity;
using RobustHaven.Areas.AnalyticsModule.Configuration;
using RobustHaven.Areas.AnalyticsModule.Models;
using RobustHaven.Areas.AnalyticsModule.Repositories;
using RobustHaven.Areas.AnalyticsModule.Repositories.EntityFramework;
using RobustHaven.Web;
using RobustHaven.Web.DependencyInjection;
using RobustHaven.Web.Utilities;
using RobustHaven.Web.Validation;

namespace RobustHaven.Areas.AnalyticsModule
{
    public class ModuleRegistration : IModule
    {
        private readonly IUnityContainer _unityContainer;

        public ModuleRegistration(IUnityContainer unityContainer)
        {
            _unityContainer = unityContainer;
        }


        public void Register()
        {
            _unityContainer.RegisterType<IAnalyticsModuleConfigurationRepository, AnalyticsModuleConfigurationRepository>();

            _unityContainer.RegisterType<IRouteTrackRepository, RouteTrackRepository>();
            _unityContainer.RegisterType<IValidation<RouteTrack>, RouteTrackValidation>();

			_unityContainer.RegisterType<AnalyticsModuleObjectContext, AnalyticsModuleObjectContext>(new HttpContextLifetimeManager<AnalyticsModuleObjectContext>());
        }
    }
}