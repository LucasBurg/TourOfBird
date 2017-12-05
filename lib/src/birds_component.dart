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

  Future<Null> getBirds() async {
    birds = await _birdService.getBirds();
  }
  


  Future<Null> gotoDetail() => _router.navigate(['BirdDetail', {'id': birdSelected.id.toString()}]);

  Future<Null> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return;
    birds.add(await _birdService.create(name));
    birdSelected = null;
  }

  void onSelect(Bird bird) => birdSelected = bird;

  void ngOnInit() => getBirds();
}