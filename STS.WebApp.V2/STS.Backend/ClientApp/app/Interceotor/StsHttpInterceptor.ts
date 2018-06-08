import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/Observable';
import 'rxjs/add/observable/throw';
import { HttpErrorResponse, HttpHeaders } from '@angular/common/http';


import { environment } from "../../environments/environment";
import { UserDataStore } from "../_services/_stateServices/userDataStore.service";

@Injectable()
export class HlsHttpInterceptor implements HttpInterceptor {
  constructor(private _userDataStore: UserDataStore) {

  }
  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    let currentUser: any = JSON.parse(localStorage.getItem('currentUser'));
    request = request.clone({
      url: environment.API_URL + request.url,
      setHeaders: {
        Authorization: `Bearer ${currentUser.token}`
      }
    });

    return next.handle(request).do(event => {
    }).catch((err: any, caught) => {
      if (err.error)
        console.error(err.error);
      else console.error(err);
      return Observable.throw(err.error);
    });;
  }
}