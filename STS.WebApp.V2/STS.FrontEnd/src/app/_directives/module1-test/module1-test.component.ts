import { Component, OnInit, Input } from '@angular/core';
import { ModulesService } from '../../_services/module.service';
import { AlertService } from '../../_services';
import { Router } from '@angular/router';

@Component({
  selector: 'app-module1-test',
  templateUrl: './module1-test.component.html',
  styleUrls: ['./module1-test.component.css']
})
export class Module1TestComponent implements OnInit {

  constructor(private _modulesService: ModulesService,
    private alertService: AlertService,
    private router: Router) { }

  soundsList: any[];

  @Input() moduleId: number;

  allChecked: boolean;
  ngOnInit() {
    this.allChecked = false;
    this.soundsList = [
      { soundUrl: './assets/_support_files/MP3/1_sound_1ambulance.mp3', isChecked: false },
      { soundUrl: './assets/_support_files/MP3/1_sound_1door.mp3', isChecked: false },
      { soundUrl: './assets/_support_files/MP3/1_sound_1car.mp3', isChecked: false }
    ]
  }

  onCheckedChange(sound) {
    let uncheckedCount = this.soundsList.filter(s => s.isChecked == false).length;
    this.allChecked = uncheckedCount <= 0;
    console.log(this.allChecked);
  }

  onNextModuleClicked() {
    this._modulesService.markModuleAsCompleted({ ModuleId: this.moduleId }).subscribe(result => {
      debugger;
      this.alertService.success("تم اختبار الصوت بنجاح");
      this.router.navigate(["/hearing", 2]);
    }, error => { })
  }

}
