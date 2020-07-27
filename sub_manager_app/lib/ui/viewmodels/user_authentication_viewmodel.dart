import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sub_manager_app/app/locator.dart';
import 'package:sub_manager_app/services/icon_service.dart';
import 'package:sub_manager_app/services/validation_service.dart';

class UserAuthenticationViewModel extends BaseViewModel {
  //Services
  final NavigationService _navigationService = locator<NavigationService>();
  final IconService _iconService = locator<IconService>();
  final ValidationService _validationService = locator<ValidationService>();

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
  String get passwordTitle => _passwordTitle;
  String _confirmPasswordTitle = 'Confirm Passowrd';
  String get confirmPasswordTitle => _confirmPasswordTitle;

  //FORM ERROR STRINGS
  String _emailError = '';
  String get emailError => _emailError;
  String _passwordError = '';
  String get passwordError => _passwordError;
  String _confirmPasswordError = '';
  String get confirmPasswordError => _confirmPasswordError;

  //UI ICONS
  String _logoPath;
  String get logoPath => _logoPath;

  //Auth States (Used to swop between sign in and sign up)
  AuthenticationType _authenticationType = AuthenticationType.signup;
  AuthenticationType get authenticationType => _authenticationType;
  void setAuthenticationType(AuthenticationType type) {
    _authenticationType = type;
    notifyListeners();
  }

  //Input Variables
  //Email
  String _enteredEmail = '';
  String get enteredEmail => _enteredEmail;
  void setEnteredEmail(String input) {
    _enteredEmail = input;
  }

  //Password
  String _enteredPassword = '';
  String get enteredPassword => _enteredPassword;
  void setEnteredPassword(String input) {
    _enteredPassword = input;
  }

  //Confirm Password (Only for sign-up)
  String _enteredConfirmPassword = '';
  String get enteredConfirmPassword => _enteredConfirmPassword;
  void setEnteredConfirmPassword(String input) {
    _enteredConfirmPassword = input;
  }

  //Constructor for logopath value.
  UserAuthenticationViewModel() : super() {
    _logoPath = _iconService.imageUri(ProjectIcon.logo);
  }

  //Validate and Set any errors on form submission.
  void validateAuthInput() {
    //Validate each field.
    _emailError = _validationService.validateEmail(enteredEmail);
    _passwordError = _validationService.validatePassword(enteredPassword);

    if (_authenticationType == AuthenticationType.signup) {
      _confirmPasswordError = _validationService.validatePasswords(
          enteredPassword, enteredConfirmPassword);
    }

    notifyListeners();
  }

  void submitAuthRequest() {
    validateAuthInput();

    print("Pressed");
  }
}

enum AuthenticationType { signin, signup }
