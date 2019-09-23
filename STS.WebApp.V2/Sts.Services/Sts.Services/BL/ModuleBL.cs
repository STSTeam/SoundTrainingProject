using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using Sts.Services.Entities;
using Sts.Services.IRepo;

namespace Sts.Services.BL
{
    public class ModuleBL
    {
        IModuleRepository _moduleDA;
        IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA;
        IMapper _mapper;

        public ModuleBL(
            IModuleRepository _moduleDA,
            IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA)
        {
            this._moduleDA = _moduleDA;
            this._userCompletedModulesDA = _userCompletedModulesDA;
        }

        public List<Module> GetAll(int userId)
        {
            var modules = _moduleDA.GetAll().ToList();

            // for each module, check if it prerequist,
            // if yes, check if current user completed the prerequsit
            var userCompletedModules = _userCompletedModulesDA.GetAll().Where(cm => cm.UserId == userId).ToList();

            modules.ForEach(m =>
            {
                bool enabled = true;
                if (m.PrerequisiteModuleId.HasValue)
                {
                    // check that prerequsit module id exist in user complted modules list
                    enabled = userCompletedModules.Exists(c => c.ModuleId == m.PrerequisiteModuleId.Value);

                }
                m.Enabled = enabled;
            });

            return modules;
        }

        public void MarkModuleAsCompleted(int userId, int moduleId)
        {
            // check if module already marked for user
            if (_userCompletedModulesDA.GetList(new { UserId = userId, ModuleId = moduleId }).ToList().Count <= 0)
            {
                var e = new UserCompletedModules()
                {
                    UserId = userId,
                    ModuleId = moduleId,
                    CreatedDate = DateTime.Now
                };
                _moduleDA.InsertUserModuleProgress(e);
            }
        }
    }
}
