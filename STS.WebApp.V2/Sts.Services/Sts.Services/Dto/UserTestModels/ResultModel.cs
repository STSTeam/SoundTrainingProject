namespace Sts.Services.Dto.UserTestModels
{
    public class ResultModel
    {
        public bool IsPassed { get; set; }
        public double Score { get; set; }
        public int TotalSounds { get; set; }
        public int TotalCorrect { get; set; }
        public int TotalWrong { get; set; }
        public int? NextSessionId { get; set; }
        public int? NextModuleId { get; set; }
    }
}
