import { Component, OnInit } from '@angular/core';
import { SixlingService } from '../../../_services/sixling.service';
import { SixlingModel } from '../../../_models/sixling.model';
import { ResultData } from '../../../_models/resultData';
import { SoundModel } from '../../../_models/sound.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-six-ling-training',
  templateUrl: './six-ling-training.component.html'
})
export class SixLingTrainingComponent implements OnInit {

  constructor(private sixlingService: SixlingService,
    private router: Router) { }

  items: SixlingModel[];
  sounds: SoundModel[];
  currentSound: SoundModel;
  currentSoundIndex = 0;
  showNext = true;
  showPre = false;
  showTestBtn = false;

  ngOnInit() {
    this.sounds = [];
    this.sixlingService.getTraining().subscribe(res => {
      const result: ResultData = <ResultData>res;
      this.items = <SixlingModel[]>result.resultData;
      this.items.forEach(i => {
        this.sounds.push({
          displayName: i.title,
          id: 1,
          name: i.soundName,
          sessionId: undefined
        });
      });
      this.currentSound = this.sounds[this.currentSoundIndex];
      // find sound in items
      this.currentSound.imageName = this.items.filter(x => x.soundName == this.currentSound.name)[0].imageName;
    });
  }

  moveWizard(dir: string) {
    switch (dir) {
      case 'forward':
        this.currentSoundIndex++;
        this.currentSound = this.sounds[this.currentSoundIndex];
        this.currentSound.imageName = this.items.filter(x => x.soundName == this.currentSound.name)[0].imageName;
        break;
      case 'backward':
        this.currentSoundIndex--;
        this.currentSound = this.sounds[this.currentSoundIndex];
        this.currentSound.imageName = this.items.filter(x => x.soundName == this.currentSound.name)[0].imageName;
        break;

      // show/hide next button

    }
    if (this.currentSoundIndex == (this.sounds.length - 1)) {
      this.showNext = false;
      this.showTestBtn = true;
    } else {
      this.showNext = true;
      this.showTestBtn = false;
    }

    if (this.currentSoundIndex > 0) {
      this.showPre = true;
    } else {
      this.showPre = false;
    }
  }

  startSixlingTest() {
    this.router.navigate([`/sixling/test`]);
  }
}
