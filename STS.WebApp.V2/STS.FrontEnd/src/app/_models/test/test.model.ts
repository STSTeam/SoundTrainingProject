export class TestModel{
    sessionId:number;
    sounds:TestSound[];
   
}

export class TestSound{
    id:number;
    name:string;
    images:TestImage[];
    selectedAnswer:TestImage;
}

export class TestImage{
    id:number;
    name:string;
    isCorrectImage:boolean;
}



