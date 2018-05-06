import { Component, OnInit, ViewChild, OnChanges, SimpleChanges, Input } from '@angular/core';
import { SoundModel } from '../../_models/sound.model';

@Component({
  selector: 'app-test-playlist',
  templateUrl: './test-playlist.component.html',
  styleUrls: ['./test-playlist.component.css']
})
export class TestPlaylistComponent implements OnInit {

  constructor() { }

  @Input() autoPlay: boolean = true;
  @ViewChild('soundCtr') soundCtr: any;
  sounds: SoundModel[] = [];
  currentSoundObj: any = {}

  ngOnInit() {
    this.sounds.push({ id: 1, displayName: "image 1", name: "1_sound_1autumn.mp3", sessionId: 0 });
    this.sounds.push({ id: 2, displayName: "image 2", name: "1_sound_1boat.mp3", sessionId: 0 });
    this.sounds.push({ id: 3, displayName: "image 3", name: "1_sound_1house.mp3", sessionId: 0 });

    this.runSound(this.sounds[0], 0, false);
  }


  runSound(sound: SoundModel, i?: number, contPlay?: boolean) {
    this.currentSoundObj = { sound: sound, index: i, contPlay:contPlay };
    console.log(this.currentSoundObj);
    this.soundCtr.nativeElement.src = "./assets/_support_files/MP3/" + sound.name;
    this.soundCtr.nativeElement.autoplay = true;
  }

  onSoundEnd() {
    debugger;
    if(this.currentSoundObj.contPlay){
      let nextSoundIndex = this.currentSoundObj.index + 1;
      if(nextSoundIndex < this.sounds.length){
        this.runSound(this.sounds[nextSoundIndex], nextSoundIndex, this.currentSoundObj.contPlay);
      }
    }
  }

}
