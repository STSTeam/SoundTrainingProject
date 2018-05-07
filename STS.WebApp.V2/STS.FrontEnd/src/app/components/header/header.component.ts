import { Component, OnInit } from '@angular/core';
import { UserService } from "../../_services/index";
import { User } from "../../_models/index";
import { Router, ActivatedRoute } from '@angular/router';
import { UserDataStore } from "../../_services/_stateServices/userDataStore.service";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  currentUser: User;
  constructor(private userService: UserService
    , private router: Router
    , private _userDataStore:UserDataStore ) { }

  ngOnInit() {
    this._userDataStore.userModle.subscribe(user =>{
         this.currentUser = user;
    });
  }
}
