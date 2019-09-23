using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Dto
{
    public class SixlingDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Descreption { get; set; }
        public string ImageName { get; set; }
        public string SoundName { get; set; }
        public SoundDto Sound { get; set; }
        public ImageDto Image { get; set; }

    }
}
