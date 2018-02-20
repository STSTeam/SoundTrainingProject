import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home/index';
import { AuthGuard } from './_guards/index';

// const appRoutes: Routes = [
//     // { path: '', component: HomeComponent, canActivate: [AuthGuard] },
//     // { path: 'login', component: LoginComponent },
//     // { path: 'register', component: RegisterComponent },
//     {path:'',redirectTo:'public',pathMatch:'full'}

//     // otherwise redirect to home
//     // { path: '**', redirectTo: '' }
// ];

const routes: Routes = [
    {path:'',redirectTo:'public',pathMatch:'full'},
    {path:'patient' ,  loadChildren: 'app/patient/patient.module#PatientModule' }
   ];

@NgModule({
    imports: [RouterModule.forRoot(routes,{useHash:true})],
    exports: [RouterModule]
  })
  export class AppRoutingModule { } 
  