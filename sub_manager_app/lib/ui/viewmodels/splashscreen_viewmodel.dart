import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sub_manager_app/app/locator.dart';
import 'package:sub_manager_app/app/router.gr.dart';
import 'package:sub_manager_app/services/icon_service.dart';
import 'package:sub_manager_app/services/user_auth_service.dart';

class SplashScreenViewModel extends FutureViewModel {
  //Services
  final NavigationService _navigationService = locator<NavigationService>();
  final IconService _iconService = locator<IconService>();
  final UserAuthService _authService = locator<UserAuthService>();

  //Program Title
  String _title = "SubManager";
  String get title => _title;

  //Logo
  String _logoPath;
  String get logoPath => _logoPath;

  SplashScreenViewModel() : super() {
    _logoPath = _iconService.imageUri(ProjectIcon.logo);
  }

  @override
  Future<void> futureToRun() async {
    int splashScreenDuration = 3;

    if (await _authService.isLoggedIn()) {
      //User is logged in
      await Future.delayed(Duration(
          seconds:
              splashScreenDuration)); //The delay is just to appreciate my loading screen because it actually loads super quickly XD
      _navigationService.navigateTo(Routes.homeView);
    } else {
      await Future.delayed(Duration(seconds: splashScreenDuration));
      _navigationService.navigateTo(Routes.userAuthenticationView);
    }
  }
}
