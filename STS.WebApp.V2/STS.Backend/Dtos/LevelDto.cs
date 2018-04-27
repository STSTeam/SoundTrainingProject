using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos
{
    public class LevelDto
    {
        public int levelId { get; set; }
        public string levelName { get; set; }
        public string levelDescreption { get; set; }
        public string levelImageName { get; set; }
    }
}
