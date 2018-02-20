using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.Repo
{
    public interface IUserRepository : IBaseRepository<User, int>
    {
        User Authenticate(string username, string password);     
        User Create(User user, string password);
        void Update(User user, string password = null);
    }
}
