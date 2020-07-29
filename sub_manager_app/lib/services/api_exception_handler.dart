import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

//Used to return the error message based on error type.
@lazySingleton
class ApiExceptionHandler {
  String userAuthExceptionDescription(PlatformException e) {
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        return "The email entered is invalid. Please try again.";
        break;
      case "ERROR_USER_NOT_FOUND":
        return "A user with the entered email could not be found.";
        break;
      case "ERROR_USER_DISABLED":
        return "The user associated with the entered email has been disabled.";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return "The entered email is already in use.";
        break;
      case "ERROR_WRONG_PASSWORD":
        return "The password entered does not match the email entered.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        return "Too many failed attempts were made. Please wait 5 minutes and try again.";
        break;
      default:
        return "An unkown error has occured, please try again.";
        break;
    }
  }
}
