using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.Repo
{
    public interface IModuleRepository : IBaseRepository<Module, int>
    {
        void InsertUserModuleProgress(UserCompletedModules model);
    }
}
