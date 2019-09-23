using System.Collections.Generic;
using System.Linq;
using Dapper;
using Sts.Services.Entities;
using Sts.Services.IRepo;

namespace Sts.Services.Repo
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

        public List<Image> GetSoundImages(int soundId)
        {
            var parms = new DynamicParameters();
            parms.Add("@soundId", soundId);
            var reader = dbConnection.Query<Image>("images_GetBySoundId", parms, commandType: System.Data.CommandType.StoredProcedure);
            return reader.AsList<Image>();
        }
    }
}
