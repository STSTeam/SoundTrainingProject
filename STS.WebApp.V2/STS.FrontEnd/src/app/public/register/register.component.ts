import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService, AlertService } from "../../_services/index";


@Component({
  selector: 'app-register',
  templateUrl: './register.component.html'
})
export class RegisterComponent implements OnInit {
  ngOnInit(): void {
   
  }
  model: any = {};
  loading = false;

  constructor(
      private router: Router,
      private userService: UserService,
      private alertService: AlertService) { }

  register() {
      this.loading = true;
      this.userService.create(this.model)
          .subscribe(
              data => {
                  this.alertService.success('Registration successful', true);
                  this.router.navigate(['/login']);
              },
              error => {
                  this.alertService.error(error._body);
                  this.loading = false;
              });
  }
}
