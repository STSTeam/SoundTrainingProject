using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class Book
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }

    }
}
