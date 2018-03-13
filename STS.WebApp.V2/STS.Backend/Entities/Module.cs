using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Entities
{
    public class Module
    {
        public int Id { get; set; }
        public int Order { get; set; }
        public string Title { get; set; }
        public string Descreption { get; set; }
        public string ImageName { get; set; }
        public int? PrerequisiteModuleId { get; set; }
        [IgnoreSelect]
        [IgnoreInsert]
        [IgnoreUpdate]
        public bool Enabled { get; set; }
    }
}
