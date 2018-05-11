import { Component, OnInit } from '@angular/core';
import { UserService } from '../../_services/index';
import { User } from '../../_models/index';


@Component({
    moduleId: module.id,
    templateUrl: 'home.component.html'
})

export class HomeComponent implements OnInit {

    constructor(private userService: UserService) {

    }

    ngOnInit() {
        // const isSixLingTestCompleted: any = localStorage.getItem('isSixLingTestCompleted');
        // if (!isSixLingTestCompleted) {
        //     this.redirectUrl = '/sixling';
        // }
    }
}
