import { Component, OnInit, ViewChild } from '@angular/core';
import { SessionsService } from "../../_services/session.service";
import { AlertService } from "../../_services/index";
import { ActivatedRoute, Router } from "@angular/router";
import { SoundModel } from "../../_models/sound.model";
import { ResultData } from "../../_models/resultData";
import { StsErrorData } from "../../_models/errorData";
import { environment } from "../../../environments/environment";
import { GroupedSound } from '../../_models/groupedSound.model';

@Component({
  selector: 'app-training',
  templateUrl: './training.component.html',
  styleUrls: ['./training.component.css']
})
export class TrainingComponent implements OnInit {

  constructor(private sessionsService: SessionsService,
    private alertService: AlertService,
    private route: ActivatedRoute,
    private router: Router) { }

  @ViewChild('soundCtr') soundCtr: any;

  sessionId: number;
  moduleId: number;
  levelId: number;

  groupedSounds: GroupedSound[];
  currentGroup: any;

  isReady: boolean = false;
  showNext: boolean = true;
  showPre: boolean = false;
  showTestBtn: boolean = false;
  ngOnInit() {
    this.sessionId = this.route.snapshot.params['sessionId'];
    this.moduleId = this.route.snapshot.params['moduleId'];
    this.levelId = this.route.snapshot.params['levelId'];

    this.sessionsService.getSessionSounds(this.sessionId).subscribe(res => {
      let result: ResultData = <ResultData>res;
      this.groupedSounds = <GroupedSound[]>res.resultData;
      this.currentGroup = { index: 0, group: this.groupedSounds[0] };
      this.isReady = true;
      this.runSound(this.currentGroup.group.sounds[0]);
    }, err => {
      let error: StsErrorData = <StsErrorData>err;
      this.alertService.error(error.errorMessage)
    });
  }

  startSessionTest() {
    this.router.navigate([`/hearing/${this.moduleId}/${this.levelId}/${this.sessionId}/test`]);
  }

  runSound(sound: SoundModel) {
    this.soundCtr.nativeElement.src = `./assets/_support_files/MP3/${sound.name}.mp3`;
    this.soundCtr.nativeElement.autoplay = true;
  }

  moveWizard(dir: string) {
    let currentSoundIndex = this.currentGroup.index;

    switch (dir) {
      case "forward":
         currentSoundIndex++;
         this.currentGroup = { index: currentSoundIndex, group: this.groupedSounds[currentSoundIndex] };
         this.runSound(this.currentGroup.group.sounds[0]);
        break;
      case "backward":
         currentSoundIndex--;
         this.currentGroup = { index: currentSoundIndex, group: this.groupedSounds[currentSoundIndex] };
         this.runSound(this.currentGroup.group.sounds[0]);
        break;

      // show/hide next button

    }
    if (currentSoundIndex == (this.groupedSounds.length - 1)) {
      this.showNext = false;
      this.showTestBtn = true;
    }
    else {
      this.showNext = true;
      this.showTestBtn = false;
    }


    if (currentSoundIndex > 0) {
      this.showPre = true;
    }
    else
      this.showPre = false;

  }

}
