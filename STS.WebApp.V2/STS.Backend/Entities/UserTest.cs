﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class UserTest
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ModuleId { get; set; }
        public int SessionId { get; set; }
        public decimal Score { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
