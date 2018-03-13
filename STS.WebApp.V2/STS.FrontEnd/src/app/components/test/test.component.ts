import { Component, OnInit, ViewChild, ChangeDetectorRef, ViewChildren, QueryList } from '@angular/core';
import { UserTestServices } from '../../_services/userTest.service';
import { ActivatedRoute } from '@angular/router';
import { ResultData } from '../../_models/resultData';
import { TestModel, TestSound } from '../../_models/test/test.model';
import { SoundModel } from '../../_models/sound.model';
import { TestAnswerModel } from '../../_models/test/testAnswer.model';
import { OverlayPanel } from 'primeng/components/overlaypanel/overlaypanel';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.css']
})
export class TestComponent implements OnInit {

  constructor(private userTestServices: UserTestServices
    , private route: ActivatedRoute
    , private cdr: ChangeDetectorRef) { }

  moduleId: number;
  sessionId: number;

  answers: TestAnswerModel[];
  testData: TestModel;
  currentSound: { "index": 0, sound: TestSound };
  showResult: boolean = false;
  showCorrect: string = null;
  finalResult: string;
  finalRsultNumber:number;

  @ViewChild('resultPanel') resultPanel: any;
  @ViewChild('soundCtr') soundCtr: any;
  @ViewChild('mainDiv') mainDiv: any;

  @ViewChildren('radioCtr') radioCtrs: QueryList<any>;

  ngOnInit() {
    this.answers = [];

    // init
    this.currentSound = { "index": 0, sound: null };

    this.moduleId = this.route.snapshot.params['moduleId'];
    this.sessionId = this.route.snapshot.params['sessionId'];

    this.userTestServices.generateTest(this.sessionId).subscribe(res => {
      let result: ResultData = <ResultData>res;
      this.testData = <TestModel>result.resultData;
      this.currentSound.sound = this.testData.sounds[0];

      console.log(this.testData.sounds);
    }, err => {

    });
  }

  moveWizard(dir: string) {
    let isAnyAnswerSelected: Boolean = false;
    let selectedImageId: number;
    let isSelectionCorrect: boolean;

    this.radioCtrs.forEach(ctr => {
      if (ctr.nativeElement.checked) {
        isAnyAnswerSelected = true;
        selectedImageId = Number(ctr.nativeElement.name);
        if (ctr.nativeElement.value == 'true')
          isSelectionCorrect = true;
        else isSelectionCorrect = false;
      }
    });

    console.log(isAnyAnswerSelected);
    if (!isAnyAnswerSelected)
      return;

    let answer: TestAnswerModel = { soundId: this.currentSound.sound.id, selectedImageId: selectedImageId, isCorrectAnswer: isSelectionCorrect };
    this.answers.push(answer);

    switch (dir) {
      case "forward":
        this.currentSound.index++;

        if (this.currentSound.index === this.testData.sounds.length) {
          this.showResult = true;
          this.computeResult();
          break;
        }
        else {
          this.currentSound.sound = this.testData.sounds[this.currentSound.index];
          this.updateSoundCtr();
          break;
        }
    }
    console.log(this.currentSound);
  }

  updateSoundCtr() {

    let xx = this.soundCtr.nativeElement;
    xx.src = "./assets/_support_files/MP3/" + this.currentSound.sound.name + ".mp3";
  }

  computeResult() {

    let numberOfCorrectAnswers: number = 0;
    this.answers.forEach(ans => {
      if (ans.isCorrectAnswer)
        numberOfCorrectAnswers++;
    });

    this.finalRsultNumber = (numberOfCorrectAnswers / this.answers.length) * 100;
    if (this.finalRsultNumber > 50)
      this.finalResult = 'pass';
    else this.finalResult = 'fail';

    console.log(this.answers);
  }

  radioClicked(event, overlaypanel: OverlayPanel, radioCtr) {
    // disable all radio controls to prevent user change his selection
    this.radioCtrs.forEach(ctr => ctr.nativeElement.disabled = true);

    // check if the user selected correct answer
    this.showCorrect = radioCtr.value;

    // show result panel
    overlaypanel.toggle(event);
  }



}
