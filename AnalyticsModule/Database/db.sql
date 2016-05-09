USE [AreaModule]
GO

/****** Object:  Table [dbo].[AnalyticsModuleRouteTrack]    Script Date: 10/15/2011 20:19:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AnalyticsModuleRouteTrack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Route] [nvarchar](max) NOT NULL,
	[UserIP] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsGoogleTracking] [bit] NOT NULL,
	[UserAgent] [nvarchar](250) NOT NULL,
	[Location] [nvarchar](250) NOT NULL,
	[TenantDataGroup_Id] [uniqueidentifier] NOT NULL,
	[Browser] [nvarchar](50) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
	[Referrer] [nvarchar](max) NOT NULL,
	[UserHost] [nvarchar](100) NOT NULL,
	[LatLng] [nvarchar](500) NULL,
	[LastedOn] [datetime] NULL,
	[uID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AnalyticsModuleRouteTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


