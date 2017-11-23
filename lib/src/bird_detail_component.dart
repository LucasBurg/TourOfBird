import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'bird.dart';

@Component(
  selector: 'bird-detail',
  directives: const [CORE_DIRECTIVES, formDirectives],
  template: '''
    <div *ngIf="bird != null">
      <h2>{{bird.name}} detalhes</h2>
      <div><label>Id: </label>{{bird.id}}</div>
      <div>
        <label>Nome: </label>
        <input [(ngModel)]="bird.name" placeholder="name"/>
      </div>
    </div>
  ''',
)

class HeroDetailComponent {
  @Input()
  Bird bird;
}