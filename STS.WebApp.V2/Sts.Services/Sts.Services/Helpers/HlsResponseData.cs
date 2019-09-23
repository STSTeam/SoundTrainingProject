namespace Sts.Services.Helpers
{
    public class HlsResponseData
    {
        public object ResultData { get; set; }
        public HlsResponseData( object resultData = null)
        {
            ResultData = resultData;
        }
    }
}
