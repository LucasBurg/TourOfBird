import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../bird.dart';

@Injectable()
class BirdSearchService {
  final Client _http;

  BirdSearchService(this._http);

  Future<List<Bird>> search(String term) async {
    try {
        final res = await _http.get('app/birds/?name=$term');

        return _extractData(res).map((json) => new Bird.fromJson(json)).toList();
    } catch (e) {
        throw _handleError(e);
    }    
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); 
    return new Exception('Server error; cause: $e');
  }

}
