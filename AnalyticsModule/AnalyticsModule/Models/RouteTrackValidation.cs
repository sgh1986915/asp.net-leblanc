using System.Collections.Generic;
using System.Linq;
using RobustHaven.Areas.AnalyticsModule.Repositories;
using RobustHaven.Web.Managers;
using RobustHaven.Web.ModelExceptions;
using RobustHaven.Web.Validation;
using System;

namespace RobustHaven.Areas.AnalyticsModule.Models
{
    public class RouteTrackValidation : ValidationBase<RouteTrack>
    {
        IRouteTrackRepository _contentPageRepository;

        public RouteTrackValidation(IRouteTrackRepository contentPageRepository)
        {
            _contentPageRepository = contentPageRepository;
        }

        #region Implementation of IValidation<ContentPage>

        public override void Validate(RouteTrack entity, CrudOperation crudOperation)
        {
            var errorInfos = new List<ErrorInfo>();

            if (crudOperation == CrudOperation.Create )
            {
                if (string.IsNullOrEmpty(entity.Route))
                    errorInfos.Add(new ErrorInfo("Route", "Route can not be empty"));

                if (entity.CreatedOn == DateTime.MinValue)
                    errorInfos.Add(new ErrorInfo("CreatedOn", "CreatedOn can not be empty"));
            }

            if (errorInfos.Any())
            {
                throw new RulesException(errorInfos);
            }
        }

        #endregion
    }
}