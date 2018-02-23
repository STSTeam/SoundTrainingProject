import { Component, OnInit } from '@angular/core';
import { ModulesService } from "../../_services/module.service";
import { ResultData } from "../../_models/resultData";
import { ModuleModel } from "../../_models/module";
import { AlertService } from "../../_services/index";
import { StsErrorData } from "../../_models/errorData";

@Component({
  selector: 'app-hearing',
  templateUrl: './hearing.component.html'
})
export class HearingComponent implements OnInit {

  constructor(private modulesService:ModulesService,
    private alertService: AlertService) { }

  modules:ModuleModel[];

  ngOnInit() {
    this.modulesService.getAll().subscribe(res =>{
      let result :ResultData = res;
      this.modules = <ModuleModel[]>res.resultData;
      console.log(this.modules);
    }, err=>{
        let error :StsErrorData = <StsErrorData>err;
      this.alertService.error(error.errorMessage);
    })
  }

}
