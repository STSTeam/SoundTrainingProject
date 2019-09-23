using Dapper;
using Sts.Services.Entities;
using Sts.Services.IRepo;

namespace Sts.Services.Repo
{
    public class ModuleDA : BaseDataAccess<Module, int>, IModuleRepository
    {
        public void InsertUserModuleProgress(UserCompletedModules model)
        {
            var parms = new DynamicParameters();
            parms.Add("@userId", model.UserId);
            parms.Add("@moduleId", model.ModuleId);
            var reader = dbConnection.Execute("UserCompletedModules_insert", parms, commandType: System.Data.CommandType.StoredProcedure);

        }
    }
}
