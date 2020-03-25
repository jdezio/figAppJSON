import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:figwp/mvoas/service/category_service.dart';

List<SingleChildWidget> serviceProviders = [
  Provider<CategoryService>.value(value: CategoryService())
];
