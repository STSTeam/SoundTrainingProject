using AutoMapper;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Dtos.UserTestModels;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Repo;

namespace WebApi.BL
{
    public class UserTestBL
    {
        private IUserTestRepository _userTestDA;
        IBaseRepository<Sound, int> _soundDA;

        public UserTestBL(
            IUserTestRepository _userTestDA,
            IBaseRepository<Entities.Sound, int> _soundDA)
        {
            this._userTestDA = _userTestDA;
            this._soundDA = _soundDA;
        }

        public TestModel GenerateTest(int sessionId)
        {
            var testModel = new TestModel();
            testModel.ModuleId = 1;
            testModel.SessionId = sessionId;
            
            // get all sounds for session
            var sessionSoundsEntity = _userTestDA.GetSoundsBySessionId(sessionId);
            var sessionImages = _userTestDA.GetImagesBySessionId(sessionId);

            sessionSoundsEntity.ForEach(soundEntity =>
            {
                var testSound = new TestSound()
                {
                    Id = soundEntity.Id,
                    Name = soundEntity.Name
                };

                // get [correct] images for this sound
                var correctSoundImages = _userTestDA.GetSoundImages(sessionId, soundEntity.Id);
                var randomCorrectImage = correctSoundImages[GetRandomNumber(0, correctSoundImages.Count - 1)];

                // add correct image to sound option
                testSound.Images.Add(new TestImage()
                {
                    Id = randomCorrectImage.Id,
                    Name = randomCorrectImage.Name,
                    IsCorrectImage = true
                });

                // pick a random image from list of all session images
                var randImage = sessionImages[GetRandomNumber(0, sessionImages.Count - 1)];
                testSound.Images.Add(new TestImage()
                {
                    Id = randomCorrectImage.Id,
                    Name = randomCorrectImage.Name,
                    IsCorrectImage = false
                });

                // add sound to testModel
                testModel.Sounds.Add(testSound);
            });

            return testModel;
        }

        private int GetRandomNumber(int min, int max)
        {
            Random rnd = new Random();
            return (rnd.Next(min, max));
        }
    }
}
