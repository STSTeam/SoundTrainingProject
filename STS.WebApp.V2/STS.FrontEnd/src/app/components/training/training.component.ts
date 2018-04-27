import { Component, OnInit } from '@angular/core';
import { SessionsService } from "../../_services/session.service";
import { AlertService } from "../../_services/index";
import { ActivatedRoute, Router } from "@angular/router";
import { SoundModel } from "../../_models/sound.model";
import { ResultData } from "../../_models/resultData";
import { StsErrorData } from "../../_models/errorData";
import { environment } from "../../../environments/environment";

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

  sessionId: number;
  moduleId: number;
  levelId: number;
  sessionSounds: SoundModel[];
  currentSound: SoundModel;
  currentSoundIndex: number = 0;
  showNext: boolean = true;
  showPre: boolean = false;
  showTestBtn: boolean = false;
  ngOnInit() {
    this.sessionId = this.route.snapshot.params['sessionId'];
    this.moduleId = this.route.snapshot.params['moduleId'];
    this.levelId = this.route.snapshot.params['levelId'];

    this.sessionsService.getSessionSounds(this.sessionId).subscribe(res => {
      let result: ResultData = <ResultData>res;
      this.sessionSounds = <SoundModel[]>res.resultData;
      this.currentSound = this.sessionSounds[this.currentSoundIndex];
    }, err => {
      let error: StsErrorData = <StsErrorData>err;
      this.alertService.error(error.errorMessage)
    });
  }

  startSessionTest() {
    this.router.navigate([`/hearing/${this.moduleId}/${this.levelId}/${this.sessionId}/test`]);
  }

  moveWizard(dir: string) {
    switch (dir) {
      case "forward":
        this.currentSoundIndex++;
        this.currentSound = this.sessionSounds[this.currentSoundIndex];
        break;
      case "backward":
        this.currentSoundIndex--;
        this.currentSound = this.sessionSounds[this.currentSoundIndex];
        break;

      // show/hide next button

    }
    if (this.currentSoundIndex == (this.sessionSounds.length - 1)) {
      this.showNext = false;
      this.showTestBtn = true;
    }
    else {
      this.showNext = true;
      this.showTestBtn = false;
    }


    if (this.currentSoundIndex > 0) {
      this.showPre = true;
    }
    else
      this.showPre = false;

  }

}
