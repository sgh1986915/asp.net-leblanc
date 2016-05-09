using System;
using System.Runtime.Serialization;

namespace RobustHaven.Areas.ShoutBox.Models
{
    [DataContract]
    public class Shout
    {
        [DataMember]
        public Guid? Id
        {
            get; set;
        }

        [DataMember]
        public String UserName
        {
            get; set;
        }

        [DataMember]
        public String Message
        {
            get; set;
        }

        [DataMember]
        public DateTime? CreatedOn
        {
            get;
            set;
        }
    }
}