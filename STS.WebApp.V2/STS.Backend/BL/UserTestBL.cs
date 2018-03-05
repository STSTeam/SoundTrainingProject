using AutoMapper;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Repo;

namespace WebApi.BL
{
    public class UserTestBL
    {
        private IModuleRepository _moduleRepo;
        private IUserTestRepository _userTestDA;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public UserTestBL(IModuleRepository moduleRepo,
            IMapper mapper,
            IOptions<AppSettings> appSettings,
            IUserTestRepository _userTestDA)
        {
            _moduleRepo = moduleRepo;
            _mapper = mapper;
            _appSettings = appSettings.Value;
            this._userTestDA = _userTestDA;
        }

        public List<Module> GetAllModules()
        {
            
            return _moduleRepo.GetAll().ToList();
        }
    }
}
