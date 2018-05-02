import { Component, OnInit, ChangeDetectorRef, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TestModel, TestSound, TestImage } from '../../../_models/test/test.model';
import { TestResultModel } from '../../../_models/test/testResult.model';
import { TimerComponent } from '../../timer/timer.component';
import { SixlingService } from '../../../_services/sixling.service';
import { ResultData } from '../../../_models/resultData';
import { OverlayPanel } from 'primeng/overlaypanel';

@Component({
  selector: 'app-six-ling-test',
  templateUrl: './six-ling-test.component.html',
  styleUrls: ['./six-ling-test.component.css']
})
export class SixLingTestComponent implements OnInit {

  constructor(private sixlingService: SixlingService
    , private route: ActivatedRoute
    , private cdr: ChangeDetectorRef
    , private router: Router) {

  }

  testData: TestModel;
  testResult: TestResultModel;
  currentSound: { 'index': 0, sound: TestSound };
  showResult = false;
  showCorrect: string = null;
  finalResult: string;
  selectedImage: TestImage;
  progressBarValue = 0;
  moveWizardTimer: any;

  data: any;

  @ViewChild('resultPanel') resultPanel: any;
  @ViewChild('soundCtr') soundCtr: any;
  @ViewChild('mainDiv') mainDiv: any;
  @ViewChild('timer') timer: TimerComponent;

  SetProgressBar(n: number) {
    const total = this.testData.sounds.length;
    this.progressBarValue = (n / total) * 100;
  }
  ngOnInit() {
    // init

    this.selectedImage = null;
    this.currentSound = { 'index': 0, sound: null };

    this.sixlingService.getTest().subscribe(res => {
      const result: ResultData = <ResultData>res;
      this.testData = <TestModel>result.resultData;
      this.currentSound.sound = this.testData.sounds[0];

      this.timer.startTimer();

      console.log(this.testData.sounds);
    }, err => {

    });
  }

  moveWizard(dir: string) {
    clearTimeout(this.moveWizardTimer);

    if (!this.selectedImage)
      return;
    this.SetProgressBar(this.currentSound.index + 1);
    this.showCorrect = null;
    this.testData.sounds[this.currentSound.index].selectedAnswer = this.selectedImage;
    console.log('updated with answer: ', this.testData);

    switch (dir) {
      case 'forward':
        this.currentSound.index++;
        this.selectedImage = null;

        if (this.currentSound.index === this.testData.sounds.length) {
          this.timer.stopTimer();
          console.log(this.timer.elapsedTime);
          this.showResult = true;

          // init testResult model
          this.testResult = new TestResultModel();
          this.testResult.totalSounds = this.testData.sounds.length;
          this.testResult.totalCorrect = 0;
          this.testResult.totalWrong = 0;
          this.testResult.isPassed = true;
          this.finalResult = 'pass';

          // loop thru answers
          this.testData.sounds.forEach(s => {
            // check if selected answer is correct or not
            if (s.selectedAnswer.isCorrectImage) {
              this.testResult.totalCorrect++;
            } else {
              this.testResult.totalWrong++;
              this.testResult.isPassed = false;
              this.finalResult = 'fail';
            }
          });

          // set local session item
          if (this.testResult.isPassed) {
            localStorage.setItem('isSixLingTestCompleted', 'passed');
          }

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
    this.soundCtr.nativeElement.src = './assets/_support_files/MP3/' + this.currentSound.sound.name + '.mp3';
    this.soundCtr.nativeElement.autoplay = true;
  }

  imageClicked(event, overlaypanel: OverlayPanel, image: TestImage) {
    if (this.selectedImage)
      return;

    this.soundCtr.nativeElement.pause();
    this.soundCtr.nativeElement.currentTime = 0;

    this.selectedImage = image;

    // check if the user selected correct answer
    this.showCorrect = '' + this.selectedImage.isCorrectImage;

    // show result panel
    // overlaypanel.show(event);
    this.moveWizardTimer = setTimeout(() => this.moveWizard('forward'), 5000);
  }

  //function of play again 
  playAgain(e) {
    e.preventDefault();
    this.soundCtr.nativeElement.play();
  }

  contToModules() {
    this.router.navigate([`/hearing`]);
  }

  retakeTest() {
    window.location.reload();
  }

}
