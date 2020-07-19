import 'package:injectable/injectable.dart';

//Used to validate different text inputs.

@lazySingleton
class ValidationService {
  String validateEmail(String email) {
    if (email.isEmpty) {
      return "Please enter an email.";
    }

    if (!email.contains("@") || !email.contains(".")) {
      return "Please enter a valid email address.";
    }

    return '';
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return "Please enter a password.";
    }

    if (password.length < 4) {
      return "Password must contain 4+ characters.";
    }

    return '';
  }

  String validatePasswords(String password1, String password2) {
    if (password1.isEmpty || password2.isEmpty) {
      return "Please enter a password.";
    }

    if (password1 != password2) {
      return "Passwords do not match.";
    }

    return '';
  }
}
