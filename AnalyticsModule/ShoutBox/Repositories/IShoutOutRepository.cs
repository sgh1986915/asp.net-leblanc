using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RobustHaven.Areas.ShoutBox.Models;

namespace RobustHaven.Areas.ShoutBox.Repositories
{
    public interface IShoutOutRepository
    {
        IEnumerable<Models.Shout> List(Int32 limit, Int32 offset);
        void Create(Shout shout);
    }
}