
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[images_GetBySessionIdAndSoundId]
	-- Add the parameters for the stored procedure here
	@sessionId int,
	@soundId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select 
	image.*
 from SoundImages
inner join Image on Image.Id =SoundImages.ImageId
inner join SessionsSounds on SessionsSounds.SoundId = SoundImages.SoundId
where SoundImages.SoundId = @soundId and SessionsSounds.SessionId = @sessionId

END