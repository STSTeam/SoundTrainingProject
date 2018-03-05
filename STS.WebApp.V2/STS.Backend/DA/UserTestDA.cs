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
    }
}
