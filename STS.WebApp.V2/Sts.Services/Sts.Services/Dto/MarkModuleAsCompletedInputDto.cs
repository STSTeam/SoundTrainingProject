using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Dto
{
    public class MarkModuleAsCompletedInputDto
    {
        [Required]
        public int UserId { get; set; }
        [Required]
        public int ModuleId { get; set; }
    }
}
