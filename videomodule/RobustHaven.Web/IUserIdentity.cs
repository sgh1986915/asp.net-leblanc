using System;
using System.Security.Principal;

namespace RobustHaven.Web
{
    public interface IUserIdentity : IPrincipal
    {
        Boolean HasPermission(string module, string view, string function);
    }
}
