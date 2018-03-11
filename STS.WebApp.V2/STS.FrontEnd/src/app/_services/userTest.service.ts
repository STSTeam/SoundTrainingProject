import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

import { User } from '../_models/index';
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { ResultData } from "../_models/resultData";
import { TestModel } from '../_models/test/test.model';

@Injectable()
export class UserTestServices {
    constructor(private http: HttpClient) { }

    private ApiUrl = 'UserTest';

    generateTest(sessionId:number) : Observable<ResultData> {
        return this.http.get<ResultData>(`${this.ApiUrl}/GetTestBySessionId/${sessionId}`);
    }

    SubmitTest(testModel:TestModel): Observable<ResultData> {
        debugger
        return this.http.post<ResultData>(`${this.ApiUrl}/submitTest`, testModel);
    }
}