import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PublicRoutingModule } from './public-routing.module';
import { LayoutComponent } from './layout/layout.component';
import { LoginComponent } from './login/login.component';
import { ErrorPageComponent } from './error-page/error-page.component';
import { FormsModule } from '@angular/forms';
import { RegisterComponent } from './register/register.component';

@NgModule({
  imports: [
    CommonModule
    , PublicRoutingModule
    , FormsModule
  ],
  declarations: [LayoutComponent, LoginComponent, ErrorPageComponent, RegisterComponent]
})
export class PublicModule { }
