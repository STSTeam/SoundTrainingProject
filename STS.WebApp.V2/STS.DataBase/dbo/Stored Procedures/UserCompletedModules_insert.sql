-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UserCompletedModules_insert
	@userId int,
	@moduleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[UserCompletedModules]
           ([UserId]
           ,[ModuleId]
           ,[CreatedDate])
     VALUES
           (@userId, @moduleId, GETDATE())
END