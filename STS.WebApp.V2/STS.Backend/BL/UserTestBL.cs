using AutoMapper;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
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
        IBaseRepository<UserTestSounds, int> _userTestSoundsDA;
        IBaseRepository<Session, int> _sessionDA;
        IModuleRepository _moduleBL;
        IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA;
        IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA;

        private Random rnd = new Random();

        public UserTestBL(
            IUserTestRepository _userTestDA,
            IBaseRepository<Entities.Sound, int> _soundDA,
            IBaseRepository<UserTestSounds, int> _userTestSoundsDA,
            IBaseRepository<Session, int> _sessionDA,
            IBaseRepository<UserCompletedModules, int> _userCompletedModulesDA,
            IBaseRepository<UserCompletedSessions, int> _userCompletedSessionsDA,
            IModuleRepository _moduleBL)
        {
            this._userTestDA = _userTestDA;
            this._soundDA = _soundDA;
            this._userTestSoundsDA = _userTestSoundsDA;
            this._sessionDA = _sessionDA;
            this._userCompletedModulesDA = _userCompletedModulesDA;
            this._userCompletedSessionsDA = _userCompletedSessionsDA;
            this._moduleBL = _moduleBL;
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

        internal ResultModel SaveTest(TestModel model)
        {
            double score = 0.0;

            var resultModel = new ResultModel();

            score = CalculateTestScore(model.Sounds);

            // 01 - create new test record
            var testId = InsertTest(model);

            // 02 - Fill test details (sounds and Selected images)
            SaveTestSounds(model, testId);

            if (IsTestPass(score))
            {
                // Update Module Progress
                UpdateUserProgressProgress(model, testId);
            }

            resultModel  =  PrepareResult(model);

            return resultModel;
        }

        private ResultModel PrepareResult(TestModel model)
        {
            var result = new ResultModel();
            result.Score = CalculateTestScore(model.Sounds);
            result.IsPassed = IsTestPass(result.Score);
            result.TotalSounds = model.Sounds.Count;
            result.TotalCorrect = model.Sounds.Count(s => s.SelectedAnswer.IsCorrectImage);
            result.TotalWrong = model.Sounds.Count(s => s.SelectedAnswer.IsCorrectImage == false);
            result.NextModuleId = GetNextModuleId(model);
            result.NextSessionId = GetNextSessionId(model);

            return result;
        }

        private int GetNextSessionId(TestModel model)
        {
            return 0;
        }

        private int GetNextModuleId(TestModel model)
        {
            return 0;
        }

        private void UpdateUserProgressProgress(TestModel model, int testId)
        {
            var currentDateTime = DateTime.Now;

            var session = _sessionDA.Get(model.SessionId);

            // update session progress by inserting new record in UserCompletedSessions table
            _userTestDA.InsertUserSessionProgress(new UserCompletedSessions
            {
                SessionId = model.SessionId,
                UserId = model.userId.Value,
                UserTestId = testId,
                CreatedDate = currentDateTime
            });

            // check if session marked as final step in module
            if (session.IsLastSession)
            {
                // update module progress
                _userTestDA.InsertUserModuleProgress(new UserCompletedModules()
                {
                    ModuleId = session.ModuleId,
                    UserId = model.userId.Value,
                    CreatedDate = currentDateTime
                });
            }
        }

        private bool IsTestPass(double? score)
        {
            if (score > 50.0)
                return true;
            else return false;
        }

        private void SaveTestSounds(TestModel model, int testId)
        {
            model.Sounds.ForEach(sound =>
            {
                _userTestSoundsDA.Add(new UserTestSounds()
                {
                    UserTestId = testId,
                    SoundId = sound.Id,
                    SelectedImageId = sound.SelectedAnswer.Id,
                    IsCorrect = sound.SelectedAnswer.IsCorrectImage
                });
            });
        }

        private int InsertTest(TestModel model)
        {
            var testModel = new UserTest()
            {
                UserId = model.userId.Value,
                SessionId = model.SessionId,
                Score = CalculateTestScore(model.Sounds),
                CreatedDate = DateTime.Now
            };

            return _userTestDA.Add(testModel);
        }

        private double CalculateTestScore(List<TestSound> sounds)
        {
            var correctAnswersCount = sounds.Count(s => s.SelectedAnswer.IsCorrectImage);
            return ((double)correctAnswersCount / sounds.Count) * 100;
        }

        private int GetRandomNumber(int min, int max)
        {

            return (rnd.Next(min, max));
        }
    }
}
