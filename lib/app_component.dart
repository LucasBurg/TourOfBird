import 'package:angular/angular.dart';

import 'src/bird.dart';
import 'src/bird_detail_component.dart';
import 'src/bird_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [CORE_DIRECTIVES, HeroDetailComponent],
  providers: const [BirdService]
)

class AppComponent implements OnInit {
  
  final title = 'Tour Of Bird';
  
  final BirdService _birdService;
  
  List<Bird> birds;
  
  Bird birdSelected;

  AppComponent(this._birdService);

  void getBirds() {
    birds = _birdService.getBirds();
  }
  
  void ngOnInit() => getBirds();

  void onSelect(Bird bird) => birdSelected = bird;
}