using System.Net;
using Microsoft.AspNetCore.Mvc;
using Sts.Services.Helpers;

namespace Sts.Services.Controllers
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
            var response = new HlsResponseData(resultData);
            return Json(response);
        }
    }
}