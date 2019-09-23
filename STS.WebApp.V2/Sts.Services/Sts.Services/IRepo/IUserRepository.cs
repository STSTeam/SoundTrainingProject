using Sts.Services.Entities;

namespace Sts.Services.IRepo
{
    public interface IUserRepository : IBaseRepository<User, int>
    {
        User Authenticate(string username, string password);     
        User Create(User user, string password);
        void Update(User user, string password = null);
    }
}
