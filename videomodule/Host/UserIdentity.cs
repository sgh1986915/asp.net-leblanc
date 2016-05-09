using System.Security.Principal;
using RobustHaven.Web;

namespace MvcApplication1
{
    public class UserIdentity : IUserIdentity
    {
        public bool HasPermission(string module, string view, string function)
        {
            return true;
        }

        public IIdentity Identity
        {
            get { return new CustomGenericIdentity("leblanc"); }
        }

        public bool IsInRole(string role)
        {
            return true;
        }
    }


    public class CustomGenericIdentity : GenericIdentity
    {
        public CustomGenericIdentity(string name)
            : base(name)
        {
        }

        public override bool IsAuthenticated
        {
            get
            {
                return true;
            }
        }
    }
}