using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class UserCompletedSessions
    {
        public int UserId { get; set; }
        public int SessionId { get; set; }
        public int UserTestId { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
