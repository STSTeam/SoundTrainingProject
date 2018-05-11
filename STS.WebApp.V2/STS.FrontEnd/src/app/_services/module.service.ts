import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { User } from '../_models/index';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { ResultData } from "../_models/resultData";
import { UserDataStore } from './_stateServices/userDataStore.service';
import { MarkModuleAsCompletedInputModel } from '../_models/markModuleAsCompletedInput.model';

@Injectable()
export class ModulesService {
    constructor(private http: HttpClient,
        private _userDataStore: UserDataStore) {
        this._userDataStore.userModle.subscribe(user => {
            this.currentUser = user;
        });
    }

    private currentUser: User;

    private ApiUrl = 'Modules';

    getAll(): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetAll/${this.currentUser.id}`);
    }

    getById(moduleId: number) {
        return this.http.get<ResultData>(`${this.ApiUrl}/${moduleId}`);
    }

    markModuleAsCompleted(input: MarkModuleAsCompletedInputModel): Observable<ResultData> {
        input.UserId = this.currentUser.id;
        return this.http.post<ResultData>(`${this.ApiUrl}/markModuleAsCompleted`, input);
    }
}