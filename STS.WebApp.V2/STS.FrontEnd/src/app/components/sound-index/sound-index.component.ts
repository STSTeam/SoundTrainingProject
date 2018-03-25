import { Component, OnInit } from '@angular/core';
import { SoundService } from '../../_services/sound.service';
import { ResultData } from '../../_models/resultData';
import { SoundModel } from '../../_models/sound.model';
import { SoundsByCategoryModel } from '../../_models/soundsIndex/soundsByCategory.model';
import {TreeNode} from 'primeng/api';


@Component({
  selector: 'app-sound-index',
  templateUrl: './sound-index.component.html',
  styleUrls: ['./sound-index.component.css']
})
export class SoundIndexComponent implements OnInit {

  constructor(private soundService: SoundService) { }

  nodes:TreeNode[];
  selectedFile:any;

  ngOnInit() {
    // init
    this.nodes = [];
    this.soundService.getAllSoundsIndexed().subscribe(result => {
      let nodes: TreeNode[] = []

      let res = <ResultData>result;
      let sounds: SoundsByCategoryModel = <SoundsByCategoryModel>res.resultData;
      console.log(sounds);

      sounds.alphapaticSounds.forEach(s => {
        debugger;
        let parentNode : TreeNode = {};
        parentNode.label = s.letter;
        parentNode.data = s.letter;
        parentNode.parent = null;
        parentNode.children = [];
        s.sounds.forEach(ss => {
          debugger;
          let chiledNode: TreeNode = {};
          chiledNode.parent = parentNode;
          chiledNode.label = ss.displayName;
          chiledNode.data = ss.name;
          parentNode.children.push(chiledNode);
        });
        this.nodes.push(parentNode);
      });
      console.log( this.nodes);
    })
  }

  onNodeSelect(event){
    console.log(event);
  }

}
