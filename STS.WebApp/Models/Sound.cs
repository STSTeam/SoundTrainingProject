using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STS.WebApp.Models
{
    public class Sound
    {
        public int Id { get; set; }
        [Required]
        public int SessionId { get; set; }
        public string Name { get; set; }
        public virtual Session Session { get; set; }
        public virtual ICollection<Image> Images { get; set; }
    }

    
}