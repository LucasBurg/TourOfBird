import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'bird.dart';

@Injectable()
class BirdService {

    static const _birdUrl = 'api/birds';

    final Client _http;

    BirdService(this._http);

    Future<List<Bird>> getBirds() async {
        try {

            final res = await _http.get(_birdUrl);

            final birds = _extractData(res).map((val) => new Bird.fromJson(val)).toList();

            return birds;

        } catch (e) {
            throw _handleError(e);
        }
    }

    dynamic _extractData(Response res) => JSON.decode(res.body)['data'];

    Exception _handleError(dynamic e) {
        print(e);
        return new Exception('Server error; cause: $e');
    }

    Future<Bird> getBird(int id) async {
        try {
            final res = await _http.get('$_birdUrl/$id');
            return new Bird.fromJson(_extractData(res));
        } catch (e) {
            throw _handleError(e);
        }
    }
}
