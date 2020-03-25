import 'package:figwp/mvoas/action/sign_up_action.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:figwp/mvoas/action/update_categories.dart';
import 'package:figwp/mvoas/model/category_model.dart';

List<SingleChildWidget> actionProviders = [
  Provider<SignUpA>.value(
    value: MockSignUpA.signUpASuccess,
//    value: MockSignUpA.signUpAFail,
  ),
  Provider<UpdateCategoriesA>(
    create: (context) =>
        Provider.of<CategoryModel>(context, listen: false).updateCategoriesA,
  )
];
