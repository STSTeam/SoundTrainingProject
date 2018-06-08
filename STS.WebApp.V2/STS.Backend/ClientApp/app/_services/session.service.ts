import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { User } from '../_models/index';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { ResultData } from "../_models/resultData";
import { UserDataStore } from './_stateServices/userDataStore.service';

@Injectable()
export class SessionsService {
    constructor(private http: HttpClient,
        private _userDataStore: UserDataStore) {
        this._userDataStore.userModle.subscribe(user => {
            this.currentUser = user;
        });
    }

    private currentUser: User;
    private ApiUrl = 'Sessions';

    getById(sessionId: number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/${sessionId}`);
    }

    getAllLevelsByModuleId(moduleId: number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetAllLevelsByModuleId/${this.currentUser.id}/${moduleId}`);
    }

    getLevelSessionsByLevelId(moduleId, levelId: number): Observable<ResultData>{
        return this.http.get<ResultData>(`${this.ApiUrl}/getLevelSessionsByLevelId/${moduleId}/${levelId}`);
    }

    getByModuleId(moduleId: number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetByModuleId/${this.currentUser.id}/${moduleId}`);
    }

    getSessionSounds(soundId: number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetSessionTrainingSounds/${soundId}`); 
    }

    getSoundImages(soundId: number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetSoundImages/${soundId}`);
    }
}