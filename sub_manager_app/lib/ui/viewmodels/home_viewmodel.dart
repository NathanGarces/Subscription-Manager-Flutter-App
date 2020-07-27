import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sub_manager_app/app/locator.dart';
import 'package:sub_manager_app/app/router.gr.dart';
import 'package:sub_manager_app/services/user_auth_service.dart';

class HomeViewModel extends BaseViewModel {
  //Services
  final UserAuthService _authService = locator<UserAuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  //Temp logout button
  void logout() {
    _authService.signout();
    _navigationService.clearStackAndShow(Routes.userAuthenticationView);
  }
}
