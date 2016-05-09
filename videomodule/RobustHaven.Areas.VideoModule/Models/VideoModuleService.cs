
namespace RobustHaven.Areas.VideoModule.Models
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel;
	using System.ComponentModel.DataAnnotations;
	using System.Data;
	using System.Linq;
	using System.ServiceModel.DomainServices.EntityFramework;
	using System.ServiceModel.DomainServices.Hosting;
	using System.ServiceModel.DomainServices.Server;


	// Implements application logic using the VideoModuleEntities context.
	// TODO: Add your application logic to these methods or in additional methods.
	// TODO: Wire up authentication (Windows/ASP.NET Forms) and uncomment the following to disable anonymous access
	// Also consider adding roles to restrict access as appropriate.
	// [RequiresAuthentication]
	[EnableClientAccess()]
	public class VideoModuleService : LinqToEntitiesDomainService<VideoModuleEntities>
	{

		// TODO:
		// Consider constraining the results of your query method.  If you need additional input you can
		// add parameters to this method or create additional query methods with different names.
		// To support paging you will need to add ordering to the 'Stores' query.
		[Query(IsDefault = true)]
		public IQueryable<Store> GetStores()
		{
			return this.ObjectContext.Stores;
		}

		public void InsertStore(Store store)
		{
			if ((store.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(store, EntityState.Added);
			}
			else
			{
				this.ObjectContext.Stores.AddObject(store);
			}
		}

		public void UpdateStore(Store currentStore)
		{
			this.ObjectContext.Stores.AttachAsModified(currentStore, this.ChangeSet.GetOriginal(currentStore));
		}

		public void DeleteStore(Store store)
		{
			if ((store.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(store, EntityState.Deleted);
			}
			else
			{
				this.ObjectContext.Stores.Attach(store);
				this.ObjectContext.Stores.DeleteObject(store);
			}
		}

		// TODO:
		// Consider constraining the results of your query method.  If you need additional input you can
		// add parameters to this method or create additional query methods with different names.
		// To support paging you will need to add ordering to the 'VideoModuleCameras' query.
		[Query(IsDefault = true)]
		public IQueryable<VideoModuleCamera> GetVideoModuleCameras()
		{
			return this.ObjectContext.VideoModuleCameras;
		}

		public void InsertVideoModuleCamera(VideoModuleCamera videoModuleCamera)
		{
			if ((videoModuleCamera.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(videoModuleCamera, EntityState.Added);
			}
			else
			{
				this.ObjectContext.VideoModuleCameras.AddObject(videoModuleCamera);
			}
		}

		public void UpdateVideoModuleCamera(VideoModuleCamera currentVideoModuleCamera)
		{
			this.ObjectContext.VideoModuleCameras.AttachAsModified(currentVideoModuleCamera, this.ChangeSet.GetOriginal(currentVideoModuleCamera));
		}

		public void DeleteVideoModuleCamera(VideoModuleCamera videoModuleCamera)
		{
			if ((videoModuleCamera.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(videoModuleCamera, EntityState.Deleted);
			}
			else
			{
				this.ObjectContext.VideoModuleCameras.Attach(videoModuleCamera);
				this.ObjectContext.VideoModuleCameras.DeleteObject(videoModuleCamera);
			}
		}

		// TODO:
		// Consider constraining the results of your query method.  If you need additional input you can
		// add parameters to this method or create additional query methods with different names.
		// To support paging you will need to add ordering to the 'VideoModuleUser_Camera' query.
		[Query(IsDefault = true)]
		public IQueryable<VideoModuleUser_Camera> GetVideoModuleUser_Camera()
		{
			return this.ObjectContext.VideoModuleUser_Camera;
		}

		public void InsertVideoModuleUser_Camera(VideoModuleUser_Camera videoModuleUser_Camera)
		{
			if ((videoModuleUser_Camera.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(videoModuleUser_Camera, EntityState.Added);
			}
			else
			{
				this.ObjectContext.VideoModuleUser_Camera.AddObject(videoModuleUser_Camera);
			}
		}

		public void UpdateVideoModuleUser_Camera(VideoModuleUser_Camera currentVideoModuleUser_Camera)
		{
			this.ObjectContext.VideoModuleUser_Camera.AttachAsModified(currentVideoModuleUser_Camera, this.ChangeSet.GetOriginal(currentVideoModuleUser_Camera));
		}

		public void DeleteVideoModuleUser_Camera(VideoModuleUser_Camera videoModuleUser_Camera)
		{
			if ((videoModuleUser_Camera.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(videoModuleUser_Camera, EntityState.Deleted);
			}
			else
			{
				this.ObjectContext.VideoModuleUser_Camera.Attach(videoModuleUser_Camera);
				this.ObjectContext.VideoModuleUser_Camera.DeleteObject(videoModuleUser_Camera);
			}
		}

		// TODO:
		// Consider constraining the results of your query method.  If you need additional input you can
		// add parameters to this method or create additional query methods with different names.
		// To support paging you will need to add ordering to the 'VideoModuleUserCameraPresets' query.
		[Query(IsDefault = true)]
		public IQueryable<VideoModuleUserCameraPreset> GetVideoModuleUserCameraPresets()
		{
			return this.ObjectContext.VideoModuleUserCameraPresets;
		}

		public void InsertVideoModuleUserCameraPreset(VideoModuleUserCameraPreset videoModuleUserCameraPreset)
		{
			if ((videoModuleUserCameraPreset.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(videoModuleUserCameraPreset, EntityState.Added);
			}
			else
			{
				this.ObjectContext.VideoModuleUserCameraPresets.AddObject(videoModuleUserCameraPreset);
			}
		}

		public void UpdateVideoModuleUserCameraPreset(VideoModuleUserCameraPreset currentVideoModuleUserCameraPreset)
		{
			this.ObjectContext.VideoModuleUserCameraPresets.AttachAsModified(currentVideoModuleUserCameraPreset, this.ChangeSet.GetOriginal(currentVideoModuleUserCameraPreset));
		}

		public void DeleteVideoModuleUserCameraPreset(VideoModuleUserCameraPreset videoModuleUserCameraPreset)
		{
			if ((videoModuleUserCameraPreset.EntityState != EntityState.Detached))
			{
				this.ObjectContext.ObjectStateManager.ChangeObjectState(videoModuleUserCameraPreset, EntityState.Deleted);
			}
			else
			{
				this.ObjectContext.VideoModuleUserCameraPresets.Attach(videoModuleUserCameraPreset);
				this.ObjectContext.VideoModuleUserCameraPresets.DeleteObject(videoModuleUserCameraPreset);
			}
		}
	}
}


