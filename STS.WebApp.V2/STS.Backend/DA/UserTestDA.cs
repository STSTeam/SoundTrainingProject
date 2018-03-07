using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Repo;

namespace WebApi.DA
{
    public class UserTestDA : BaseDataAccess<UserTest, int>, IUserTestRepository
    {
        public List<Sound> GetSoundsBySessionId(int sessionId)
        {
            var parms = new DynamicParameters();
            parms.Add("@sessionId", sessionId);
            var reader = dbConnection.Query<Sound>("sounds_GetBySessionId", parms, commandType: System.Data.CommandType.StoredProcedure);
            return reader.AsList<Sound>();
        }

        public List<Image> GetImagesBySessionId(int sessionId)
        {
            var parms = new DynamicParameters();
            parms.Add("@sessionId", sessionId);
            var reader = dbConnection.Query<Image>("images_GetBySessionId", parms, commandType: System.Data.CommandType.StoredProcedure);
            return reader.AsList<Image>();
        }

        public List<Image> GetSoundImages(int sessionId, int soundId)
        {
            var parms = new DynamicParameters();
            parms.Add("@sessionId", sessionId);
            parms.Add("@soundId", soundId);
            var reader = dbConnection.Query<Image>("images_GetBySessionIdAndSoundId", parms, commandType: System.Data.CommandType.StoredProcedure);
            return reader.AsList<Image>();
        }
    }
}
