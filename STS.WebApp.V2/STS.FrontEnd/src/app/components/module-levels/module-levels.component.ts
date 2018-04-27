import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { SessionModel, LevelModel } from "../../_models/session.model";
import { SessionsService } from "../../_services/session.service";
import { ResultData } from "../../_models/resultData";
import { AlertService } from "../../_services/index";
import { StsErrorData } from "../../_models/errorData";
import { ModuleModel } from "../../_models/module";
import { ModulesService } from "../../_services/module.service";

@Component({
  selector: 'app-module-levels',
  templateUrl: './module-levels.component.html'
})
export class ModuleLevelsComponent implements OnInit {

  constructor(private modulesService: ModulesService,
    private sessionsService: SessionsService,
    private alertService: AlertService,
    private route: ActivatedRoute) { }

  moduleId: number;
  levelId: number;
  levelInfo: LevelModel;

  sessions: SessionModel[];


  ngOnInit() {
    this.moduleId = this.route.snapshot.params['moduleId'];
    this.levelId = this.route.snapshot.params['levelId'];

    // get current module info
    this.sessionsService.getLevelSessionsByLevelId(this.levelId).subscribe(res => {
      let result: ResultData = <ResultData>res;
      this.sessions = <SessionModel[]>result.resultData;
      let firstSession = this.sessions[0];
      this.levelInfo = {
        levelId: firstSession.levelId,
        levelName: firstSession.levelName,
        levelDescreption: firstSession.levelDescreption,
        levelImageName: firstSession.levelImageName
      };

    })
  }

}
