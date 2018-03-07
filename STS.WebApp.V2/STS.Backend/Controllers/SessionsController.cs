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
    public class SessionsController : ApiBaseController
    {
        private ISessionRepository _sessionRepo;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public SessionsController(
            ISessionRepository sessionRepo,
            IMapper mapper,
            IOptions<AppSettings> appSettings)
        {
            _sessionRepo = sessionRepo;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return HlsOk(_mapper.Map<SessionDto>(_sessionRepo.Get(id)));
        }

        [HttpGet("GetByModuleId/{moduleId}")]
        public IActionResult GetBModuleId(int moduleId)
        {
            return HlsOk(_mapper.Map<List<SessionDto>>(_sessionRepo.GetByModuleId(moduleId)));
        }

        [HttpGet("GetSessionTrainingSounds/{sessionId}")]
        public IActionResult GetSessionTrainingSounds(int sessionId)
        {
            return HlsOk(_mapper.Map<List<SoundDto>>(_sessionRepo.GetSessionSounds(sessionId)));
        }

        [HttpGet("GetSoundImages/{soundId}")]
        public IActionResult GetSoundImages(int soundId)
        {
            return HlsOk(_mapper.Map<List<ImageDto>>(_sessionRepo.GetSoundImages(soundId)));
        }
    }
}
