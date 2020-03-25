import 'package:flutter/foundation.dart';

typedef Future<void> SignUp(
    String firstName, String lastName, String password, String email);

class SignUpA {
  final SignUp signUp;

  const SignUpA({
    @required this.signUp,
  });
}

class MockSignUpA {
  static SignUpA signUpASuccess = SignUpA(signUp: signUpSuccess);
  static SignUpA signUpAFail = SignUpA(signUp: signUpFail);

  static Future<void> signUpSuccess(
      String firstName, String lastName, String password, String email) {
    return null;
  }

  static Future<void> signUpFail(
      String firstName, String lastName, String password, String email) {
    throw SignUpE(message: 'error', code: '400');
  }
}

class SignUpE extends Error {
  final message;
  final code;

  SignUpE({
    @required this.message,
    @required this.code,
  });
}
