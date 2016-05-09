using System;
using System.Collections.Generic;
using System.Data.Objects.SqlClient;
using System.Linq;
using System.Web.Mvc;
using RobustHaven.Areas.VideoModule.Models;
using RobustHaven.Web;
using Telerik.Web.Mvc;


namespace RobustHaven.Areas.VideoModule.Controllers
{
    public class HomeController : Controller
    {
    	private readonly VideoModuleEntities _videoModuleEntities;
    	private readonly IUserIdentity _userIdentity;

    	public HomeController(VideoModuleEntities videoModuleEntities, IUserIdentity userIdentity)
    	{
    		_videoModuleEntities = videoModuleEntities;
    		_userIdentity = userIdentity;
    	}

    	public ActionResult Index()
        {
			//probably here we should show list of available updates
            return View("Index", "Site");
        }

		public ActionResult CameraDisplay(Guid id)
		{
			var c = _videoModuleEntities.VideoModuleCameras.FirstOrDefault(x => x.ID == id);

			if(c == null)
				return new HttpNotFoundResult();

			return PartialView(c);
		}

		public ActionResult TabStrip_StoreTabContent()
		{
			var model = _videoModuleEntities.Stores.ToList();
			return View("StoreTabContent", model);
		}

		public ActionResult TabStrip_UserDefinedTabContent()
		{
			var model = (from uc in _videoModuleEntities.VideoModuleUser_Camera
			             join c in _videoModuleEntities.VideoModuleCameras on uc.CameraID equals c.ID
						 join u in _videoModuleEntities.aspnet_Users on uc.UserID equals u.UserId
						 where u.UserName == _userIdentity.Identity.Name
			             select uc.VideoModuleUserCameraPreset).Distinct().ToList();
			return View("UserDefinedTabContent", model);
		}

		public JsonResult GetCameras()
		{
			var data = (from x in _videoModuleEntities.VideoModuleCameras
			            select new
			                   	{
									x.ID,
									x.Name,
									x.Password,
									x.StoreID,
									x.UserName,
									x.DNSRecord
			                   	});
			return new JsonResult() { JsonRequestBehavior = JsonRequestBehavior.AllowGet ,Data = data};
		}

		public ActionResult CreatePreset()
		{
			var model = _videoModuleEntities.Stores.ToList();
			return View("CreatePreset", model);
		}
		[HttpPost]
		public ActionResult CreatePreset(FormCollection formCollection)
		{
			int s = formCollection.Count;
			string presetName = formCollection["txtPresetName"];
			string cameras = formCollection["hdnCamera"];

			var preset = new VideoModuleUserCameraPreset() { ID = Guid.NewGuid(), Name = presetName };

			var userId = _videoModuleEntities.aspnet_Users.Where(x => x.UserName == _userIdentity.Identity.Name).First().UserId;

			foreach (var camera in cameras.Split(new char[] {','}))
			{
				if (camera != "")
					preset.VideoModuleUser_Camera.Add(new VideoModuleUser_Camera() { ID = Guid.NewGuid(), UserID = userId, CameraID = new Guid(camera) });
			}

			_videoModuleEntities.AddToVideoModuleUserCameraPresets(preset);
			_videoModuleEntities.SaveChanges();

			return RedirectToAction("Index");
		}

		public ActionResult ManagePreset()
		{
			var list = (from p in _videoModuleEntities.VideoModuleUserCameraPresets select new LookupDO { ID = p.ID, Name = p.Name }).ToList();
			list.Insert(0, new LookupDO { Name = "Please Select" });
			var model = new SelectList(list, "ID", "Name");
			return View("ManagePreset", model);
		}

		public JsonResult GetPresetAssignedVideoCameras(string presetId)
		{
			return new JsonResult() { Data = GetAssignedModel(presetId), JsonRequestBehavior = JsonRequestBehavior.AllowGet };
		}
		public JsonResult GetPresetNotAssignedVideoCameras(string presetId)
		{
			return new JsonResult() { Data = GetNotAssignedModel(presetId), JsonRequestBehavior = JsonRequestBehavior.AllowGet };
		}
		[HttpPost]
		public JsonResult AssignVideoCamerasToPreset(string pid, string cameraids)
		{
			if (string.IsNullOrEmpty(pid) || string.IsNullOrEmpty(cameraids))
			{
				return GetVideoCameraPresetParamErrorMessage();
			}

			var userId = _videoModuleEntities.aspnet_Users.Where(x => x.UserName == _userIdentity.Identity.Name).First().UserId;

			foreach (var cameraid in GetCameraIds(cameraids))
			{
				_videoModuleEntities.AddToVideoModuleUser_Camera(new VideoModuleUser_Camera() { CameraID = new Guid(cameraid), ID = Guid.NewGuid(), PresetID = new Guid(pid), UserID = userId });
			}

			_videoModuleEntities.SaveChanges();

			return GetVideoCameraPresetSuccessMessage(pid);
		}
		[HttpPost]
		public JsonResult UnAssignVideoCamerasFromPreset(string pid, string cameraids)
		{
			if (string.IsNullOrEmpty(pid) || string.IsNullOrEmpty(cameraids))
			{
				return GetVideoCameraPresetParamErrorMessage();
			}

			foreach (var cameraid in GetCameraIds(cameraids))
			{
				_videoModuleEntities.VideoModuleUser_Camera.DeleteObject(_videoModuleEntities.VideoModuleUser_Camera.Where(x => x.PresetID == new Guid(pid) && x.CameraID == new Guid(cameraid)).First());
			}

			_videoModuleEntities.SaveChanges();

			return GetVideoCameraPresetSuccessMessage(pid);
		}
		
    	#region Helper Methods
		private IQueryable<LookupDO> GetVideoCameraQuery(string presetId, bool any)
		{
			if (any)
			{
				return (from c in _videoModuleEntities.VideoModuleCameras
				        where c.VideoModuleUser_Camera.Any(x => x.PresetID == new Guid(presetId))
						select new LookupDO()
				               	{
				               		ID = c.ID,
				               		Name = c.Name
				               	});
			}
			else
			{
				return (from c in _videoModuleEntities.VideoModuleCameras
						where !c.VideoModuleUser_Camera.Any(x => x.PresetID == new Guid(presetId))
						select new LookupDO()
						{
							ID = c.ID,
							Name = c.Name
						});
			}
		}
		private List<LookupDO> GetUnAssignedVideoCameras(string presetId)
		{
			return GetVideoCameraQuery(presetId, false).Distinct().ToList();
		}
		private List<LookupDO> GetAssignedVideoCameras(string presetId)
		{
			return GetVideoCameraQuery(presetId, true).ToList();
		}
		private JsonResult GetVideoCameraPresetParamErrorMessage()
		{
			return Json(new { result = "false", message = "paremeters could not be null or empty.", assigned_data = "", unassigned_data = "" });
		}
		private JsonResult GetVideoCameraPresetSuccessMessage(string pid)
		{
			return Json(new { result = "true", message = "", assigned_data = GetAssignedVideoCameras(pid), unassigned_data = GetUnAssignedVideoCameras(pid) });
		}
		private string[] GetCameraIds(string cameraids)
		{
			return cameraids.Split(new char[] { ',' });
		}
		private GridModel GetAssignedModel(string presetId)
		{
			var data = GetAssignedVideoCameras(presetId);
			return new GridModel() { Data = data, Total = data.Count };
		}
		private GridModel GetNotAssignedModel(string presetId)
		{
			var data = GetUnAssignedVideoCameras(presetId);
			return new GridModel() { Data = data, Total = data.Count };
		}
		#endregion
    }
}
