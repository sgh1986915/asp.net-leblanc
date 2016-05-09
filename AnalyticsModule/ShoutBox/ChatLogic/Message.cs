using System;
using System.Web;
using System.Runtime.Serialization;
using RobustHaven.Areas.ShoutBox.Repositories;

namespace RobustHaven.Areas.ShoutBox.ChatLogic
{
    [DataContract]
    public class Message
    {
        [DataMember]
        public string Talker { get; private set; }
        [DataMember]
        public string MessageData { get; private set; }
        [DataMember]
        public DateTime SendTime { get; private set; }
        
        [DataMember]
        public bool IsFriend { get; private set; }

        public Message(AnalyticsMessagePool message, HttpContext session)
        {
            Talker = message.AnalyticsTalker.AnalyticsSession.UserAlias;
            MessageData = message.message;
            SendTime = message.SendTime;
            IsFriend = (message.AnalyticsTalker.AnalyticsSession.SessionID != session.Session.SessionID);
        }
    }
}