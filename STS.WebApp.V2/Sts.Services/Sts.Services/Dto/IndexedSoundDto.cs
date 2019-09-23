using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sts.Services.Entities;

namespace Sts.Services.Dto
{
    public class SoundsByLetter
    {
        public string Letter { get; set; }
        public List<SoundDto> Sounds { get; set; }
    }
    public class SoundsByCategory
    {
        public List<SoundDto>AllSounds { get; set; }
        public List<ImageDto> AllImages { get; set; }
        public List<SoundImages> SoundImages { get; set; }
        public List<SoundsByLetter> AlphapaticSounds { get; set; }
        public List<SoundsByLetter> EnvSounds { get; set; }
    }
}
