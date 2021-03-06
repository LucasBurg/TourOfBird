import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'bird.dart';

@Injectable()
class BirdService {
    static final _headers = {'Content-Type': 'application/json'};
    static const _birdUrl = 'api/birds';

    final Client _http;

    BirdService(this._http);

    Future<Null> delete(int id) async {
        try {
            final url = '$_birdUrl/$id';
            await _http.delete(url, headers: _headers);
        } catch (e) {
            _handleError(e);
        }
    }

    Future<Bird> create(String name) async {
        try {
            final res = await _http.post(_birdUrl, headers: _headers, body: JSON.encode({'name': name}));
            return new Bird.fromJson(_extractData(res));
        } catch(e) {
            throw _handleError(e);
        }
    }

    Future<Bird> update(Bird bird) async {
        try {
            final url = '$_birdUrl/${bird.id}';
            final res = await _http.put(url, headers: _headers, body: JSON.encode(bird));
            return new Bird.fromJson(_extractData(res));
        } catch(e) {
            throw _handleError(e);
        }
    }

    Future<List<Bird>> getBirds() async {
        try {
            final res = await _http.get(_birdUrl);
            final birds = _extractData(res).map((value) => new Bird.fromJson(value)).toList();
            return birds;
        } catch (e) {
            throw _handleError(e);
        }
    }

    Future<Bird> getBird(int id) async {
        try {
            final res = await _http.get('$_birdUrl/$id');
            return new Bird.fromJson(_extractData(res));
        } catch (e) {
            throw _handleError(e);
        }
    }

    dynamic _extractData(Response res) => JSON.decode(res.body)['data'];

    Exception _handleError(dynamic e) {
        print(e);
        return new Exception('Server error; cause: $e');
    }
}
