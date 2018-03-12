using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class UserCompletedModules
    {
        public int UserId { get; set; }
        public int ModuleId { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
