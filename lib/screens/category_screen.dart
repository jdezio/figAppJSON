import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/category_screen_arguments.dart';
import '../models/listing.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  //https://finditgranada.com/wp-json/wp/v2/listing?per_page=100&listing-type=49

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final String categoryId = (args.id).toString();
    final String jsonUrl =
        'https://finditgranada.com/wp-json/wp/v2/listing?per_page=100&listing-type=' +
            categoryId;

    return MaterialApp(
      title: 'Listing Name goes here',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text(args.name),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          //child: Text('hello ${args.id}'),
          child: FutureBuilder<List<dynamic>>(
              future: fetchListings(jsonUrl),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Listing> listings = snapshot.data;
                  return ListView(
                    shrinkWrap: true,
                    children: listings
                        .map(
                          (listing) => Card(
                            child: GestureDetector(
                              child: ListTile(
                                leading: Text('image'),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${listing.title.listingTitle != null ? listing.title.listingTitle : ''}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '${listing.acf.acfAddress != null ? listing.acf.acfAddress : ''}',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => CategoryScreen(),
                              //         settings: RouteSettings(arguments: ScreenArguments(listing.id, listing.title))
                              //       ));
                              // },
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
      ),
    );
  }
}

Future<List<Listing>> fetchListings(jsonUrl) async {
//print('Going to load interests');
  final response = await http.get(jsonUrl);

  if (response.statusCode == 200) {
    List listings = json.decode(response.body);
    print('hello');
    //print(listings);
// return listings;
    return listings.map((listing) => new Listing.fromMap(listing)).toList();
  } else {
    throw Exception('Failed to load Listings');
  }
}
