using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Controllers
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
