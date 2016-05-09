using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using RobustHaven.Areas.ShoutBox.Repositories;

namespace RobustHaven.Areas.ShoutBox.ChatLogic
{
    public class ChatManager
    {
        #region Send & Recieve Message

        public static bool SendMessage(AnalyticsTalker talker, string message)
        {
            try
            {
                robusthavenEntity entity = new robusthavenEntity();

                AnalyticsMessagePool msgpool = new AnalyticsMessagePool()
                {
                    message = message,
                    SendTime = DateTime.Now,
                    talkerID = talker.TalkerID
                };

                entity.AddToAnalyticsMessagePools(msgpool);
                entity.SaveChanges();
                
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static List<AnalyticsMessagePool> RecieveMessage(AnalyticsChatRoom room)
        {
            robusthavenEntity entity = new robusthavenEntity();

            if (entity.AnalyticsMessagePools.Count(
                msg => msg.AnalyticsTalker.ChatRoomID == room.ChatRoomID) > 0)
            {
                return (from messages in entity.AnalyticsMessagePools
                        where messages.AnalyticsTalker.ChatRoomID == room.ChatRoomID
                        select messages).ToList();
            }
            else
            {
                return null;
            }
        }

        private static void TryToDeleteChatMessageList(Guid roomid)
        {
            robusthavenEntity entity = new robusthavenEntity();

            var chatroom = GetChatRoom(roomid);
            if (chatroom.AnalyticsTalkers.Count(t => t.CheckOutTime == null) == 0)
            {
                AnalyticsMessagePool list = entity.AnalyticsMessagePools.First(x => x.AnalyticsTalker.ChatRoomID == roomid);

                entity.AnalyticsMessagePools.DeleteObject(list);
                entity.SaveChanges();
            }
        }

        #endregion

        #region ChatRoom Management

        public static Guid CreateChatRoom(string roomName, string password,
            bool isLock, int maxUserNumber, bool needPassword)
        {
            robusthavenEntity entity = new robusthavenEntity();

            AnalyticsChatRoom room = new AnalyticsChatRoom()
            {
                ChatRoomID = Guid.NewGuid(),
                ChatRoomName = roomName
            };

            entity.AddToAnalyticsChatRooms(room);
            entity.SaveChanges();

            return room.ChatRoomID;
        }

        public static AnalyticsChatRoom GetChatRoom(Guid roomid)
        {
            robusthavenEntity entity = new robusthavenEntity();
            
            return entity.AnalyticsChatRooms.SingleOrDefault(r => r.ChatRoomID == roomid);
        }

        public static List<AnalyticsChatRoom> GetChatRoomList()
        {
            robusthavenEntity entity = new robusthavenEntity();

            return entity.AnalyticsChatRooms.ToList();
        }

        public static bool JoinChatRoom(Guid ChatRoomID, HttpContext context, string alias)
        {
            robusthavenEntity entity = new robusthavenEntity();

            if (entity.AnalyticsSessions.Count(
                s => s.SessionID == context.Session.SessionID) == 0)
            {
                ChatManager.CreateSession(context, alias);
            }

            var session = ChatManager.GetSession(context);

            if (entity.AnalyticsTalkers.Count(t => t.ChatRoomID == ChatRoomID && 
                t.SessionID == session.UID && t.CheckOutTime == null) > 0)
            {
                return false;
            }
            else
            {
                AnalyticsTalker talker = new AnalyticsTalker()
                {
                    ChatRoomID = ChatRoomID,
                    CheckInTime = DateTime.Now,
                    CheckOutTime = null,
                    SessionID = session.UID
                };

                entity.AddToAnalyticsTalkers(talker);
                entity.SaveChanges();
                return true;
            }
        }

        public static AnalyticsTalker FindTalker(Guid ChatRoomID, HttpContext context)
        {
            robusthavenEntity entity = new robusthavenEntity();

            int sid = ChatManager.GetSession(context).UID;

            var rsl = entity.AnalyticsTalkers.FirstOrDefault(
                t => t.ChatRoomID == ChatRoomID && 
                t.SessionID == sid);

            return rsl;
        }

        public static List<AnalyticsTalker> GetRoomTalkerList(Guid ChatRoomID)
        {
            robusthavenEntity entity = new robusthavenEntity();

            var rsl = from d in entity.AnalyticsTalkers
                      where d.CheckOutTime == null && d.ChatRoomID == ChatRoomID
                      select d;

            return rsl.ToList();
        }

        public static void LeaveChatRoom(Guid ChatRoomID, HttpContext context)
        {
            robusthavenEntity entity = new robusthavenEntity();

            AnalyticsSession session = ChatManager.GetSession(context);
            if (session != null)
            {
                var talker = entity.AnalyticsTalkers.FirstOrDefault(
                    t => t.ChatRoomID == ChatRoomID &&
                    t.SessionID == session.UID && t.CheckOutTime == null);

                if (talker != null)
                {
                    talker.CheckOutTime = DateTime.Now;
                    entity.SaveChanges();
                }
            }

            TryToDeleteChatMessageList(ChatRoomID);
        }
        #endregion

        #region Chat Session Management

        public static AnalyticsSession GetSession(HttpContext context)
        {
            robusthavenEntity entity = new robusthavenEntity();

            var session = entity.AnalyticsSessions.FirstOrDefault(
                s => s.SessionID == context.Session.SessionID);

            return session;
        }

        public static bool SessionExist(HttpContext context)
        {
            return ChatManager.GetSession(context) != null;
        }

        public static bool CreateSession(HttpContext context, string userAlias)
        {
            try
            {
                robusthavenEntity entity = new robusthavenEntity();

                AnalyticsSession session = new AnalyticsSession()
                {
                    SessionID = context.Session.SessionID,
                    IP = context.Request.UserHostAddress,
                    UserAlias = (string.IsNullOrEmpty(userAlias)) ? context.Request.UserHostAddress : userAlias,
                };

                entity.AddToAnalyticsSessions(session);
                entity.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        #endregion

        public static Guid GetChatRoomID()
        {
            robusthavenEntity entity = new robusthavenEntity();

            return entity.AnalyticsChatRooms.First().ChatRoomID;
        }
    }
}