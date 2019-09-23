using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Sts.Services.Dto;
using Sts.Services.Entities;
using Sts.Services.Helpers;
using Sts.Services.IRepo;

namespace Sts.Services.Controllers
{
    [Route("api/[controller]")]
    public class SoundsController : ApiBaseController
    {
        IBaseRepository<Sound, int> _soundsDA;
        IBaseRepository<Image, int> _imagesDA;
        IBaseRepository<SoundImages, int> _soundImagesDA;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public SoundsController(

            IMapper mapper,
            IOptions<AppSettings> appSettings,
             IBaseRepository<Sound, int> _soundsDA,
              IBaseRepository<SoundImages, int> _soundImagesDA,
              IBaseRepository<Image, int> _imagesDA)
        {
            _mapper = mapper;
            _appSettings = appSettings.Value;
            this._soundsDA = _soundsDA;
            this._soundImagesDA = _soundImagesDA;
            this._imagesDA = _imagesDA;
        }

        [HttpGet("GetAllSoundsIndexed")]
        public IActionResult GetAllSoundsIndexed()
        {
            var allSounds = _mapper.Map<List<SoundDto>>(_soundsDA.GetAll());
            var allImages = _mapper.Map<List<ImageDto>>(_imagesDA.GetAll());
            var allSoundImages = _soundImagesDA.GetAll().ToList();

            var alphapaticSounds = allSounds
                                    .Where(s => s.IsAlphabeticIndexed)
                                    .OrderBy(s => s.DisplayName)
                                    .GroupBy(s => s.DisplayName[0]).ToList();

            var envSounds = allSounds
                                    .Where(s => !s.IsAlphabeticIndexed)
                                    .OrderBy(s => s.DisplayName)
                                    .GroupBy(s => s.DisplayName[0]).ToList();

            var indexedSoundDto = new SoundsByCategory()
            {
                AllSounds = allSounds,
                AllImages = allImages,
                SoundImages = allSoundImages,
                AlphapaticSounds = OrganizeGroupsToDtos(alphapaticSounds),
                EnvSounds = OrganizeGroupsToDtos(envSounds)
            };

            return HlsOk(indexedSoundDto);
        }

        private List<SoundsByLetter> OrganizeGroupsToDtos(List<IGrouping<char, SoundDto>> sounds)
        {
            List<SoundsByLetter> soundsIndexDtos = new List<SoundsByLetter>();

            sounds.ForEach(letter =>
            {
                var l = letter.Key.ToString();
                soundsIndexDtos.Add(new SoundsByLetter()
                {
                    Letter = l,
                    Sounds = _mapper.Map<List<SoundDto>>(letter.ToList())
                });
            });

            return soundsIndexDtos;
        }




    }
}
