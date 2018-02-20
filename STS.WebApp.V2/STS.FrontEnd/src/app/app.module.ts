import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';


import { AppComponent } from './app.component';
import { AlertComponent } from "./_directives/alert.component";
import { HomeComponent } from "./home/home.component";
import { AppConfig } from "./app.config";
import { AuthGuard } from "./_guards/auth.guard";
import { AlertService } from "./_services/alert.service";
import { AuthenticationService } from "./_services/authentication.service";
import { UserService } from "./_services/user.service";
import { AppRoutingModule } from "./app.routing";
import { PublicModule } from "./public/public.module";


@NgModule({
  declarations: [
    AppComponent
    , AlertComponent
    , HomeComponent
  ],
  imports: [
    BrowserModule
    , FormsModule
    , HttpModule
    , AppRoutingModule
    , PublicModule
  ],
  providers: [
    AppConfig,
    AuthGuard,
    AlertService,
    AuthenticationService,
    UserService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
