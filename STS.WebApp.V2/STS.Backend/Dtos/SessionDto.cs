using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos
{
    public class SessionDto
    {
        public int Id { get; set; }
        public int ModuleId { get; set; }
        public string Title { get; set; }
    }
}
