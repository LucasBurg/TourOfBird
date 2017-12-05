import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:stream_transform/stream_transform.dart';

import 'bird_search_service.dart';
import '../bird.dart';

@Component(
    selector: 'bird-search',
    templateUrl: 'bird_search_component.html',
    styleUrls: const ['bird_search_component.css'],
    directives: const [CORE_DIRECTIVES],
    providers: const [BirdSearchService],
    pipes: const [COMMON_PIPES])
class BirdSearchComponent implements OnInit {

  BirdSearchService _birdSearchService;
  
  Router _router;

  Stream<List<Bird>> birds;

  StreamController<String> _searchTerms =
      new StreamController<String>.broadcast();

  BirdSearchComponent(this._birdSearchService, this._router) {}

  void search(String term) => _searchTerms.add(term);

  Future<Null> ngOnInit() async {
    birds = _searchTerms.stream.transform(debounce(new Duration(milliseconds: 300)))
      .distinct()
      .transform(switchMap((term) => term.isEmpty 
        ? new Stream<List<Bird>>.fromIterable([<Bird>[]])
        : _birdSearchService.search(term).asStream()))
      .handleError((e) { print(e); });  
  }

  void gotoDetail(Bird bird) {
    var link = ['BirdDetail', {'id': bird.id.toString()}];
    _router.navigate(link);  
  }


}
