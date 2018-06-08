


import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';
import { User } from "../../_models/index";

export class UserDataStore {
    private currentUserDataSource = new BehaviorSubject<User>({
        id: 0,
        username: '',
        password: '',
        firstName: '',
        lastName: ''
    });

    userModle = this.currentUserDataSource.asObservable();

    constructor() {
        let user: User = JSON.parse(localStorage.getItem('currentUser'));
        if (user)
            this.SetCurrentUser(user);
    }

    SetCurrentUser(user: User) {
        this.currentUserDataSource.next(user);
    }
}