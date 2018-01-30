using System.ComponentModel.DataAnnotations;

namespace STS.WebApp.Models
{
    public class Session
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public int LevelId { get; set; }
        public string Title { get; set; }
        public virtual Level Level { get; set; }
    }
}