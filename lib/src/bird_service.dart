import 'dart:async';

import 'package:angular/angular.dart';

import 'bird.dart';
import 'bird_mock.dart';

@Injectable()
class BirdService {
    Future<List<Bird>> getBirds() async => birdsMock;
}
