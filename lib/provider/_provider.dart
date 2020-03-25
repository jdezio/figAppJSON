import 'package:figwp/provider/action_provider.dart';
import 'package:figwp/provider/model_provider.dart';
import 'package:figwp/provider/observable_provider.dart';
import 'package:figwp/provider/service_provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...serviceProviders,
  ...modelProviders,
  ...observableProviders,
  ...actionProviders
];
