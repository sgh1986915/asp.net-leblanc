INSERT INTO Store (id,chain_id,storename,Latitude,Longitude,IsDeployed,TimeZoneID)
VALUES(NEWID(),NEWID(),'Store 1',0,0,'True',NEWID())

INSERT INTO Store (id,chain_id,storename,Latitude,Longitude,IsDeployed,TimeZoneID)
VALUES(NEWID(),NEWID(),'Store 2',0,0,'True',NEWID())

INSERT INTO Store (id,chain_id,storename,Latitude,Longitude,IsDeployed,TimeZoneID)
VALUES(NEWID(),NEWID(),'Store 3',0,0,'True',NEWID())

INSERT INTO Store (id,chain_id,storename,Latitude,Longitude,IsDeployed,TimeZoneID)
VALUES(NEWID(),NEWID(),'Store 4',0,0,'True',NEWID())

INSERT INTO Store (id,chain_id,storename,Latitude,Longitude,IsDeployed,TimeZoneID)
VALUES(NEWID(),NEWID(),'Store 5',0,0,'True',NEWID())

SELECT id, 'False' isProcessed into #temp FROM Store s

DECLARE @preset_id UNIQUEIDENTIFIER
SET @preset_id = NEWID();

DECLARE @user_id UNIQUEIDENTIFIER
SET @user_id = (SELECT UserId FROM [aspnet_Users] where UserName = 'leblanc');

INSERT INTO VideoModuleUserCameraPreset(ID,Name)
VALUES(@preset_id,'Preset 1')

DECLARe @counter INT
SET @counter = 1
WHILE(EXISTS(SELECT * FROM #temp WHERE isProcessed = 'False'))
BEGIN
	DECLARE @id UNIQUEIDENTIFIER
	SELECT TOP 1 @id = id FROM #temp WHERE isProcessed = 'False'
	
	DECLARE @cam_id UNIQUEIDENTIFIER
	SET @cam_id = NEWID();
	INSERT INTO VideoModuleCamera(ID,StoreID,Name,CameraNumber,DNSRecord,UserName,[Password])
	VALUES(@cam_id,@id,'Camera ' + cast(@counter as nvarchar(8)), @counter, 'avs.dipmap.com','test','test')
	
	SET @counter = @counter + 1
	
	INSERT INTO VideoModuleCamera(ID,StoreID,Name,CameraNumber,DNSRecord,UserName,[Password])
	VALUES(NEWID(),@id,'Camera ' + cast(@counter as nvarchar(8)), @counter, 'avs.dipmap.com','test','test')
	
	INSERT INTO VideoModuleUser_Camera(ID,UserID,CameraID,PresetID)
	VALUES(NEWID(),@user_id,@cam_id,@preset_id)
	
	UPDATE #temp SET isProcessed = 'True' WHERE id = @id
	
	SET @counter = @counter + 1
END