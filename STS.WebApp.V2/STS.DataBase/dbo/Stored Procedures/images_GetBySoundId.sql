-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[images_GetBySoundId]
	-- Add the parameters for the stored procedure here
	@soundId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select 
	Image.Id
	,Image.Name
 from SoundImages
inner join Image on Image.Id =SoundImages.ImageId
where SoundImages.SoundId = @soundId

END