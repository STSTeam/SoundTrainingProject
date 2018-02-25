import { Component, OnInit, Input } from '@angular/core';
import { SoundModel } from "../../_models/sound.model";

@Component({
  selector: 'app-training-item-view',
  templateUrl: './training-item-view.component.html',
  styleUrls: ['./training-item-view.component.css']
})
export class TrainingItemViewComponent implements OnInit {

  constructor() { }

  @Input()sound:SoundModel; 
  
  ngOnInit() {
    
  }

}
