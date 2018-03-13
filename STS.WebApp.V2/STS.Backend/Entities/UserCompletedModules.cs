using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class UserCompletedModules
    {
        [Key]
        public int UserId { get; set; }
        [Key]
        public int ModuleId { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
