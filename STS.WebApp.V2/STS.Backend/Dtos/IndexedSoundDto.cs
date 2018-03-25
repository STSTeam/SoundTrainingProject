using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.Dtos
{
    public class SoundsByLetter
    {
        public string Letter { get; set; }
        public List<SoundDto> Sounds { get; set; }
    }
    public class SoundsByCategory
    {
        public List<SoundsByLetter> AlphapaticSounds { get; set; }
        public List<SoundsByLetter> EnvSounds { get; set; }
    }
}
