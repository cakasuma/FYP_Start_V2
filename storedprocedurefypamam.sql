SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE dbo.Register_User
@Email varchar(50),
@Password nvarchar(max),
@Name varchar(50),
@Contact varchar(50),
@User_Type varchar(50),
@secret_Key varchar(max)
AS
BEGIN
SET NOCOUNT ON;
IF EXISTS(SELECT User_Id FROM [T_User] WHERE Email=@Email)
BEGIN
SELECT -1
END
ELSE
BEGIN
INSERT INTO [T_User]
([Email],[Password],[Name], [Contact], [User_Type], [secret_key]) VALUES(@Email, @Password, @Name, @Contact, @User_Type, @secret_Key)
SELECT SCOPE_IDENTITY()
END
END
GO