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

        [HttpGet("getLevelSessionsByLevelId/{moduleId}/{levelId}")]
        public IActionResult GetLevelSessionsByLevelId(int moduleId, int levelId)
        {
            var ls = _sessionRepo.GetList(new { ModuleId = moduleId, LevelId = levelId }).ToList();
            return HlsOk(_mapper.Map<List<Session>>(ls));
        }

        [HttpGet("GetAllLevelsByModuleId/{userId}/{moduleId}")]
        public IActionResult GetBModuleId(int userId, int moduleId)
        {
            return HlsOk(_sessionBL.GetAllLevelsByModuleId(userId, moduleId));
        }

        [HttpGet("GetSessionTrainingSounds/{sessionId}")]
        public IActionResult GetSessionTrainingSounds(int sessionId)
        {
            var sounds = _mapper.Map<List<SoundDto>>(_sessionRepo.GetSessionSounds(sessionId));
            sounds.ForEach(s =>
            {
                s.Images = _mapper.Map<List<ImageDto>>(_sessionRepo.GetSoundImages(s.Id));
            });


            // sounds grouped by groupId
            var groupedSounds = (from s in sounds
                                group s by s.GroupId into g
                                select new GroupedSound
                                {
                                    GroupId = g.Key.Value,
                                    Sounds = g.ToList()
                                }).ToList();

            return HlsOk(_mapper.Map<List<GroupedSound>>(groupedSounds));
        }

        [HttpGet("GetSoundImages/{soundId}")]
        public IActionResult GetSoundImages(int soundId)
        {
            return HlsOk(_mapper.Map<List<ImageDto>>(_sessionRepo.GetSoundImages(soundId)));
        }
    }
}
