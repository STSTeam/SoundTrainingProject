using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Entities
{
    public class UserTest
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int SessionId { get; set; }
        public double Score { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
