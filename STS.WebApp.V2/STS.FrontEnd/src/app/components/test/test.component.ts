import { Component, OnInit, ViewChild, ChangeDetectorRef, ViewChildren, QueryList } from '@angular/core';
import { UserTestServices } from '../../_services/userTest.service';
import { ActivatedRoute } from '@angular/router';
import { ResultData } from '../../_models/resultData';
import { TestModel, TestSound, TestImage } from '../../_models/test/test.model';
import { SoundModel } from '../../_models/sound.model';
import { OverlayPanel } from 'primeng/components/overlaypanel/overlaypanel';
import { TestResultModel } from '../../_models/test/testResult.model';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.css']
})
export class TestComponent implements OnInit {

  constructor(private userTestServices: UserTestServices
    , private route: ActivatedRoute 
    , private cdr: ChangeDetectorRef) {

  }

  moduleId: number;
  sessionId: number;
  testData: TestModel;
  testResult: TestResultModel;
  currentSound: { "index": 0, sound: TestSound };
  showResult: boolean = false;
  showCorrect: string = null;
  finalResult: string;
  selectedImage: TestImage;


  data: any;

  @ViewChild('resultPanel') resultPanel: any;
  @ViewChild('soundCtr') soundCtr: any;
  @ViewChild('mainDiv') mainDiv: any;

  ngOnInit() {
    // init
    this.selectedImage = null;
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
    debugger;
    if (!this.selectedImage)
      return;
    this.testData.sounds[this.currentSound.index].selectedAnswer = this.selectedImage;
    console.log("updated with answer: ", this.testData);

    switch (dir) {
      case "forward":
        this.currentSound.index++;
        this.selectedImage = null;

        if (this.currentSound.index === this.testData.sounds.length) {
          this.showResult = true;
          this.userTestServices.SubmitTest(this.testData).subscribe(res => {
            let result: ResultData = <ResultData>res;
            this.testResult = <TestResultModel>result.resultData;
            console.log("test result: ", this.testResult);
            this.showResultArea();
          }, err => { });

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

  showResultArea() {

    this.data = {
      labels: ['صحيحة', 'خاطئة'],
      datasets: [
        {
          data: [this.testResult.totalCorrect, this.testResult.totalWrong],
          backgroundColor: [
            "#24a544",
            "#d6614f"
          ],
          hoverBackgroundColor: [
            "#24a544",
            "#d6614f",
          ]
        }]
    };

    let numberOfCorrectAnswers: number = 0;
    this.testData.sounds.forEach(sound => {
      if (sound.selectedAnswer.isCorrectImage)
        numberOfCorrectAnswers++;
    });

    if (this.testResult.score > 50)
      this.finalResult = 'pass';
    else this.finalResult = 'fail';
  }

  imageClicked(event, overlaypanel: OverlayPanel, image: TestImage) {
    if (this.selectedImage)
      return;

    this.selectedImage = image;

    // check if the user selected correct answer
    this.showCorrect = '' + this.selectedImage.isCorrectImage;

    // show result panel
    overlaypanel.show(event);
  }

  //function of play again 
  playAgain(e){
    e.preventDefault();
    this.soundCtr.nativeElement.play();
  }

}
