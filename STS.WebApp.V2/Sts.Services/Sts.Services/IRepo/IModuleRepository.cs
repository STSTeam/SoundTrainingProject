using Sts.Services.Entities;

namespace Sts.Services.IRepo
{
    public interface IModuleRepository : IBaseRepository<Module, int>
    {
        void InsertUserModuleProgress(UserCompletedModules model);
    }
}
