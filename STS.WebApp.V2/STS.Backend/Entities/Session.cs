using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class Session
    {
        public int Id { get; set; }
        public int ModuleId { get; set; }
        public string Title { get; set; }
        public string Descreption { get; set; }
        public int Order { get; set; }
        public string ImageName { get; set; }
        public int? PrerequisiteSessionId { get; set; }
        public bool IsLastSession { get; set; }
    }
}
