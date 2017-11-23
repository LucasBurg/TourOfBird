import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

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

  directives: const [formDirectives],
)

class AppComponent {
  final title = 'Tour Of Bird';
  
  Bird bird = new Bird(1, 'Canário');
}

class Bird {
  final int id;
  String name;

  Bird(this.id, this.name);
}