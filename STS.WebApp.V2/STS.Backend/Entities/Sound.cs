﻿using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class Sound
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
