using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos.UserTestModels
{
    public class ResultModel
    {
        public bool IsPassed { get; set; }
        public double Score { get; set; }
        public int TotalSounds { get; set; }
        public int TotalCorrect { get; set; }
        public int TotalWrong { get; set; }
        public int NextSessionId { get; set; }
        public int NextModuleId { get; set; }
    }
}
