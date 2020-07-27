import 'package:auto_route/auto_route_annotations.dart';

//View Imports
import 'package:sub_manager_app/ui/views/user_authentication_view.dart';
import 'package:sub_manager_app/ui/views/home_view.dart';

//Used to automatically build the routes.
@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: UserAuthenticationView, initial: true),
    MaterialRoute(page: HomeView, initial: false)
  ],
)
class $Router {}

//Command to auto-generate routes => flutter pub run build_runner build --delete-conflicting-outputs
