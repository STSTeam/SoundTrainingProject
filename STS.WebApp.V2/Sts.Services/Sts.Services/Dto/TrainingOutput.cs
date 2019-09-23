using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Dto
{
    public class GroupedSound
    {
        public int GroupId { get; set; }
        public List<SoundDto> Sounds { get; set; }
    }
}
