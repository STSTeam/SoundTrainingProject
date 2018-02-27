import { Component, OnInit, Input, ChangeDetectionStrategy, OnChanges, SimpleChanges, ViewChild  } from '@angular/core';
import { SoundModel } from "../../_models/sound.model";

@Component({
  selector: 'app-training-item-view',
  templateUrl: './training-item-view.component.html',
  styleUrls: ['./training-item-view.component.css']
})
export class TrainingItemViewComponent implements OnInit, OnChanges  {

  @ViewChild('soundCtr') soundCtr: any;

  ngOnChanges(changes: SimpleChanges): void {
  let xx = this.soundCtr.nativeElement;
  xx.src = "./assets/_support_files/MP3/" + changes.sound.currentValue.name + ".mp3";

  let t = changes.sound.currentValue;
  this.sound.name = t.name;
  }

  constructor() { }

  @Input()sound:SoundModel;
  
  ngOnInit() {

  }

}
