import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from './_guards/index';
import { HomeComponent } from "./components/home/index";
import { LoginComponent } from "./components/login/index";
import { RegisterComponent } from "./components/register/index";
import { HearingComponent } from "./components/hearing/hearing.component";
import { ModuleInfoComponent } from "./components/module-info/module-info.component";
import { SessionInfoComponent } from "./components/session-info/session-info.component";
import { TrainingComponent } from "./components/training/training.component";
import { TestComponent } from './components/test/test.component';
import { ContactUsComponent } from './components/contact-us/contact-us.component';
import { InformationComponent } from './components/information/information.component';
import { SoundIndexComponent } from './components/sound-index/sound-index.component';
import { TimerComponent } from './components/timer/timer.component';
import { ModuleLevelsComponent } from './components/module-levels/module-levels.component';

const appRoutes: Routes = [
    { path: 'home', component: HomeComponent/*, canActivate: [AuthGuard]*/ },
    { path: 'soundsIndex', component: SoundIndexComponent },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'contactus', component: ContactUsComponent },
    { path: 'information', component: InformationComponent },
    { path: 'timer', component: TimerComponent },

    {
        path: 'hearing', canActivate: [AuthGuard],
        children: [
            { path: '', component: HearingComponent, canActivate: [AuthGuard] },
            { path: ':moduleId', component: ModuleInfoComponent, canActivate: [AuthGuard] },
            { path: ':moduleId/:levelId', component: ModuleLevelsComponent, canActivate: [AuthGuard] },
            { path: ':moduleId/:levelId/:sessionId', component: SessionInfoComponent, canActivate: [AuthGuard] },
            { path: ':moduleId/:levelId/:sessionId/training', component: TrainingComponent, canActivate: [AuthGuard] },
            { path: ':moduleId/:levelId/:sessionId/test', component: TestComponent, canActivate: [AuthGuard] }
        ]
    },


    // otherwise redirect to home
    { path: '**', redirectTo: 'home' }
];

export const routing = RouterModule.forRoot(appRoutes);