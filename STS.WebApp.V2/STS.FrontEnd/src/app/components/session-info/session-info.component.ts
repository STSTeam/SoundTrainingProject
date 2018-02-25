import { Component, OnInit } from '@angular/core';
import { ModulesService } from "../../_services/module.service";
import { SessionsService } from "../../_services/session.service";
import { AlertService } from "../../_services/index";
import { ActivatedRoute } from "@angular/router";
import { ModuleModel } from "../../_models/module";
import { SessionModel } from "../../_models/session.model";
import { ResultData } from "../../_models/resultData";
import { StsErrorData } from "../../_models/errorData";

@Component({
  selector: 'app-session-info',
  templateUrl: './session-info.component.html',
  styleUrls: ['./session-info.component.css']
})
export class SessionInfoComponent implements OnInit {

  constructor( private modulesService:ModulesService,
    private sessionsService:SessionsService,
    private alertService: AlertService,
    private route: ActivatedRoute) { }

  moduleId:number;
  sessionId:number;
  session:SessionModel;
  ngOnInit() {
    this.moduleId = this.route.snapshot.params['moduleId'];
    this.sessionId = this.route.snapshot.params['sessionId'];
    
    this.sessionsService.getById(this.sessionId).subscribe(res =>{
      debugger;
      let result : ResultData = <ResultData>res;
      this.session = <SessionModel>res.resultData;
    }, err=>{
      let error :StsErrorData = <StsErrorData>err;
      this.alertService.error(error.errorMessage)});
  }

}
