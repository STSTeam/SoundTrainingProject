using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Helpers
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
