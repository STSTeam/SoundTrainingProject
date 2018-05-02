using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class Sixling
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Descreption { get; set; }
        public string ImageName { get; set; }
        public string SoundName { get; set; }
       
    }
}
