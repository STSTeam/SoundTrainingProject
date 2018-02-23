using System;
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

    }
}
