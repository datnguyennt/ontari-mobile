enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  weakPassword,
  accountExistsWithDifferentCredential
}

class AuthExceptionHandler {
  static dynamic handleException(e) {
    AuthResultStatus status;
    switch (e.code) {
      case 'invalid-email':
        status = AuthResultStatus.invalidEmail;
        break;
      case 'wrong-password':
        status = AuthResultStatus.wrongPassword;
        break;
      case 'user-not-found':
        status = AuthResultStatus.userNotFound;
        break;
      case 'user-disabled':
        status = AuthResultStatus.userDisabled;
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        status = AuthResultStatus.tooManyRequests;
        break;
      case 'operation-not-allowed':
        status = AuthResultStatus.operationNotAllowed;
        break;
      case 'email-already-in-use':
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case 'weak-password':
        status = AuthResultStatus.weakPassword;
        break;
      case 'account-exists-with-different-credential':
        status = AuthResultStatus.accountExistsWithDifferentCredential;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static String generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = 'Your email address appears to be malformed.';
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = 'Your password is wrong.';
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = 'User with this email has been disabled.';
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = 'Too many requests. Try again later.';
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = 'Signing in with Email and Password is not enabled.';
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            'The email has already been registered. Please login or reset your password.';
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = 'Password too weak';
        break;
      case AuthResultStatus.accountExistsWithDifferentCredential:
        errorMessage = 'The account already exists with a different credential';
        break;
      default:
        errorMessage = 'An undefined Error happened.';
    }

    return errorMessage;
  }
}
