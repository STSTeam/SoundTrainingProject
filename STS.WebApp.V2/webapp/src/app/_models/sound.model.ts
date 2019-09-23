import { ImageModel } from "./image.model";

export class SoundModel {
    id: number;
    sessionId: number;
    name: string;
    displayName: string;
    images?: ImageModel[];
    imageName?: string;
}

export class SoundImages {
    soundId: number;
    imageId: number;
}