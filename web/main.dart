import 'package:angular/angular.dart';
import 'package:angular_app/app_component.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/browser_client.dart';

void main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(BrowserClient, useFactory: () => new BrowserClient(), deps: []),
  ]);
}
