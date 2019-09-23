using System.Collections.Generic;
using Sts.Services.Entities;

namespace Sts.Services.IRepo
{
    public interface IUserTestRepository : IBaseRepository<UserTest, int>
    {
        List<Sound> GetSoundsBySessionId(int sessionId);
        List<Image> GetImagesBySessionId(int sessionId);
        List<Image> GetSoundImages(int sessionId, int soundId);
        void InsertUserSessionProgress(UserCompletedSessions model);
        void InsertUserModuleProgress(UserCompletedModules model);

    }
}