using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace WebApi.Controllers
{
    public class ApiBaseController : Controller
    {
        protected IActionResult HlsOk()
        {
            return CreateHLSResponse(HttpStatusCode.OK, true);
        }

        protected IActionResult HlsOk(object resultData)
        {
            return CreateHLSResponse(HttpStatusCode.OK, true, resultData);
        }

        IActionResult CreateHLSResponse(HttpStatusCode httpStatusCode, bool isSuccess,
           object resultData = null, string errorMessage = null, string errorCode = null)
        {
            var response = new HlsResponseData(isSuccess, errorMessage, resultData, errorCode: errorCode);
            return Content(JsonConvert.SerializeObject(response));
        }
    }
}