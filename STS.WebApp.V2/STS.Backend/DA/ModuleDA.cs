﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Repo;
using Dapper;
using WebApi.Helpers;

namespace WebApi.DA
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
