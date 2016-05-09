CREATE TABLE [dbo].[Store](
 [id] [uniqueidentifier] NOT NULL,
 [chain_id] [uniqueidentifier] NOT NULL,
 [storename] [nvarchar](255) NOT NULL,
 [Unit] [nvarchar](255) NULL,
 [Latitude] [float] NOT NULL,
 [Longitude] [float] NOT NULL,
 [Address1] [nvarchar](255) NULL,
 [Address2] [nvarchar](255) NULL,
 [City] [nvarchar](255) NULL,
 [State] [nvarchar](255) NULL,
 [Zip] [nvarchar](255) NULL,
 [LocationEmail] [nvarchar](255) NULL,
 [Phone] [nvarchar](25) NULL,
 [Fax] [nvarchar](25) NULL,
 [IsDeployed] [bit] NOT NULL,
 [DeployedDate] [datetime] NULL,
 [TrialStart] [datetime] NULL,
 [IsBilling] [bit] NULL,
 [IsInTrialPeriod] [bit] NULL,
 [TimeZoneID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [UK_Store] UNIQUE NONCLUSTERED 
(
 [storename] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

Create Table VideoModuleUserCameraPreset
(
	ID uniqueidentifier Primary Key,
	[Name] varchar(50) NOT NULL
)
GO

CREATE TABLE [dbo].[VideoModuleCamera](
	[ID] [uniqueidentifier] NOT NULL,
	[StoreID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CameraNumber] int NOT NULL,
	[DNSRecord] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__VideoMod__3214EC2730C33EC3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[VideoModuleCamera]  WITH CHECK ADD  CONSTRAINT [FK_VideoModuleCamera_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([id])
GO

ALTER TABLE [dbo].[VideoModuleCamera] CHECK CONSTRAINT [FK_VideoModuleCamera_Store]
GO

CREATE TABLE [dbo].[VideoModuleUser_Camera](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[CameraID] [uniqueidentifier] NOT NULL,
	[PresetID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[VideoModuleUser_Camera]  WITH CHECK ADD  CONSTRAINT [FK_VideoModuleUser_Camera_aspnet_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO

ALTER TABLE [dbo].[VideoModuleUser_Camera] CHECK CONSTRAINT [FK_VideoModuleUser_Camera_aspnet_Users]
GO

ALTER TABLE [dbo].[VideoModuleUser_Camera]  WITH CHECK ADD  CONSTRAINT [FK_VideoModuleUser_Camera_Camera] FOREIGN KEY([CameraID])
REFERENCES [dbo].[VideoModuleCamera] ([ID])
GO

ALTER TABLE [dbo].[VideoModuleUser_Camera] CHECK CONSTRAINT [FK_VideoModuleUser_Camera_Camera]
GO

ALTER TABLE [dbo].[VideoModuleUser_Camera]  WITH CHECK ADD  CONSTRAINT [FK_VideoModuleUser_Camera_Preset] FOREIGN KEY([PresetID])
REFERENCES [dbo].[VideoModuleUserCameraPreset] ([ID])
GO

ALTER TABLE [dbo].[VideoModuleUser_Camera] CHECK CONSTRAINT [FK_VideoModuleUser_Camera_Preset]
GO
