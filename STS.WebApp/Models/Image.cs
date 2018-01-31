using System.Collections.Generic;

namespace STS.WebApp.Models
{
    public class Image
    {
        public int Id { get; set; }
        public int Name { get; set; }

        public virtual ICollection<Sound> Sounds { get; set; }
    }


}