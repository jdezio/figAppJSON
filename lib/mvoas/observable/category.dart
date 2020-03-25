class CategoriesO {
  final List<CategoryO> categories;

  bool get isEmpty => categories == null || categories.length == 0;

  CategoriesO({this.categories});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesO &&
          runtimeType == other.runtimeType &&
          categories == other.categories;

  @override
  int get hashCode => categories.hashCode;
}

class CategoryO {
  final String name;
  final String description;
  final String imageUrl;

  CategoryO({this.imageUrl, this.name, this.description});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CategoryO &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              description == other.description &&
              imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      imageUrl.hashCode;




}
