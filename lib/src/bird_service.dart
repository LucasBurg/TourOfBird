import 'dart:async';
import 'package:angular/angular.dart';

import 'bird.dart';
import 'bird_mock.dart';

@Injectable()
class BirdService {
    List<Bird> getBirds() => birdsMock;
    Future<Bird> getBird(int id) async => (await getBirds()).firstWhere((bird) => bird.id == id);
}
