class Category {
  final int id;
  final int count;
  final String name;
  final String description;
  final String link;
  final String slug;
  final String taxonomy;
  final Acf acf;

  Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
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
          ? Acf.fromMap(map['acf'])
          : null,
    );
  }
}

// Here we added  toMap and fromMap to Acf class. Notice that the map key `featured_image` must be the same as
// used in JSON. But the variable is named according to dart standard with camel case `featuredImage`
class Acf {
  final String featuredImage;

  Acf({this.featuredImage});

  Map<String, dynamic> toMap() {
    return {
      'featured_image': this.featuredImage,
    };
  }

  factory Acf.fromMap(Map<String, dynamic> map) {
    return new Acf(
      featuredImage: map['featured_image'] as String,
    );
  }
}
