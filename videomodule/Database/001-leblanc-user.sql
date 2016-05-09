declare @id uniqueidentifier
SET @id = NEWID();

INSERT INTO [VideoModule].[dbo].[aspnet_Applications]
           ([ApplicationName]
           ,[LoweredApplicationName]
           ,[ApplicationId]
           ,[Description])
     VALUES
           ('/'
           ,'/'
           ,'cc9658cb-8c3c-4b9b-afaa-d3ab276697b2'
           ,'/')


INSERT [dbo].[aspnet_Users] 
([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate])
 VALUES 
 (N'cc9658cb-8c3c-4b9b-afaa-d3ab276697b2', @id, N'leblanc', N'leblanc', NULL, 0, CAST(0x00009E0300651671 AS DateTime))

INSERT [dbo].[aspnet_Membership] 
([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) 
VALUES 
(N'cc9658cb-8c3c-4b9b-afaa-d3ab276697b2', @id, N'cu7J8aE3CSz0WuCxgZYsHVpt9Fc=', 1, N'9tw7jqkfirwgd5jYtjM73Q==', NULL, N'leblanc@robusthaven.com', N'leblanc@robusthaven.com', NULL, NULL, 1, 0, CAST(0x00009E000009FFDE AS DateTime), CAST(0x00009E0300651671 AS DateTime), CAST(0x00009E000009FFDE AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
