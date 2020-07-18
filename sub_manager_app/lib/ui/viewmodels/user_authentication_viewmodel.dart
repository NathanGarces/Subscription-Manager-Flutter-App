import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sub_manager_app/app/locator.dart';
import 'package:sub_manager_app/services/icon_service.dart';

class UserAuthenticationViewModel extends BaseViewModel {
  //Services
  final NavigationService _navigationService = locator<NavigationService>();
  final IconService _iconService = locator<IconService>();

  //UI Strings
  String _title = 'SubManager';
  String get title => _title;
  String _signup = 'SIGN UP';
  String get signup => _signup;
  String _signin = 'SIGN IN';
  String get signin => _signin;

  //FORM STRINGS
  String _emailTitle = 'Email';
  String get emailTitle => _emailTitle;
  String _passwordTitle = 'Password';
  String get password => _passwordTitle;
  String _confirmPasswordTitle = 'Confirm Passowrd';
  String get confirmPasswordTitle => _confirmPasswordTitle;

  //UI ICONS
  String _logoPath;
  String get logoPath => _logoPath;

  //Auth States (Used to swop between sign in and sign up)
  AuthenticationType _authenticationType = AuthenticationType.signup;
  AuthenticationType get authenticationType => _authenticationType;
  void changeAuthenticationType() {
    if (_authenticationType == AuthenticationType.signin) {
      _authenticationType = AuthenticationType.signup;
    } else {
      _authenticationType = AuthenticationType.signin;
    }

    notifyListeners();
  }

  //Input Variables
  //Email
  String _enteredEmail = '';
  String get enteredEmail => _enteredEmail;
  void setEnteredEmail(String input) {
    _enteredEmail = input;
    notifyListeners();
  }

  //Password
  String _enteredPassword = '';
  String get enteredPassword => _enteredPassword;
  void setEnteredPassword(String input) {
    _enteredPassword = input;
    notifyListeners();
  }

  //Confirm Password (Only for sign-up)
  String _enteredConfirmPassword = '';
  String get enteredConfirmPassword => _enteredPassword;
  void setEnteredConfirmPassword(String input) {
    _enteredConfirmPassword = input;
    notifyListeners();
  }

  //Constructor for logopath value.
  UserAuthenticationViewModel() : super() {
    _logoPath = _iconService.imageUri(ProjectIcon.logo);
  }
}

enum AuthenticationType { signin, signup }
