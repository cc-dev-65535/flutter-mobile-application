import 'package:flutter/material.dart';
import 'package:my_app/models/newsItem.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget {
  NewsList({required this.articles});

  List<NewsItem> articles = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: articles != null ? articles.length : 1,
      padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
      itemBuilder: (BuildContext context, int index) {
        if (articles != null) {
          //final Uri externalUrl = Uri.parse(articles[index].url);
          var url = Uri.https('newsapi.org', '/v2/top-headlines', {'country': 'us', 'apiKey' : 'c6af5a55ce744353bf9744ad09314724'});
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
                  child: articles[index].urlToImage != "null" ? Image.network(articles[index].urlToImage,
                    width: 80.0,
                    height: 150.0,) : Image.asset(
                      'lib/images/No-photo-m.png',
                      width: 80.0,
                      height: 150.0,
                    ),
                  ),Container(
                    //margin: EdgeInsets.fromLTRB(2.0,0,0,0),
                    width: 280,
                    padding: EdgeInsets.fromLTRB(5.0,15.0,0,0),
                    //color: Colors.white,
                    child: Column(
                        children: <Widget>[ Text(
                                            articles[index].title,
                                            style: TextStyle( height: 1, fontSize: 10, fontWeight: FontWeight.bold)),
                                          InkWell(
                                            child: Text('Read More', style: TextStyle(height: 1, fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue, decoration: TextDecoration.underline)),
                                            onTap: () => launch(articles[index].url),),],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    /*RichText(
                      text: TextSpan(
                        text: articles[index].title + ' - ',
                        style: TextStyle( height: 1, fontSize: 10, fontWeight: FontWeight.bold),
                        children: const <TextSpan>[
                          TextSpan(text: 'Read More',
                                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer(),
                                    ..onTap = () async {
                                      if (await canLaunch(externalUrl)) {
                                        await launch(externalUrl);
                                      } else {
                                        print("URL can't be launched.");
                                      }
                                    }
                          ),
                        ],
                      ),
                    )*/
                  ),
                ],
              ),
            ),
          );
        } else {
          //Display some widget here if no items?
          return Text("Try again later!");
        }
      },
    );
  }

}
