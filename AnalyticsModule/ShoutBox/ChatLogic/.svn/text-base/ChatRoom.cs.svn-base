using System;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
using RobustHaven.Areas.ShoutBox.Repositories;

namespace RobustHaven.Areas.ShoutBox.ChatLogic
{
    [DataContract]
    public class ChatRoom
    {
        [DataMember]
        public Guid RoomID { get; private set; }
        [DataMember]
        public string RoomName { get; private set; }
        
        public ChatRoom(Guid id)
        {
            robusthavenEntity entity = new robusthavenEntity();

            var room = entity.AnalyticsChatRooms.SingleOrDefault(r => r.ChatRoomID == id);
            if (room != null)
            {
                RoomID = id;
                RoomName = room.ChatRoomName;
            }
        }
    }
}