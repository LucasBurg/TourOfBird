import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

class Bird {
  final int id;
  String name;

  Bird(this.id, this.name);
}

@Component(
  selector: 'my-app',

  //one line
  //template: '<h1>{{title}}</h1><h2>{{bird.name}}</h2>',

  // multi line
  template: '''
    <h1>{{title}}</h1>
    <div>
      <label>name: </label>
      <input [(ngModel)]="bird.name" placeholder="name">
    </div>
    <h2>Detalhes de {{bird.name}}</h2>
    <div>
      <label>Id: </label>{{bird.id}}
    </div>
    <div>
      <label>Nome: </label>{{bird.name}}
    </div>
  ''',
  directives: const [formDirectives],
)

class AppComponent {
  final title = 'Tour Of Bird';
  
  Bird bird = new Bird(1, 'Canário');
}
