import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsList extends StatelessWidget {

  void getItems() async {
    var url = Uri.https('newsapi.org', '/v2/top-headlines', {'country': 'us', 'apiKey' : 'c6af5a55ce744353bf9744ad09314724'});
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
    } else {
      print('Response status: ${response.statusCode}');
      throw Exception('failed to get news from source');
    }
  }

  @override
  Widget build(BuildContext context) {
    getItems();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(index),
          child: Container(
            height: 70,
            padding: EdgeInsets.fromLTRB(10.0,0,0,0),
            color: Colors.grey,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Container(
                //margin: EdgeInsets.all(3.0),
                //color: Colors.white,
                child: Image.asset(
                  'lib/images/politico.jpg',
                  width: 80.0,
                  height: 150.0,
                ),
              ),Container(
                //margin: EdgeInsets.fromLTRB(2.0,0,0,0),
                width: 280,
                padding: EdgeInsets.fromLTRB(5.0,0,0,0),
                //color: Colors.white,
                child: Text("Washington Post\nLorem ipsumfdfjjjjjjjjjfffffffffffffff ffffffffffffffffffffffffffffffffffffffffffffff ffffffffffffffff now it makes sense that we would",
                            style: TextStyle( height: 1, fontSize: 10),)
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
