import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/utils/routes.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key, required this.title});

  final String title;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[ Text(widget.title,
                                   style: const TextStyle(fontWeight: FontWeight.bold,
                                                          fontFamily: 'LeagueGothic',
                                                          fontSize: 40,),
                              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,10.0,0),
                child: ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(context, Routes.starredPage),
                  child: Text("Starred")
                )),
                Container(
                  //margin: EdgeInsets.fromLTRB(0,0,10.0,0),
                child: ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(context, Routes.favouritePage),
                  child: Text("Favourites")
                )),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned (
            top: (MediaQuery.of(context).size.height * 0.5) - 100.0,
            left: (MediaQuery.of(context).size.width * 0.5) - 50.0,
            child: Image.asset(
              'lib/images/news.png',
              width: 100.0,
              height: 100.0,),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => { },
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Container(
          child: TextButton(
            onPressed: () => Navigator.popAndPushNamed(context, Routes.homePage),
            child: Icon(Icons.home,
                        color: Colors.white,
                        size: 24.0,
            ),
          )),
        ),
      );
    }
  }
