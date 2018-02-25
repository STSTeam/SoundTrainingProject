using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Repo;
using Dapper;
using WebApi.Helpers;

namespace WebApi.DA
{
    public class SessionDA : BaseDataAccess<Session, int>, ISessionRepository
    {
        public List<Session> GetByModuleId(int moduleId)
        {
            return dbConnection.GetList<Session>(new { ModuleId = moduleId }).ToList();
        }

        public List<Sound> GetSessionSounds(int sessionId)
        {
            var parms = new DynamicParameters();
            parms.Add("@sessionId", sessionId);
            var reader = dbConnection.Query<Sound>("sounds_GetBySessionId", parms, commandType: System.Data.CommandType.StoredProcedure);
            return reader.AsList<Sound>();
        }
    }
}
