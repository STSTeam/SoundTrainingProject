-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE images_GetBySessionId
	@sessionId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select
		Image.*
	from SoundImages
		inner join SessionsSounds on SoundImages.SoundId = SessionsSounds.SoundId
		inner join Image on SoundImages.ImageId = image.Id
	where SessionsSounds.SessionId = @sessionId
END