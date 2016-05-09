<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

    <xsl:output method="xml" indent="yes" xml:space="preserve" />
		
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="configuration/configSections">
		<configSections>
			<xsl:apply-templates select="@*|node()"/>
			<section name="loggingConfiguration" type="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.LoggingSettings, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.414.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="true" />
		</configSections>
		
		<loggingConfiguration name="Logging Application Block" tracingEnabled="true" defaultCategory="General">
			<listeners>
			</listeners>
			<formatters>
				<add type="Microsoft.Practices.EnterpriseLibrary.Logging.Formatters.TextFormatter, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.414.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
					template="Timestamp: {{timestamp}}{{newline}}&#xA;Message: {{message}}{{newline}}&#xA;Category: {{category}}{{newline}}&#xA;Priority: {{priority}}{{newline}}&#xA;EventId: {{eventid}}{{newline}}&#xA;Severity: {{severity}}{{newline}}&#xA;Title:{{title}}{{newline}}&#xA;Machine: {{localMachine}}{{newline}}&#xA;App Domain: {{localAppDomain}}{{newline}}&#xA;ProcessId: {{localProcessId}}{{newline}}&#xA;Process Name: {{localProcessName}}{{newline}}&#xA;Thread Name: {{threadName}}{{newline}}&#xA;Win32 ThreadId:{{win32ThreadId}}{{newline}}&#xA;Extended Properties: {{dictionary({{key}} - {{value}}{{newline}})}}"
					name="Text Formatter" />
			</formatters>
			<categorySources>
				<add switchValue="All" name="General">
					<listeners>
					</listeners>
				</add>
				<add switchValue="All" name="Information">
					<listeners>
					</listeners>
				</add>
				<add switchValue="All" name="Warning">
					<listeners>
					</listeners>
				</add>
				<add switchValue="All" name="Errors">
					<listeners>
					</listeners>
				</add>
			</categorySources>
			<specialSources>
				<allEvents switchValue="All" name="All Events" />
				<notProcessed switchValue="All" name="Unprocessed Category" />
				<errors switchValue="All" name="Logging Errors &amp; Warnings">
					<listeners>
					</listeners>
				</errors>
			</specialSources>
		</loggingConfiguration>
	</xsl:template>
</xsl:stylesheet>