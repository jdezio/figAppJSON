import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:figwp/mvoas/action/update_categories.dart';
import 'package:figwp/mvoas/observable/category.dart';
import 'package:figwp/router/router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories Example'),
        actions: <Widget>[
          Consumer<UpdateCategoriesA>(
            builder: (_, updateCategoriesA, __) => IconButton(
                icon: Icon(Icons.update),
                onPressed: () => updateCategoriesA.updateCategories()),
          )
        ],
      ),
      body: Consumer<CategoriesO>(
        builder: (context, categoriesO, _) {
          if (categoriesO == null || categoriesO.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                controller: ScrollController(),
                itemCount: categoriesO.categories.length,
                itemBuilder: (context, index) {
                  CategoryO categoryO = categoriesO.categories[index];
                  return ListTile(
                    title: Text(categoryO.name),
                    subtitle: Text(categoryO.description),
                    leading: categoryO.imageUrl != null
                        ? Image.network(categoryO.imageUrl)
                        : null,

                    //categoryO.imageUrl != null ? Icon(Icons.image) : null,
                    onTap: () => categoryO.imageUrl != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scaffold(
                                      appBar: AppBar(),
                                      body: Center(
                                          child: Image.network(
                                              categoryO.imageUrl)),
                                    )))
                        : null,
                  );
                });
          }
        },
      ),
    );
  }
}
