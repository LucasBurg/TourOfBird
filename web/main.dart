import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_app/app_component.dart';
import 'package:angular_app/in_memory_data_service.dart';

import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(Client, useClass: InMemoryDataService),
    //provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),
  ]);
}
