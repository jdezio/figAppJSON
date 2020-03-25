import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:figwp/mvoas/model/category_model.dart';

List<SingleChildWidget> modelProviders = [
  Provider<CategoryModel>(
    create: (context) =>
        CategoryModel(categoryService: Provider.of(context, listen: false)),
    dispose: (context, model) => model.dispose(),
  )
];
