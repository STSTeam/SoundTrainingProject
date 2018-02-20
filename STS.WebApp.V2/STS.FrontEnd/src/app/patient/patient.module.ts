import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PatientRoutingModule } from './patient-routing.module';
import { LayoutComponent } from "./layout/layout.component";
import { HomeComponent } from "./home/home.component";
import { TopnavbarComponent } from './topnavbar/topnavbar.component';
import { SidenavbarComponent } from './sidenavbar/sidenavbar.component';

@NgModule({
  imports: [
    CommonModule,
    PatientRoutingModule
  ],
  declarations: [LayoutComponent, HomeComponent, TopnavbarComponent, SidenavbarComponent]
}) 
export class PatientModule { }
 