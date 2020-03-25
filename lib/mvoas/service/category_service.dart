import 'dart:convert';

import 'package:figwp/mvoas/service/entity/category.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<CategoriesE> fetchCategories() async {
    print('fetching categories');
    final response = await http.get(
        'https://finditgranada.com/wp-json/wp/v2/listing-type?per_page=100');

    print('resposne ${response.body}');
    if (response.statusCode == 200) {
      List categories = json.decode(response.body);
      List<CategoryE> list = categories
          .map((category) => new CategoryE.fromMap(category))
          .toList();
      var categoriesE = CategoriesE(categories: list);
      print('categories fetched');
      return categoriesE;
    } else {
      print('error on cateogry fetch');
      throw Exception('Failed to load Categories');
    }
  }
}
