import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'bird.dart';
import 'bird_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [BirdService],
)

class DashboardComponent implements OnInit {
  List<Bird> birds;
  final BirdService _birdService;
  DashboardComponent(this._birdService);

  Future<Null> ngOnInit() async {
    birds = (await _birdService.getBirds()).skip(1).take(4).toList();
  }
}