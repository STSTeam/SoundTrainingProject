using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos
{
    public class SoundDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool IsAlphabeticIndexed { get; set; }
        public int? GroupId { get; set; }
        public List<ImageDto> Images { get; set; }
    }
}
