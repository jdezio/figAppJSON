import 'package:flutter/material.dart';
import 'package:figwp/mvoas/view/home/home_page.dart';
import 'package:wamf_playground/wamf_playground.dart';

class GriffelPlayground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Playground(
      title: 'Taco Playground',
      toys: [
        Toy(
          title: 'Example',
          issue: 'i-GR-3',
          issueUrl: 'www.google.com',
          tags: ['example'],
          disableScaffold: true,
          builder: (context) => HomePage(),
        ),

      ],
    );
  }
}
