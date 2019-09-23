

namespace Sts.Services.Entities
{
    public class Sound
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool IsAlphabeticIndexed { get; set; }
        public int? GroupId { get; set; }

    }
}
