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
  @Input() sound: SoundModel;
  images: ImageModel[];
  ctrImages: any[];

  ngOnChanges(changes: SimpleChanges): void {
    let xx = this.soundCtr.nativeElement;
    xx.src = "./assets/_support_files/MP3/" + changes.sound.currentValue.name + ".mp3";

    let t = changes.sound.currentValue;
    this.sound.name = t.name;
    this.sound.id = t.id;


    if (!this.sound.imageName) {
      // get sound images
      this.sessionsService.getSoundImages(this.sound.id).subscribe(res => {
        let result: ResultData = <ResultData>res;
        this.images = <ImageModel[]>res.resultData;

        if (this.images) {
          this.ctrImages = [];
          for (var i = 0; i < this.images.length; i++) {
            // tslint:disable-next-line:max-line-length
            this.ctrImages.push({ source: './assets/_support_files/pic/' + this.images[i].name + '.png', alt: 'Description for Image 1', title: this.images[i].name });
          }
        }
        else {
          this.ctrImages = null;
        }
      }); 
    } else {
      this.ctrImages = [];
      this.ctrImages.push({ source: './assets/_support_files/pic/' + this.sound.imageName + '.png', alt: 'Description for Image 1', title: '' });
    }
  }

  constructor(private sessionsService: SessionsService) { }

  ngOnInit() {

  }

  //function of play again 
  playAgain(e) {
    e.preventDefault();
    this.soundCtr.nativeElement.play();
  }

}
