using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Entities
{
    public class UserTestSounds
    {
        public int Id { get; set; }
        public int UserTestId { get; set; }
        public int SoundId { get; set; }
        public int SelectedImageId { get; set; }
        public bool IsCorrect { get; set; }
    }
}
