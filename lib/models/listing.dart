class Listing {
  final int id;
  final Guid title;
  // final String description;
  // final String link;
  // final String slug;
  // final String taxonomy;

  Listing(
      {this.id,
      this.title,
      // this.description,
      // this.link,
      // this.slug,
      // this.taxonomy,
      });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      // 'description': this.description,
      // 'link': this.link,
      // 'slug': this.slug,
      // 'taxonomy': this.taxonomy,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    return new Listing(
      id: map['id'] as int,
      title : map['title'] != null ? new Guid.fromMap(map['title']) : null,
      // title: map['title'] as String,
      // description: map['description'] as String,
      // link: map['link'] as String,
      // slug: map['slug'] as String,
      // taxonomy: map['taxonomy'] as String,
    );
  }
}


class Guid {
  String rendered;

  Guid({this.rendered});

  Guid.fromMap(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    print(data);
    return data;
  }
}



class Acf {
  final String featuredImage;

  Acf({this.featuredImage});

  factory Acf.fromJson(Map<String, dynamic> map) {
    print(Acf(featuredImage: map['featured_image']));
    return Acf(featuredImage: map['featured_image']);
  }
}