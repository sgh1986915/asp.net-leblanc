using System;

namespace RobustHaven.Web.ViewEngines
{
    public interface IMultitenancyService
    {
        String CurrentDomainName();
    }
}
