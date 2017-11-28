import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'bird.dart';
import 'bird_service.dart';

@Component(
  selector: 'bird-detail',
  directives: const [CORE_DIRECTIVES, formDirectives],
  templateUrl: 'bird_detail_component.html',
)

class BirdDetailComponent implements OnInit {
  Bird bird;

  final BirdService _birdService;
  final RouteParams _routeParams;
  final Location _location;

  BirdDetailComponent(this._birdService, this._routeParams, this._location);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) bird = await (_birdService.getBird(id));
  }

  void goBack() => _location.back();

}