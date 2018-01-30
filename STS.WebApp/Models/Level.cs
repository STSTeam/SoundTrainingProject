using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STS.WebApp.Models
{
    public class Level
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public virtual ICollection<Session> Sessions{ get; set; }
    }
}