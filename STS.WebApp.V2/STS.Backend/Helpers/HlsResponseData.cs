using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Controllers
{
    public class HlsResponseData
    {
        public bool IsSuccess { get; internal set; }
        public string ErrorMessage { get; internal set; }
        public object ResultData { get; set; }
        public string ErrorCode { get; set; }
        public HlsResponseData(bool isSuccess, string errorMessage = null, object resultData = null, string errorCode = null)
        {
            IsSuccess = isSuccess;
            ResultData = resultData;
            ErrorMessage = errorMessage;
            ErrorCode = errorCode;
        }
    }
}
