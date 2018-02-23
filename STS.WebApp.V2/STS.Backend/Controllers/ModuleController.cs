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

namespace WebApi.Controllers
{
    [Authorize]
    [Route("[controller]")]
    public class ModulesController : ApiBaseController
    {
        private IModuleRepository _moduleRepo;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public ModulesController(
            IModuleRepository moduleRepo,
            IMapper mapper,
            IOptions<AppSettings> appSettings)
        {
            _moduleRepo = moduleRepo;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            
            throw new AppException("my exception message");
            return HlsOk(_mapper.Map<IList<Dtos.ModuleDto>>(_moduleRepo.GetAll()));
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return Ok(_mapper.Map<ModuleDto>(_moduleRepo.Get(id)));
        }
    }
}
