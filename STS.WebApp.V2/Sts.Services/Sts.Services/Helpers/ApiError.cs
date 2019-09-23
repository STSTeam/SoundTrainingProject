namespace Sts.Services.Helpers
{
    public class ApiError
    {
        public string ErrorMessage { get; set; }
        public string ErrorDetails { get; set; }
        

        public ApiError(string errorMessage)
        {
            this.ErrorMessage = errorMessage;
        }

    }
}
