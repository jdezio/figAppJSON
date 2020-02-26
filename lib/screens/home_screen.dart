import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:figwp/models/category.dart';
import 'category_screen.dart';
import '../models/category_screen_arguments.dart';

void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'JSON Advanced',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Scaffold(
          appBar: AppBar(
              title: Text(
            'JSON Advanced',
          )),
          body: Center(
            child: FutureBuilder<List<dynamic>>(
                future: fetchListCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Category> categories = snapshot.data;
                    return ListView(
                      shrinkWrap: true,
                      children: categories
                          .map(
                            (category) => Card(
                              child: GestureDetector(
                                child: ListTile(
                                  title: Text(
                                      // in the second part we check if there is acf field. If there is we write the featured image
//                                    // if there is not, we just put empty string
                                      '${category.name} ${category.acf != null ? category.acf.featuredImage : ''}'),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryScreen(),
                                          settings: RouteSettings(
                                              arguments: ScreenArguments(
                                                  category.id,
                                                  category.name))));
                                },
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}' + 'there is an error');
                  } else {
                    return new CircularProgressIndicator();
                  }
                }),
          ),
        ));
  }
}

Future<List<Category>> fetchListCategory() async {
//print('Going to load interests');
  final response = await http
      .get('https://finditgranada.com/wp-json/wp/v2/listing-type?per_page=100');

  if (response.statusCode == 200) {
    List categories = json.decode(response.body);
//    print(categories[0]);
// return categories;
    var list =
        categories.map((category) => new Category.fromMap(category)).toList();
    return list;
  } else {
    throw Exception('Failed to load Categories');
  }
}
