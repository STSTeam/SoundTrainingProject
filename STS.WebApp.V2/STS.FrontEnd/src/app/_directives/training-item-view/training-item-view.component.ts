import { Component, OnInit, Input, ChangeDetectionStrategy, OnChanges, SimpleChanges, ViewChild } from '@angular/core';
import { SoundModel } from "../../_models/sound.model";
import { ImageModel } from "../../_models/image.model";
import { SessionsService } from "../../_services/session.service";
import { ResultData } from "../../_models/resultData";

@Component({
  selector: 'app-training-item-view',
  templateUrl: './training-item-view.component.html',
  styleUrls: ['./training-item-view.component.css']
})
export class TrainingItemViewComponent implements OnInit, OnChanges {

  @ViewChild('soundCtr') soundCtr: any;

  ngOnChanges(changes: SimpleChanges): void {
    let xx = this.soundCtr.nativeElement;
    xx.src = "./assets/_support_files/MP3/" + changes.sound.currentValue.name + ".mp3";

    let t = changes.sound.currentValue;
    this.sound.name = t.name;
    this.sound.id = t.id;

    // get sound images
    this.sessionsService.getSoundImages(this.sound.id).subscribe(res =>{
      let result :ResultData = <ResultData>res;
      this.images= <ImageModel[]>res.resultData;
      
      if(this.images){
        this.ctrImages = [];
        for(var i = 0; i < this.images.length; i++){
          this.ctrImages.push({source:'./assets/_support_files/pic/' + this.images[i].name+".png", alt:'Description for Image 1', title:'Title 1'});
        }
      }
      else 
      this.ctrImages = null;
    
    });

  }

  constructor(private sessionsService: SessionsService) { }

  @Input() sound: SoundModel;
  images: ImageModel[];
  ctrImages: any[];
  ngOnInit() {

  }

}
