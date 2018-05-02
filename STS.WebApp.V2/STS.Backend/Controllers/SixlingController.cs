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
using System.Linq;

namespace WebApi.Controllers
{
    [Authorize]
    [Route("[controller]")]
    public class SixlingController : ApiBaseController
    {
        IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;
        IBaseRepository<Sixling, int> _sixlingDA;
        IBaseRepository<Sound, int> _soundDA;
        IBaseRepository<Image, int> _imageDA;

        public SixlingController(
            IMapper mapper,
            IOptions<AppSettings> appSettings,
            IBaseRepository<Sixling, int> sixlingDA,
            IBaseRepository<Sound, int> soundDA,
          IBaseRepository<Image, int> imageDA)
        {
            _mapper = mapper;
            _appSettings = appSettings.Value;
            _sixlingDA = sixlingDA;
            _soundDA = soundDA;
            _imageDA = imageDA;
        }

        [HttpGet]
        [Route("gettraining")]
        public IActionResult GetTraining()
        {
            return HlsOk(_mapper.Map<IList<SixlingDto>>(_sixlingDA.GetAll()));
        }

        //[HttpGet("{id}")]
        //public IActionResult GetById(int id)
        //{
        //    return HlsOk(_mapper.Map<ModuleDto>(_moduleRepo.Get(id)));
        //}
    }
}
