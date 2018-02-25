import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';


import { AppComponent } from './app.component';
import { routing } from './app.routing';

import { AlertComponent } from './_directives/index';
import { AuthGuard } from './_guards/index';
import { AlertService, AuthenticationService, UserService } from './_services/index';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { UserDataStore } from './_services/_stateServices/userDataStore.service';
import { HearingComponent } from './components/hearing/hearing.component';
import { HlsHttpInterceptor } from "./Interceotor/StsHttpInterceptor";
import { ModulesService } from "./_services/module.service";
import { CommonModule } from '@angular/common';
import { ModuleInfoComponent } from './components/module-info/module-info.component';
import { SessionsService } from "./_services/session.service";
import { SessionInfoComponent } from './components/session-info/session-info.component'; 
import { TrainingComponent } from './components/training/training.component';
import { SessionTestComponent } from "./components/session-test/session-test.component"
import { TrainingItemViewComponent } from "./_directives/training-item-view/training-item-view.component";

@NgModule({
    imports: [
        CommonModule,
        BrowserModule,
        FormsModule,
        HttpModule,
        HttpClientModule,
        routing
    ],
    declarations: [
        AppComponent,
        AlertComponent,
        HomeComponent,
        LoginComponent,
        RegisterComponent,
        HeaderComponent,
        FooterComponent,
        HearingComponent,
        ModuleInfoComponent,
        SessionInfoComponent,
        TrainingComponent,
        SessionTestComponent,
        TrainingItemViewComponent
    ],
    providers: [
        AuthGuard,
        AlertService,
        AuthenticationService,
        UserService,
        ModulesService,
        SessionsService,
        UserDataStore,
        {
            provide: HTTP_INTERCEPTORS,
            useClass: HlsHttpInterceptor,
            multi: true,
          },
    ],
    bootstrap: [AppComponent]
})

export class AppModule { }