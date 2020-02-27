class Listing {
  final int id;
  final Title title;
  final Acf acf;
  // final String description;
  // final String link;
  // final String slug;
  // final String taxonomy;

  Listing(
      {this.id,
      this.title,
      this.acf,
      // this.description,
      // this.link,
      // this.slug,
      // this.taxonomy,
      });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title.toMap(),
      'acf': this.acf.toMap(),
      // 'description': this.description,
      // 'link': this.link,
      // 'slug': this.slug,
      // 'taxonomy': this.taxonomy,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    return new Listing(
      id: map['id'] as int,
      title: map['title'] != null && map['title'] is Map
          ? Title.fromMap(map['title'])
          : null,
       acf: map['acf'] != null && map['acf'] is Map
          ? Acf.fromMap(map['acf'])
          : null,
    );
  }
}


class Title {
  final String listingTitle;

  Title({this.listingTitle});

  Map<String, dynamic> toMap() {
    return {
      'rendered': this.listingTitle,
    };
  }

  factory Title.fromMap(Map<String, dynamic> map) {
    return new Title(
      listingTitle: map['rendered'] as String,
    );
  }
}



class Acf {
  final String acfAddress;

  Acf({this.acfAddress});

  Map<String, dynamic> toMap() {
    return {
      'acf_address': this.acfAddress,
    };
  }

  factory Acf.fromMap(Map<String, dynamic> map) {
    return new Acf(
      acfAddress: map['acf_address'] as String,
    );
  }
}