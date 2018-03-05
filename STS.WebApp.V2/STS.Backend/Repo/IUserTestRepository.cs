using System.Collections.Generic;
using WebApi.Entities;

namespace WebApi.Repo
{
    public interface IUserTestRepository : IBaseRepository<UserTest, int>
    {
        List<Sound> GetSoundsBySessionId(int sessionId);
        List<Image> GetImagesBySessionId(int sessionId);
        List<Image> GetSoundImages(int sessionId, int soundId);
    }
}