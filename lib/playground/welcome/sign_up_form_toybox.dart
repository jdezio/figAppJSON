import 'package:figwp/mvoas/action/sign_up_action.dart';
import 'package:figwp/mvoas/view/welcome/sign_up_form.dart';
import 'package:provider/provider.dart';
import 'package:wamf_playground/wamf_playground.dart';

ToyBox signUpFormToyBox = ToyBox(
  issue: 'i-GR-4',
  tags: ['widget'],
  authorEmail: 'typeEmail',
  title: 'Create Sign Up Form',
  toys: [
    Toy(
      title: 'Sign Up Success',
      resizable: true,
      builder: (context) => Provider<SignUpA>.value(
        value: MockSignUpA.signUpASuccess,
        child: SignUpForm(),
      ),
    ),
    Toy(
      title: 'Sign Up Fail',
      resizable: true,
      builder: (context) => Provider<SignUpA>.value(
        value: MockSignUpA.signUpAFail,
        child: SignUpForm(),
      ),
    ),
  ],
);
