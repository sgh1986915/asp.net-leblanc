using System.Web.Configuration;

namespace RobustHaven.Areas.AnalyticsModule.Configuration
{
	public class AnalyticsModuleConfigurationRepository : IAnalyticsModuleConfigurationRepository
	{
		public AnalyticsModuleConfiguration GetSection()
		{
			return WebConfigurationManager.GetSection(AnalyticsModuleConfiguration.SectionName) as AnalyticsModuleConfiguration;
		}
	}
}