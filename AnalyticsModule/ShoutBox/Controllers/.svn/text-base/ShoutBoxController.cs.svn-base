using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RobustHaven.Areas.ShoutBox.ChatLogic;

namespace RobustHaven.Areas.ShoutBox.Controllers
{
    public class ShoutBoxController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Chat()
        {
            Session["User"] = Request.UserHostAddress;
            return View();
        }

        public ActionResult AdminChat()
        {
            ChatManager.JoinChatRoom(ChatManager.GetChatRoomID(), System.Web.HttpContext.Current, "admin");

            Session["User"] = Request.UserHostAddress;
            return View();
        }
    }
}
