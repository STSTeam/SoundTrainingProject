import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from "../_guards/auth.guard";
import { LayoutComponent } from "./layout/layout.component";
import { HomeComponent } from "./home/home.component";


const routes: Routes = [
  {
    path: '',  component: LayoutComponent, canActivate: [AuthGuard], children: [
      { path: '', redirectTo: 'home', pathMatch: 'full' },
      { path: 'home',  component: HomeComponent },

    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PatientRoutingModule { }
