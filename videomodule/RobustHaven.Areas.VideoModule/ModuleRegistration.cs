using Microsoft.Practices.Unity;
using RobustHaven.Areas.VideoModule.Models;
using RobustHaven.Web;

namespace RobustHaven.Areas.VideoModule
{
    public class ModuleRegistration : IModule
    {
        private readonly IUnityContainer _unityContainer;

        public ModuleRegistration(IUnityContainer unityContainer)
        {
            _unityContainer = unityContainer;
        }
    
        public void  Register()
		{
			//_unityContainer.RegisterType<VideoModuleEntities, VideoModuleEntities>(new InjectionConstructor());
        }
    }
}