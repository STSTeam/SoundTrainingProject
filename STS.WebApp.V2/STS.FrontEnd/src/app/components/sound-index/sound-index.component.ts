import { Component, OnInit } from '@angular/core';
import { SoundService } from '../../_services/sound.service';
import { ResultData } from '../../_models/resultData';
import { SoundModel } from '../../_models/sound.model';
import { SoundsByCategoryModel } from '../../_models/soundsIndex/soundsByCategory.model';

@Component({
  selector: 'app-sound-index',
  templateUrl: './sound-index.component.html',
  styleUrls: ['./sound-index.component.css']
})
export class SoundIndexComponent implements OnInit {

  constructor(private soundService:SoundService ) { }

  ngOnInit() {
    this.soundService.getAllSoundsIndexed().subscribe(result =>{
      debugger;
      let res = <ResultData>result;
      let sounds:SoundsByCategoryModel = <SoundsByCategoryModel>res.resultData;
      console.log(sounds);
    })
  }

}
