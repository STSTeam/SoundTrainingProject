import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { User } from '../_models/index';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { ResultData } from "../_models/resultData";

@Injectable()
export class SessionsService {
    constructor(private http: HttpClient) { }

    private ApiUrl = 'Sessions';

    getById(sessionId:number) : Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/${sessionId}`);
    }

    getByModuleId(moduleId:number) : Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetByModuleId/${moduleId}`);
    }

    getSessionSounds(soundId:number): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetSessionTrainingSounds/${soundId}`);
    }

    getSoundImages(soundId:number):Observable<ResultData>{
        return this.http.get<ResultData>(`${this.ApiUrl}/GetSoundImages/${soundId}`);
    }
}