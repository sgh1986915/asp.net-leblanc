using System;
using System.Web;
using System.Runtime.Serialization;
using RobustHaven.Areas.ShoutBox.Repositories;

namespace RobustHaven.Areas.ShoutBox.ChatLogic
{
    [DataContract]
    public class RoomTalker
    {
        [DataMember]
        public string TalkerAlias { get; private set; }
        [DataMember]
        public string TalkerSession { get; private set; }
        [DataMember]
        public string TalkerIP { get; private set; }
        [DataMember]
        public bool IsFriend { get; private set; }

        public RoomTalker(AnalyticsTalker talker, HttpContext context)
        {
            TalkerAlias = talker.AnalyticsSession.UserAlias;
            TalkerIP = talker.AnalyticsSession.IP;
            TalkerSession = talker.AnalyticsSession.SessionID;
            IsFriend = (TalkerSession != context.Session.SessionID);
        }
    }
}