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
    [Route("api/[controller]")]
    public class UserTestController : ApiBaseController
    {
        IUserTestRepository _userTestDA;
        IBaseRepository<Sound, int> _soundDA;
        UserTestBL _userTestBL;
        IBaseRepository<UserTestSounds, int> _userTestSoundsDA;
        IBaseRepository<Session, int> _sessionDA;
        IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA;
        IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA;
        IModuleRepository _moduleBL;

        public UserTestController(IUserTestRepository _userTestDA,
            IBaseRepository<Sound, int> _soundDA,
            IBaseRepository<UserTestSounds, int> _userTestSoundsDA,
            IBaseRepository<Session, int> _sessionDA,
            IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA,
            IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA,
            IModuleRepository _moduleBL)
        {
            this._userTestDA = _userTestDA;
            this._soundDA = _soundDA;
            this._userTestSoundsDA = _userTestSoundsDA;
            this._sessionDA = _sessionDA;
            this._userCompletedModulesDA = _userCompletedModulesDA;
            this._userCompletedSessionsDA = _userCompletedSessionsDA;
            this._moduleBL = _moduleBL;

            _userTestBL = new UserTestBL
                (this._userTestDA,
                this._soundDA,
                this._userTestSoundsDA,
                this._sessionDA,
                this._userCompletedModulesDA,
                this._userCompletedSessionsDA,
                this._moduleBL);

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
           
            return HlsOk( _userTestBL.SaveTest(model));
        }
    }
}