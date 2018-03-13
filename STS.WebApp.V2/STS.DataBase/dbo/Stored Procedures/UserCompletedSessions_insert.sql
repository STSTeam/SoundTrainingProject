-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UserCompletedSessions_insert
	@userId int,
	@sessionId int,
	@userTestId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[UserCompletedSessions]
           ([UserId]
           ,SessionId
           ,UserTestId
		   ,CreatedDate)
     VALUES
           (@userId, @sessionId, @userTestId, GETDATE())
END