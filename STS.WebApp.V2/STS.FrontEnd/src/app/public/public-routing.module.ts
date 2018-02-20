import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent } from "./layout/layout.component";
import { LoginComponent } from "./login/login.component";
import { ErrorPageComponent } from "./error-page/error-page.component";
import { RegisterComponent } from "./register/register.component";


const routes: Routes = [
  {
    path: 'public', component: LayoutComponent, children: [
      { path: '', redirectTo: 'login', pathMatch: 'full' },
      { path: 'login', component: LoginComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'errorpage', component: ErrorPageComponent },
    ] 
  },
  { path: '**', redirectTo: '/public/errorpage', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PublicRoutingModule { }
