import 'package:angular/angular.dart';

class Bird {
  final int id;
  String name;

  Bird(this.id, this.name);
}

@Component(
  selector: 'my-app',
  template: '<h1>{{title}}</h1><h2>{{bird.name}}</h2>',
)

class AppComponent {
  final title = 'Tour Of Bird';
  
  Bird bird = new Bird(1, 'Canário');
}
