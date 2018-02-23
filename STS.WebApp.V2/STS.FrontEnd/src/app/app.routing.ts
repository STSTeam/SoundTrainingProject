import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from './_guards/index';
import { HomeComponent } from "./components/home/index";
import { LoginComponent } from "./components/login/index";
import { RegisterComponent } from "./components/register/index";
import { HearingComponent } from "./components/hearing/hearing.component";

const appRoutes: Routes = [
    { path: 'home', component: HomeComponent/*, canActivate: [AuthGuard]*/ },
    { path: 'hearing', component: HearingComponent, canActivate: [AuthGuard] },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },

    // otherwise redirect to home
    { path: '**', redirectTo: 'home' }
];

export const routing = RouterModule.forRoot(appRoutes);