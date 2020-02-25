class Category {
  final int id;
  final int count;
  final String name;
  final String description;
  final String link;
  final String slug;
  final String taxonomy;
  final String featuredImage;

  Category(
      {this.id,
      this.count,
      this.description,
      this.link,
      this.slug,
      this.taxonomy,
      this.name,
      this.featuredImage});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'count': this.count,
      'name': this.name,
      'description': this.description,
      'link': this.link,
      'slug': this.slug,
      'taxonomy': this.taxonomy,
      'featured_image': this.featuredImage,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return new Category(
      id: map['id'] as int,
      count: map['count'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      link: map['link'] as String,
      slug: map['slug'] as String,
      taxonomy: map['taxonomy'] as String,
      featuredImage: map['featured_image'] as String,
    );
  }
}

class Acf {
  final String featuredImage;

  Acf({this.featuredImage});

  factory Acf.fromMap(Map<String, dynamic> map) {
    return new Acf(
      featuredImage: map['featured_image'] as String,
    );
  }
}

// class Category {
//   final String id;
//   final String name;

//   Category({this.id, this.name});

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       name: json['name'],
//       id: json['id'],
//     );
//   }
// }

// class Acf {
//   final String featuredImage;

//   Acf({this.featuredImage});

//   factory Acf.fromJson(Map<String, dynamic> json) {
//     return Acf(featuredImage: json['featured_image']);
//   }
// }
