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

        private Random rnd = new Random();

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
                var filterImages = sessionImages.Where(i => i.Id != randomCorrectImage.Id).ToList();
                var randImage = filterImages
                                .ElementAt(GetRandomNumber(0, filterImages.Count - 1));
                testSound.Images.Add(new TestImage()
                {
                    Id = randImage.Id,
                    Name = randImage.Name,
                    IsCorrectImage = false
                });

                testSound.Images = testSound.Images.OrderBy(m => Guid.NewGuid()).ToList();
                // add sound to testModel
                testModel.Sounds.Add(testSound);
            });

            testModel.Sounds = testModel.Sounds.OrderBy(m => Guid.NewGuid()).ToList();

            return testModel;
        }

        private int GetRandomNumber(int min, int max)
        {

            return (rnd.Next(min, max));
        }
    }
}
