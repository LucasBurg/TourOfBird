import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/bird.dart';

final mockBirds = <Bird>[
  new Bird(1, 'Canário'),
  new Bird(2, 'Coleiro'),
  new Bird(3, 'Sábia'),
];




@Component(
  selector: 'my-app',

  //one line
  //template: '<h1>{{title}}</h1><h2>{{bird.name}}</h2>',

  // multi line
  //template: '''
  //  <h1>{{title}}</h1>
  //  <h2>Detalhes de {{bird.name}}</h2>
  //  <div>
  //    <label>Id: </label>{{bird.id}}
  //  </div>
  //  <div>
  //    <label>name: </label>
  //    <input [(ngModel)]="bird.name" placeholder="name">
  //  </div>
  //''',

  //url ref
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [CORE_DIRECTIVES, formDirectives],
)

class AppComponent {
  final title = 'Tour Of Bird';
  
  List<Bird> birds = mockBirds;


  Bird selectedBird;
  
  void onSelect(Bird bird) => selectedBird = bird;
}