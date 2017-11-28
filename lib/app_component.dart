import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/birds_component.dart';
import 'src/dashboard_component.dart';
import 'src/bird_detail_component.dart';

@Component (
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="['Dashboard']">Dashboard</a>
      <a [routerLink]="['Birds']">Birds</a>
    </nav>
    <router-outlet></router-outlet>
  ''',
  directives: const [ROUTER_DIRECTIVES, BirdsComponent, DashboardComponent, BirdDetailComponent],
)

@RouteConfig(const [
  const Route(path: '/birds', name: 'Birds', component: BirdsComponent),
  const Route(path: '/dashboard', name: 'Dashboard', component: DashboardComponent),
  const Route(path: '/detail/:id', name: 'BirdDetail', component: BirdDetailComponent),
])

class AppComponent {
  final title = 'Tour Of Bird';
}