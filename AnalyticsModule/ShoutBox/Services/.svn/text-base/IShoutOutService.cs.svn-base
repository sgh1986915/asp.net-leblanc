using System.Collections.Generic;
using System.ServiceModel;
using RobustHaven.Areas.ShoutBox.Models;

namespace RobustHaven.Areas.ShoutBox.Services
{
    [ServiceContract(Namespace = "RobustHaven.Areas.ShoutBox.Services", Name = "ShoutOutService")]
    public interface IShoutOutService
    {
        [OperationContract]
        IEnumerable<Shout> List();

        [OperationContract]
        void Create(Shout shout);
    }
}