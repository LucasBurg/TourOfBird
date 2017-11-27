import 'package:angular/angular.dart';

import 'bird.dart';
import 'bird_mock.dart';

@Injectable()
class BirdService {
    List<Bird> getBirds() => birdsMock;
}
