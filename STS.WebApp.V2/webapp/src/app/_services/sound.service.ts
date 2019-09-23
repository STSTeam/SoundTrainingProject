import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { User } from '../_models/index';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { ResultData } from "../_models/resultData";
import { UserDataStore } from './_stateServices/userDataStore.service';

@Injectable()
export class SoundService {
    constructor(private http: HttpClient) {
        
    }

    private ApiUrl = 'Sounds';

    getAllSoundsIndexed(): Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetAllSoundsIndexed`);
    }
}