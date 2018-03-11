using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos.UserTestModels
{
    public class TestModel
    {
        public TestModel()
        {
            this.Sounds = new List<TestSound>();
        }
        public int SessionId { get; set; }
        public string Title { get; set; }
        public List<TestSound> Sounds { get; set; }
    }

    public class TestSound
    {
        public TestSound()
        {
            this.Images = new List<TestImage>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public List<TestImage> Images { get; set; }
        public TestImage SelectedAnswer { get; set; }
    }

    public class TestImage
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsCorrectImage { get; set; }
    }
}
