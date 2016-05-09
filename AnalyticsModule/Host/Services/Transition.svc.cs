using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Web;
using System.Text.RegularExpressions;
using RobustHaven.Areas.ShoutBox.Repositories;
using RobustHaven.Areas.ShoutBox.ChatLogic;

namespace WebChat.Services
{
    [ServiceContract(Namespace = "http://RobustHaven.WebChat",
        SessionMode = SessionMode.Allowed)]
    [AspNetCompatibilityRequirements(
        RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Transition
    {
        #region Chat Service

        [OperationContract]
        public ChatRoom JoinChatRoom(string alias)
        {
            Guid roomid = ChatManager.GetChatRoomID();

            if (roomid != Guid.Empty)
            {
                ChatManager.JoinChatRoom(roomid, HttpContext.Current, alias);
                return new ChatRoom(roomid);
            }
            else
            {
                return null;
            }
        }

        [OperationContract]
        public void LeaveChatRoom()
        {
            Guid roomid = ChatManager.GetChatRoomID();

            if (roomid != Guid.Empty)
            {
                ChatManager.LeaveChatRoom(roomid, HttpContext.Current);
            }
            else
            {
                return;
            }
        }

        [OperationContract]
        public bool SendMessage(string message)
        {
            Guid roomid = ChatManager.GetChatRoomID();

            if (roomid != Guid.Empty)
            {
                AnalyticsTalker talker = ChatManager.FindTalker(roomid, HttpContext.Current);
                ChatManager.SendMessage(talker, message);
                return true;
            }
            else
            {
                return false;
            }
        }

        [OperationContract]
        public List<Message> RecieveMessage()
        {
            List<Message> result = new List<Message>();

            Guid roomid = ChatManager.GetChatRoomID();

            if (roomid != Guid.Empty)
            {
                List<AnalyticsMessagePool> messageList = ChatManager.RecieveMessage(ChatManager.GetChatRoom(roomid));

                if (messageList != null)
                {
                    foreach (AnalyticsMessagePool msg in messageList)
                    {
                        result.Add(new Message(msg, HttpContext.Current));
                    }
                }
            }

            return result;
        }

        [OperationContract]
        public List<RoomTalker> GetRoomTalkerList()
        {
            List<RoomTalker> result = new List<RoomTalker>();

            Guid roomid = ChatManager.GetChatRoomID();

            if (roomid != Guid.Empty)
            {
                List<AnalyticsTalker> talkerList = ChatManager.GetRoomTalkerList(roomid);

                foreach (AnalyticsTalker talker in talkerList)
                {
                    if (talker.AnalyticsSession.UserAlias != "admin")
                        result.Add(new RoomTalker(talker, HttpContext.Current));
                }
            }
            
            return result;
        }

        #endregion

        #region Multi-Chat Service

        [OperationContract]
        public void CreateChatRoom(string useralias,
            string roomName,
            string password,
            int maxUser,
            bool needPassword)
        {

            if (maxUser < 2)
            {
                maxUser = 2;
            }

            Guid roomid = ChatManager.CreateChatRoom(
                roomName, password, false, maxUser, needPassword);
        }

        [OperationContract]
        public List<ChatRoom> GetChatRoomList()
        {
            List<AnalyticsChatRoom> list = ChatManager.GetChatRoomList();
            List<ChatRoom> result = new List<ChatRoom>();

            foreach (AnalyticsChatRoom room in list)
            {
                result.Add(new ChatRoom(room.ChatRoomID));
            }
            return result;
        }

        [OperationContract]
        public ChatRoom GetChatRoomInfo(string RoomID)
        {
            Guid rim;
            if (Guid.TryParse(RoomID, out rim))
            {
                return new ChatRoom(rim);
            }
            else
            {
                return null;
            }
        }

        private Guid GetGUIDFromQuery(string query)
        {
            Guid rim;
            if (string.IsNullOrEmpty(query))
            {
                return Guid.Empty;
            }
            Regex reg = new Regex(
            "i=([0-9a-z]{8}-[0-9a-z]{4}-[0-9a-z]{4}-[0-9a-z]{4}-[0-9a-z]{12})");
            string gid = reg.Match(query).Groups[1].Value;
            if (Guid.TryParse(gid, out rim))
            {
                return rim;
            }
            else
            {
                return Guid.Empty;
            }
        }

        #endregion
    }
}
