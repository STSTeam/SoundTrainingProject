-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sounds_GetBySessionId]
	-- Add the parameters for the stored procedure here
	@sessionId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  select 
	 Sound.Id 
	, Sound.Name 
	, Sound.DisplayName
   from SessionsSounds
  inner join Sound on SessionsSounds.SoundId = Sound.Id
where SessionsSounds.SessionId = @sessionId
END