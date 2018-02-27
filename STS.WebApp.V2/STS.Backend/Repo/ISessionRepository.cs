using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.Repo
{
    public interface ISessionRepository : IBaseRepository<Session, int>
    {
        List<Session> GetByModuleId(int moduleId);

        List<Sound> GetSessionSounds(int sessionId);
        List<Image> GetSoundImages(int soundId);
    }
}
