import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'bird.dart';
import 'bird_detail_component.dart';
import 'bird_service.dart';

@Component(
  selector: 'my-birds',
  templateUrl: 'birds_component.html',
  styleUrls: const ['birds_component.css'],
  directives: const [CORE_DIRECTIVES, BirdDetailComponent],
  providers: const [BirdService],
  pipes: const [COMMON_PIPES],
)

class BirdsComponent implements OnInit {
  
  final BirdService _birdService;
  
  final Router _router;

  List<Bird> birds;
  
  Bird birdSelected;

  BirdsComponent(this._birdService, this._router);

  void getBirds() {
    birds = _birdService.getBirds();
  }
  
  void ngOnInit() => getBirds();

  void onSelect(Bird bird) => birdSelected = bird;

  Future<Null> gotoDetail() => _router.navigate(['BirdDetail', {'id': birdSelected.id.toString()}]);
}