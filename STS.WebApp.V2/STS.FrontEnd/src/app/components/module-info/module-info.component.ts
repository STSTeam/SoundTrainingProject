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
  selector: 'app-module-info',
  templateUrl: './module-info.component.html',
  styleUrls: ['./module-info.component.css']
})
export class ModuleInfoComponent implements OnInit {

  constructor( private modulesService:ModulesService,
    private sessionsService:SessionsService,
    private alertService: AlertService,
    private route: ActivatedRoute) { }

  moduleId:number;
  moduleInfo:ModuleModel;
  levels: LevelModel[];
  ngOnInit() {
    this.moduleId = this.route.snapshot.params['moduleId'];
    
    // get current module info
    this.modulesService.getById(this.moduleId).subscribe(res =>{
      let result : ResultData = <ResultData>res;
      this.moduleInfo = <ModuleModel>result.resultData;
    })

    // query level insted of sessions
    this.sessionsService.getAllLevelsByModuleId(this.moduleId).subscribe(res =>{
      let result : ResultData = <ResultData>res;
      this.levels = <LevelModel[]>res.resultData;
      console.log("levels =>", this.levels);
    }, err=>{
      let error :StsErrorData = <StsErrorData>err;
      this.alertService.error(error.errorMessage)});
  }

}
