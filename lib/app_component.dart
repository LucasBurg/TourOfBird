import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

//import 'src/bird_service.dart';
import 'src/birds_component.dart';

@Component (
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <a [routerLink]="['Birds']">Birds</a>
    <router-outlet></router-outlet>
  ''',
  directives: const [ROUTER_DIRECTIVES, BirdsComponent],
  //providers: const [BirdService]
)

@RouteConfig(const [
  const Route(path: '/birds', name: 'Birds', component: BirdsComponent),
])

class AppComponent {
  final title = 'Tour Of Bird';
}