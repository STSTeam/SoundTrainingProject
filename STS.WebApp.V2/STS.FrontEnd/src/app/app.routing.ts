import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from './_guards/index';
import { HomeComponent } from "./components/home/index";
import { LoginComponent } from "./components/login/index";
import { RegisterComponent } from "./components/register/index";

const appRoutes: Routes = [
    { path: 'home', component: HomeComponent/*, canActivate: [AuthGuard]*/ },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },

    // otherwise redirect to home
    { path: '**', redirectTo: 'home' }
];

export const routing = RouterModule.forRoot(appRoutes);