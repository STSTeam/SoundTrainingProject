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
    [Route("[controller]")]
    public class SessionsController : ApiBaseController
    {
        private ISessionRepository _sessionRepo;
        IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;
        private SessionBL _sessionBL;

        public SessionsController(
            ISessionRepository sessionRepo,
            IMapper mapper,
            IOptions<AppSettings> appSettings,
            IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA)
        {
            _sessionRepo = sessionRepo;
            this._userCompletedSessionsDA = _userCompletedSessionsDA;
            _mapper = mapper;
            _appSettings = appSettings.Value;

            _sessionBL = new SessionBL(_sessionRepo, _userCompletedSessionsDA);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            return HlsOk(_mapper.Map<SessionDto>(_sessionRepo.Get(id)));
        }

        [HttpGet("GetByModuleId/{userId}/{moduleId}")]
        public IActionResult GetBModuleId(int userId, int moduleId)
        {
            return HlsOk(_mapper.Map<List<SessionDto>>(_sessionBL.GetAllByModuleId(userId, moduleId)));
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
