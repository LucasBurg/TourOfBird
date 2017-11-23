import 'package:angular/angular.dart';

import 'src/bird.dart';
import 'src/bird_mock.dart';
import 'src/bird_detail_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [CORE_DIRECTIVES, HeroDetailComponent],
)

class AppComponent {
  final title = 'Tour Of Bird';
  List<Bird> birds = birdsMock;
  Bird birdSelected;
  void onSelect(Bird bird) => birdSelected = bird;
}