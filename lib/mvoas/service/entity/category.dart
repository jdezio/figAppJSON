class CategoryE {
  final int id;
  final int count;
  final String name;
  final String description;
  final String link;
  final String slug;
  final String taxonomy;
  final AcfE acf;

  CategoryE(
      {this.id,
      this.count,
      this.description,
      this.link,
      this.slug,
      this.taxonomy,
      this.name,
      this.acf});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'count': this.count,
      'name': this.name,
      'description': this.description,
      'link': this.link,
      'slug': this.slug,
      'taxonomy': this.taxonomy,
      'acf': this.acf.toMap(),
    };
  }

  factory CategoryE.fromMap(Map<String, dynamic> map) {
    return CategoryE(
      id: map['id'] as int,
      count: map['count'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      link: map['link'] as String,
      slug: map['slug'] as String,
      taxonomy: map['taxonomy'] as String,
//      Here we check if there is `acf` key in map, and if that key is indeed `Map`
//    There are some errors in JSON and if there is nothing in `acf` we put null, else we put `Acf` object
      acf: map['acf'] != null && map['acf'] is Map
          ? AcfE.fromMap(map['acf'])
          : null,
    );
  }

  @override
  String toString() {
    return 'CategoryE{id: $id, count: $count, name: $name, description: $description, link: $link, slug: $slug, taxonomy: $taxonomy, acf: $acf}';
  }
}

// Here we added  toMap and fromMap to Acf class. Notice that the map key `featured_image` must be the same as
// used in JSON. But the variable is named according to dart standard with camel case `featuredImage`
class AcfE {
  final String featuredImage;

  AcfE({this.featuredImage});

  Map<String, dynamic> toMap() {
    return {
      'featured_image': this.featuredImage,
    };
  }

  factory AcfE.fromMap(Map<String, dynamic> map) {
    return new AcfE(
      featuredImage: map['featured_image'] as String,
    );
  }
}

class CategoriesE {
  final List<CategoryE> categories;

  CategoriesE({this.categories});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesE &&
          runtimeType == other.runtimeType &&
          categories == other.categories;

  @override
  int get hashCode => categories.hashCode;

  @override
  String toString() {
    return 'CategoriesE{categories: $categories}';
  }
}
