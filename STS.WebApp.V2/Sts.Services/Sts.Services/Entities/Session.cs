using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sts.Services.Entities
{
    public class Session
    {
        public int Id { get; set; }
        public int ModuleId { get; set; }
        public string Title { get; set; }
        public string Descreption { get; set; }
        public int Order { get; set; }
        public string ImageName { get; set; }
        public int? PrerequisiteSessionId { get; set; }
        public bool IsLastSession { get; set; }
        [IgnoreSelect]
        [IgnoreInsert]
        [IgnoreUpdate]
        public bool Enabled { get; set; }

        public int NumberOfChoices { get; set; }

        // levels columsn
        public int LevelId { get; set; }
        public string LevelName { get; set; }
        public string LevelDescreption { get; set; }
        public string LevelImageName { get; set; }
    }
}
