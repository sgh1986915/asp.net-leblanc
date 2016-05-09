using System;
using System.ComponentModel.DataAnnotations;
using RobustHaven.Web.Models;

namespace RobustHaven.Areas.AnalyticsModule.Models
{
    public class RouteTrack : ITenancySupportedEntity 
    {
        public int Id { get; set; }

        public string Route { get; set; }

        public string UserIP { get; set; }

        public DateTime CreatedOn { get; set; }

        public bool IsGoogleTracking { get; set; }

        public string UserAgent { get; set; }

        public string Location { get; set; }

        public string Browser { get; set; }

        public string Language { get; set; }

        public string Referrer { get; set; }

        public string UserHost { get; set; }

        public string LatLng { get; set; }

        public DateTime LastedOn { get; set; }

        public Guid uID { get; set; }

        public Guid? TenantDataGroup_Id { get; set; }
    }
}