using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace STS.FolderOrginzerApp.models
{
    // 1
    public class Sound
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    //2
    public class Image
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    // 3
    public class SessionsSounds
    {
        public int SessionId { get; set; }
        public int SoundId { get; set; }
    }

    //4
    public class SoundImages
    {
        public int SoundId { get; set; }
        public int ImageId { get; set; }
    }
}
