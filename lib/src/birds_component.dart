import 'package:angular/angular.dart';
import 'bird.dart';
import 'bird_detail_component.dart';
import 'bird_service.dart';

@Component(
  selector: 'my-birds',
  templateUrl: 'birds_component.html',
  styleUrls: const ['birds_component.css'],
  directives: const [CORE_DIRECTIVES, BirdDetailComponent],
  providers: const [BirdService]
)

class BirdsComponent implements OnInit {
  
  final BirdService _birdService;
  
  List<Bird> birds;
  
  Bird birdSelected;

  BirdsComponent(this._birdService);

  void getBirds() {
    birds = _birdService.getBirds();
  }
  
  void ngOnInit() => getBirds();

  void onSelect(Bird bird) => birdSelected = bird;
}