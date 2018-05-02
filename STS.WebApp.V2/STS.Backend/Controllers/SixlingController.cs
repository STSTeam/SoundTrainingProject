using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using WebApi.Dtos;
using AutoMapper;
using System.IdentityModel.Tokens.Jwt;
using WebApi.Helpers;
using Microsoft.Extensions.Options;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using WebApi.Entities;
using Microsoft.AspNetCore.Authorization;
using WebApi.Repo;
using WebApi.BL;
using System.Linq;
using WebApi.Dtos.UserTestModels;

namespace WebApi.Controllers
{
    [Authorize]
    [Route("[controller]")]
    public class SixlingController : ApiBaseController
    {
        IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;
        IBaseRepository<Sixling, int> _sixlingDA;
        IBaseRepository<Sound, int> _soundDA;
        IBaseRepository<Image, int> _imageDA;

        public SixlingController(
            IMapper mapper,
            IOptions<AppSettings> appSettings,
            IBaseRepository<Sixling, int> sixlingDA,
            IBaseRepository<Sound, int> soundDA,
          IBaseRepository<Image, int> imageDA)
        {
            _mapper = mapper;
            _appSettings = appSettings.Value;
            _sixlingDA = sixlingDA;
            _soundDA = soundDA;
            _imageDA = imageDA;
        }

        [HttpGet]
        [Route("gettraining")]
        public IActionResult GetTraining()
        {
            return HlsOk(_mapper.Map<IList<SixlingDto>>(_sixlingDA.GetAll()));
        }

        [HttpGet("gettest")]
        public IActionResult GetById()
        {
            var testModel = new TestModel();
            testModel.SessionId = 0;

            // get all sixlig items 
            var sixligItems = _sixlingDA.GetAll().ToList();

            sixligItems.ForEach(item =>
            {
                var testSound = new TestSound()
                {
                    Id = 0,
                    Name = item.SoundName
                };

                // add correct image name to current sound
                testSound.Images.Add(new TestImage()
                {
                    Id = 0,
                    IsCorrectImage = true,
                    Name = item.ImageName
                });

                // get a random image other than current item
                var randWrongImage = sixligItems.FirstOrDefault(i => i.Id != item.Id);

                // add rand. image
                testSound.Images.Add(new TestImage()
                {
                    Id = 0,
                    IsCorrectImage = false,
                    Name = randWrongImage.ImageName
                });

                testSound.Images = testSound.Images.OrderBy(m => Guid.NewGuid()).ToList();

                // add sound to testModel
                testModel.Sounds.Add(testSound);
            });

            testModel.Sounds = testModel.Sounds.OrderBy(m => Guid.NewGuid()).ToList();

            // randmoize order and return result
            return HlsOk(testModel);
        }
    }
}
