export class TestResultModel{
    IsPassed : boolean;
    Score: number;
    TotalSounds:number;
    TotalCorrect:number;
    TotalWrong:number;
    NextSessionId?:number;
    NextModuleId?:number;
}