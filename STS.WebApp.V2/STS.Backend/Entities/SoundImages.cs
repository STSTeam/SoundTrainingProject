using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class SoundImages
    {
        [Key]
        public int SoundId { get; set; }
        [Key]
        public int ImageId { get; set; }
    }
}
