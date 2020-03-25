import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:figwp/mvoas/model/category_model.dart';
import 'package:figwp/mvoas/observable/category.dart';

List<SingleChildWidget> observableProviders = [
  StreamProvider<CategoriesO>(
    create: (context) =>
        Provider.of<CategoryModel>(context, listen: false).categoriesO$,
  )
];
