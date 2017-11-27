import 'package:angular/angular.dart';
//import 'src/bird_service.dart';
import 'src/birds_component.dart';

@Component (
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <my-birds></my-birds>
  ''',
  directives: const [BirdsComponent],
  //providers: const [BirdService]
)

class AppComponent {
  
  final title = 'Tour Of Bird';
  
}