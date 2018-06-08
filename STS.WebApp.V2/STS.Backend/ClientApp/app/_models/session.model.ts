export class SessionModel{
    id:number;
    moduleId:number;
    title:string;
    imageName:string;
    enabled:boolean;
    imagesArr:string[];
    levelId: number;
    levelName: string;
    levelDescreption: string;
    levelImageName:string;
}

export class LevelModel{
    levelId: number;
    levelName: string;
    levelDescreption: string;
    levelImageName:string;
}