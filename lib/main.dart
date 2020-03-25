import 'package:flutter/material.dart';
import 'package:figwp/provider/_provider.dart';
import 'package:figwp/router/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Taco',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Router.generator,
        initialRoute: RouteName.homePage,
      ),
    );
  }
}
