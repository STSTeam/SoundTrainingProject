using AutoMapper;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using WebApi.Dtos;
using WebApi.Dtos.UserTestModels;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Repo;

namespace WebApi.BL
{
    public class SessionBL
    {
        ISessionRepository _sessionDA;
        IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA;

        public SessionBL(
            ISessionRepository _sessionDA,
            IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA)
        {
            this._sessionDA = _sessionDA;
            this._userCompletedSessionsDA = _userCompletedSessionsDA;
        }

        public List<Session> GetAllByModuleId(int userId, int moduleId)
        {
            var sessions = _sessionDA.GetByModuleId(moduleId).ToList();

            // for each module, check if it prerequist,
            // if yes, check if current user completed the prerequsit
            var userCompletedSessions = _userCompletedSessionsDA.GetAll().Where(cs => cs.UserId == userId).ToList();

            sessions.ForEach(m =>
            {
                bool enabled = true;
                if (m.PrerequisiteSessionId.HasValue)
                {
                    // check that prerequsit module id exist in user complted modules list
                    enabled = userCompletedSessions.Exists(c => c.SessionId == m.PrerequisiteSessionId.Value);

                }
                m.Enabled = enabled;
            });

            return sessions;
        }
    }
}
