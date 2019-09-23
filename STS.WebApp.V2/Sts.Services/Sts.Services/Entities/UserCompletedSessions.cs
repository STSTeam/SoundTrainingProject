using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Entities
{
    public class UserCompletedSessions
    {
        [Key]
        public int UserId { get; set; }
        [Key]
        public int SessionId { get; set; }
        [Key]
        public int UserTestId { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
