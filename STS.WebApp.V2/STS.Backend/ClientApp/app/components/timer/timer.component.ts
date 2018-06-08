import { Component, OnInit, Output } from '@angular/core';
import { Observable, Subscription } from 'rxjs/Rx';

@Component({
    selector: 'app-timer',
    templateUrl: './timer.component.html',
    styleUrls: ['./timer.component.css']
})
export class TimerComponent implements OnInit {

    ticks = 0;

    minutesDisplay: number = 0;
    hoursDisplay: number = 0;
    secondsDisplay: number = 0;
    elapsedTime:string;

    sub: Subscription;

    ngOnInit() {

    }

     startTimer() {

        let timer = Observable.timer(1, 1000);

        this.sub = timer.subscribe(
            t => {
                this.ticks = t;

                this.secondsDisplay = this.getSeconds(this.ticks);
                this.minutesDisplay = this.getMinutes(this.ticks);
                // this.hoursDisplay = this.getHours(this.ticks);
            }
        );
    }

    stopTimer() {
        this.sub.unsubscribe();
        this.elapsedTime = `${this.secondsDisplay}:${this.minutesDisplay}`;
    }

    private getSeconds(ticks: number) {
        return this.pad(ticks % 60);
    }

    private getMinutes(ticks: number) {
        return this.pad((Math.floor(ticks / 60)) % 60);
    }

    private getHours(ticks: number) {
        return this.pad(Math.floor((ticks / 60) / 60));
    }

    private pad(digit: any) {
        return digit <= 9 ? '0' + digit : digit;
    }

}
