import { Component, OnInit, AfterViewInit } from '@angular/core';
import 'assets/js/custom.js'
declare var Navigation: any;

@Component({
  selector: 'app-sidenavbar',
  templateUrl: './sidenavbar.component.html'
})
export class SidenavbarComponent implements OnInit, AfterViewInit {

  constructor() { }

  ngAfterViewInit(): void {
    Navigation.setup();
  }

  ngOnInit() {
  }

}
