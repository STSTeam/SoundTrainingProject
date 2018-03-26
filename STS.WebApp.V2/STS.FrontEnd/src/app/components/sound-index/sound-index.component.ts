import { Component, OnInit, ViewChild } from '@angular/core';
import { SoundService } from '../../_services/sound.service';
import { ResultData } from '../../_models/resultData';
import { SoundModel, SoundImages } from '../../_models/sound.model';
import { SoundsByCategoryModel } from '../../_models/soundsIndex/soundsByCategory.model';
import {TreeNode} from 'primeng/api';
import { ImageModel } from '../../_models/image.model';


@Component({
  selector: 'app-sound-index',
  templateUrl: './sound-index.component.html',
  styleUrls: ['./sound-index.component.css']
})
export class SoundIndexComponent implements OnInit {

  constructor(private soundService: SoundService) { }

  @ViewChild('soundCtr') soundCtr: any;

  
  data: SoundsByCategoryModel;
  selectedSound:SoundModel;
  alphaNodes:TreeNode[];
  envNodes:TreeNode[];
  ctrImages: any[];

  ngOnInit() {
    // init
    this.alphaNodes = [];
    this.envNodes = [];
    
    this.soundService.getAllSoundsIndexed().subscribe(result => {
      let nodes: TreeNode[] = []

      let res = <ResultData>result;
      this.data = <SoundsByCategoryModel>res.resultData;

      // process alpha nodes
      this.data.alphapaticSounds.forEach(s => {
        let parentNode : TreeNode = {};
        parentNode.label = s.letter;
        parentNode.data = s.letter;
        parentNode.parent = null;
        parentNode.selectable = false;
        parentNode.children = [];
        s.sounds.forEach(ss => {
          let chiledNode: TreeNode = {};
          chiledNode.parent = parentNode;
          chiledNode.label = ss.displayName;
          chiledNode.data =ss.id.toString(); 
          parentNode.children.push(chiledNode);
        });
        this.alphaNodes.push(parentNode);
      });

      // process env. nodes
      this.data.envSounds.forEach(s => {
        let parentNode : TreeNode = {};
        parentNode.label = s.letter;
        parentNode.data = s.letter;
        parentNode.parent = null;
        parentNode.selectable = false;
        parentNode.children = [];
        s.sounds.forEach(ss => {
          let chiledNode: TreeNode = {};
          chiledNode.parent = parentNode;
          chiledNode.label = ss.displayName;
          chiledNode.data =ss.id.toString(); 
          parentNode.children.push(chiledNode);
        });
        this.envNodes.push(parentNode);
      });
    })
  }

  onNodeSelect(event){
    let selectedNode:TreeNode = <TreeNode>event.node;
    let soundId : number = selectedNode.data;
    this.selectedSound = this.data.allSounds.find(x => x.id == soundId);
    let soundImages : SoundImages[] = this.data.soundImages.filter(x => x.soundId == soundId);
    this.selectedSound.images= [];
    soundImages.forEach(x =>{
      let image : ImageModel = this.data.allImages.find(i => i.id == x.imageId);
      this.selectedSound.images.push(image);
    });

    // work on selectedSound object only
    // set sound ctr
    let xx = this.soundCtr.nativeElement;
    xx.src = "./assets/_support_files/MP3/" + this.selectedSound.name + ".mp3";

    // set images
    if(this.selectedSound.images &&  this.selectedSound.images.length > 0){
      this.ctrImages = [];
      this.selectedSound.images.forEach(x => {
        this.ctrImages.push({source:`./assets/_support_files/pic/${x.name}.png`, alt:'', title:''}); 

      });
    }
    else 
    this.ctrImages = null;
  }
}
