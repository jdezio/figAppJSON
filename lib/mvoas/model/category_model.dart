import 'package:rxdart/rxdart.dart';
import 'package:figwp/mvoas/action/update_categories.dart';
import 'package:figwp/mvoas/observable/category.dart';
import 'package:figwp/mvoas/service/category_service.dart';
import 'package:figwp/mvoas/service/entity/category.dart';

class CategoryModel {
  final CategoryService categoryService;

  final BehaviorSubject<CategoriesO> categoriesO$ = BehaviorSubject();

  UpdateCategoriesA updateCategoriesA;

  bool _initialized = false;

  CategoryModel({this.categoryService}) {
//    updateCategories();
    updateCategoriesA = UpdateCategoriesA(updateCategories: updateCategories);
  }

  Future<void> updateCategories() async {
    print('updating categories');
    try {
      CategoriesE categoriesE = await categoryService.fetchCategories();
      categoriesO$.add(
        CategoriesO(
          categories: categoriesE.categories
              .map(
                (categoryE) => CategoryO(
                    name: categoryE.name,
                    description: categoryE.description,
                    imageUrl: categoryE.acf?.featuredImage),
              )
              .toList(),
        ),
      );
      _initialized = true;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void dispose() {
    categoriesO$.close();
  }
}
