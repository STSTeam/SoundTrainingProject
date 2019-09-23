using System.Collections.Generic;
using Sts.Services.Entities;

namespace Sts.Services.IRepo
{
    public interface ISessionRepository : IBaseRepository<Session, int>
    {
        List<Session> GetByModuleId(int moduleId);

        List<Sound> GetSessionSounds(int sessionId);
        List<Image> GetSoundImages(int soundId);
    }
}
