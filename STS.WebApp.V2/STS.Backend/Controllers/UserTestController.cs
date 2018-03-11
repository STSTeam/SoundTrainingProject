using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApi.BL;
using WebApi.Dtos.UserTestModels;
using WebApi.Entities;
using WebApi.Repo;

namespace WebApi.Controllers
{
    [Authorize]
    [Route("[controller]")]
    public class UserTestController : ApiBaseController
    {
        IUserTestRepository _userTestDA;
        IBaseRepository<Sound, int> _soundDA;
        UserTestBL _userTestBL;
        public UserTestController(IUserTestRepository _userTestDA,
             IBaseRepository<Sound, int> _soundDA)
        {
            this._userTestDA = _userTestDA;
            this._soundDA = _soundDA;

            _userTestBL = new UserTestBL(this._userTestDA, this._soundDA);

        }



        [HttpGet("GetTestBySessionId/{sessionId}")]
        public IActionResult GetTestBySessionId(int sessionId)
        {
            var test = _userTestBL.GenerateTest(sessionId);
            return HlsOk(test);
        }

        [HttpPost("submitTest")]
        public IActionResult SubmitTest([FromBody]TestModel model)
        {
            _userTestBL.SaveTest(model);
            return HlsOk();
        }
    }
}