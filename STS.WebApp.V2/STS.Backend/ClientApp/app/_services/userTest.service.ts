import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { User } from '../_models/index';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { ResultData } from "../_models/resultData";
import { TestModel } from '../_models/test/test.model';
import { UserDataStore } from './_stateServices/userDataStore.service';

@Injectable()
export class UserTestServices {
    constructor(private http: HttpClient,
        private _userDataStore: UserDataStore) {
        this._userDataStore.userModle.subscribe(user => {
            this.currentUser = user;
        });
    }

    private currentUser:User;
    private ApiUrl = 'UserTest';

    generateTest(sessionId: number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetTestBySessionId/${sessionId}`);
    }

    SubmitTest(testModel: TestModel): Observable<ResultData> {
        testModel.userId = this.currentUser.id;
        return this.http.post<ResultData>(`${this.ApiUrl}/submitTest`, testModel);
    }
}