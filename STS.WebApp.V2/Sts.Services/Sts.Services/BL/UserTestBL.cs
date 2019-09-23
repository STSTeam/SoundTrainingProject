using System;
using System.Collections.Generic;
using System.Linq;
using Sts.Services.Dto.UserTestModels;
using Sts.Services.Entities;
using Sts.Services.IRepo;

namespace Sts.Services.BL
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
            // get session info
            var sessionInfo = _sessionDA.Get(sessionId);

            // init new test model to be retuned
            var testModel = new TestModel();
            testModel.SessionId = sessionId;

            // get all session's sounds
            var sessionSoundsEntity = _userTestDA.GetSoundsBySessionId(sessionId);

            // get all session's images
            var sessionImages = _userTestDA.GetImagesBySessionId(sessionId);

            // sounds grouped by groupId
            var groupedSounds = from s in sessionSoundsEntity
                                group s by s.GroupId into g
                                select new
                                {
                                    GroupId = g.Key,
                                    Value = g.ToList()
                                };

            groupedSounds = groupedSounds.ToList();

            // from each sound group, take only one 1 sound and add it list of questions
            foreach (var s in groupedSounds)
            {
                // pick a random sound from this group
                var randomSoundInGroup = s.Value[GetRandomNumber(0, s.Value.Count - 1)];

                var testSound = new TestSound()
                {
                    Id = randomSoundInGroup.Id,
                    Name = randomSoundInGroup.Name
                };

                // get [correct] images for this sound
                var correctSoundImages = _userTestDA.GetSoundImages(sessionId, randomSoundInGroup.Id);
                var randomCorrectImage = correctSoundImages[GetRandomNumber(0, correctSoundImages.Count - 1)];

                // add correct image to sound option
                testSound.Images.Add(new TestImage()
                {
                    Id = randomCorrectImage.Id,
                    Name = randomCorrectImage.Name,
                    IsCorrectImage = true
                });

                // -------

                // pick a random image from list of all session images
                List<TestImage> randomWrongChoices = GetRandomWrongImages(sessionImages, randomCorrectImage.Id, sessionInfo.NumberOfChoices);
                
                // add wrong images list to images 
                testSound.Images.AddRange(randomWrongChoices);

                // randomize options
                testSound.Images = testSound.Images.OrderBy(m => Guid.NewGuid()).ToList();

                // add sound to testModel
                testModel.Sounds.Add(testSound);
            }
            
            testModel.Sounds = testModel.Sounds.OrderBy(m => Guid.NewGuid()).ToList();

            return testModel;
        }

        private List<TestImage> GetRandomWrongImages(List<Image> sessionImages, int correctImageIdToExclude, int numberOfChoices)
        {
            var imagesNameToExclude = new List<string>();
            var correctImageRef = sessionImages.FirstOrDefault(x => x.Id == correctImageIdToExclude);
            imagesNameToExclude.Add(correctImageRef.Name);
            
            var wrongImagesList = new List<TestImage>();

            for (int choicesCounter = 0; choicesCounter < numberOfChoices - 1; choicesCounter++)
            {
                // select image from sessionImages which name does not already exist in imagesNameToExclude
                var image = (from i in sessionImages
                            where !imagesNameToExclude.Exists(x => x.ToLower() == i.Name.ToLower())
                            select i).FirstOrDefault();

                if(image != null)
                {
                    wrongImagesList.Add(new TestImage()
                    {
                        Id = image.Id,
                        Name = image.Name,
                        IsCorrectImage = false
                    });

                    imagesNameToExclude.Add(image.Name);
                }
            }

            return wrongImagesList;
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

            resultModel = PrepareResult(model);

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
            var result = ((double)correctAnswersCount / sounds.Count) * 100;
            var tst = Math.Round(result, 2);
            return tst;
        }

        private int GetRandomNumber(int min, int max)
        {

            return (rnd.Next(min, max));
        }
    }
}
