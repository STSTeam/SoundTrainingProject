using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos
{
    public class ModuleDto
    {
        public int Id { get; set; }
        public int Order { get; set; }
        public string Title { get; set; }
        public string Descreption { get; set; }
        public string ImageName { get; set; }
        public int? PrerequisiteModuleId { get; set; }
    }
}
