import 'package:stacked/stacked.dart';

//Service Imports
import 'package:stacked_services/stacked_services.dart';
import 'package:sub_manager_app/app/locator.dart';
import 'package:sub_manager_app/app/router.gr.dart';
import 'package:sub_manager_app/services/api_exception_handler.dart';
import 'package:sub_manager_app/services/icon_service.dart';
import 'package:sub_manager_app/services/user_auth_service.dart';
import 'package:sub_manager_app/services/validation_service.dart';

class UserAuthenticationViewModel extends BaseViewModel {
  //Services
  final NavigationService _navigationService = locator<NavigationService>();
  final IconService _iconService = locator<IconService>();
  final ValidationService _validationService = locator<ValidationService>();
  final UserAuthService _authService = locator<UserAuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final ApiExceptionHandler _apiExceptionHandler =
      locator<ApiExceptionHandler>();

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
    _enteredEmail = input.trim();
    notifyListeners();
  }

  //Password
  String _enteredPassword = '';
  String get enteredPassword => _enteredPassword;
  void setEnteredPassword(String input) {
    _enteredPassword = input.trim();
    notifyListeners();
  }

  //Confirm Password (Only for sign-up)
  String _enteredConfirmPassword = '';
  String get enteredConfirmPassword => _enteredConfirmPassword;
  void setEnteredConfirmPassword(String input) {
    _enteredConfirmPassword = input.trim();
    notifyListeners();
  }

  UserAuthenticationViewModel() : super() {
    //Find the filepath for the logo.
    _logoPath = _iconService.imageUri(ProjectIcon.logo);
  }

  //Validate and Set any errors on form submission.
  bool validateAuthInput() {
    //Validate each field.
    _emailError = _validationService.validateEmail(enteredEmail);
    _passwordError = _validationService.validatePassword(enteredPassword);

    //Validte confirm password only if it's a signup.
    if (_authenticationType == AuthenticationType.signup) {
      _confirmPasswordError = _validationService.validatePasswords(
          enteredPassword, enteredConfirmPassword);
    } else {
      //If the user had an error on sign-up and then switched to sign-in then the error text would still be stored. This would cause a false 'error' to be found when the method returns true or false.
      _confirmPasswordError = '';
    }

    //Update error fields.
    notifyListeners();

    //True returned if there are any errors.
    return ((_emailError.isNotEmpty) ||
        (_passwordError.isNotEmpty) ||
        (_confirmPasswordError.isNotEmpty));
  }

  //Called when the submit button is clicked or keyboard submit is pressed.
  Future<void> submitAuthRequest() async {
    print("Email: $_enteredEmail Password: $_enteredPassword");
    //Check for input errors first
    if (!validateAuthInput()) {
      //Set the currrent modal state to busy
      setBusy(true);

      if (_authenticationType == AuthenticationType.signin) {
        _authService
            .signIn(_enteredEmail.trim(), _enteredPassword.trim())
            .then((value) => _navigationService.replaceWith(Routes.homeView))
            .catchError((error) {
          showDialog(_apiExceptionHandler.userAuthExceptionDescription(error));
          //Set busy to false if an error occurs
          setBusy(false);
          return "";
        });
      } else {
        _authService
            .signUp(_enteredEmail.trim(), _enteredPassword.trim())
            .then((value) => _navigationService.replaceWith(Routes.homeView))
            .catchError((error) {
          showDialog(_apiExceptionHandler.userAuthExceptionDescription(error));
          return "";
        });
      }
    }
  }

  //Used to show a dialog when an error occurs.
  Future<void> showDialog(String description) async {
    await _dialogService.showDialog(
        title: "An error occured",
        buttonTitle: "Okay",
        description: description);

    //Clear busy state since error was thrown
    setBusy(false);
  }
}

enum AuthenticationType { signin, signup }
