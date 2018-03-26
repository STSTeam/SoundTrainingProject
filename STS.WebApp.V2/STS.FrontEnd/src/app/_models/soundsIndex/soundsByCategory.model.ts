import { SoundsByLetterModel } from "./soundsByLetter.model";
import { SoundModel, SoundImages } from "../sound.model";
import { ImageModel } from "../image.model";

export class SoundsByCategoryModel{
    allSounds:SoundModel[];
    allImages:ImageModel[];
    soundImages:SoundImages[];
    alphapaticSounds:SoundsByLetterModel[];
    envSounds:SoundsByLetterModel[];
}