using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using WebApi.Dtos;
using AutoMapper;
using System.IdentityModel.Tokens.Jwt;
using WebApi.Helpers;
using Microsoft.Extensions.Options;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using WebApi.Entities;
using Microsoft.AspNetCore.Authorization;
using WebApi.Repo;
using WebApi.BL;

namespace WebApi.Controllers
{
   [Authorize]
    [Route("api/[controller]")]
    public class ModulesController : ApiBaseController
    {
        private IModuleRepository _moduleRepo;
        IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;
        private ModuleBL _moduleBL;

        public ModulesController(
            IModuleRepository moduleRepo,
            IMapper mapper,
            IOptions<AppSettings> appSettings,
            IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA)
        {
            _moduleRepo = moduleRepo;
            _mapper = mapper;
            _appSettings = appSettings.Value;
            this._userCompletedModulesDA = _userCompletedModulesDA;

            _moduleBL = new ModuleBL(_moduleRepo, _userCompletedModulesDA);
        }

        [HttpGet]
        [Route("GetAll/{userId}")]
        public IActionResult GetAll(int userId)
        {
            return HlsOk(_mapper.Map<IList<ModuleDto>>(_moduleBL.GetAll(userId)));  
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return HlsOk(_mapper.Map<ModuleDto>(_moduleRepo.Get(id)));
        }

        [HttpPost("markModuleAsCompleted")]
        public IActionResult MarkModuleAsCompleted([FromBody]MarkModuleAsCompletedInputDto input)
        {
            _moduleBL.MarkModuleAsCompleted(input.UserId, input.ModuleId);
            return HlsOk();
        }
    }
}
