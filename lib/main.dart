import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/widget/news_list.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/widget/starred_page.dart';
import 'package:my_app/widget/favourite_page.dart';
import 'package:my_app/services/services.dart';
import 'package:my_app/controllers/articles.dart';
import 'package:my_app/models/newsItem.dart';

void main() {
  var services = HttpServices();
  var controller = ArticleController(services);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  .then((_) => runApp(
    MyApp(controller: controller),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.controller});

  final ArticleController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        Routes.homePage: (context) => MyHomePage(title: 'News Today', controller: controller),//PageContainer(pageType: PageType.HomePage),
        Routes.starredPage: (context) => StarredPage(title: 'Starred'),//PageContainer(pageType: PageType.FirstPage),
        Routes.favouritePage: (context) => FavouritePage(title: 'Favourites'),//PageContainer(pageType: PageType.SecondPage),
      },
      //home: MyHomePage(title: 'News Today', controller: controller),
      initialRoute: Routes.homePage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.controller});

  final String title;
  final ArticleController controller;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isLoading = false;
  List<NewsItem> articles = [];

  Widget get innerWidget => isLoading ? CircularProgressIndicator() : Expanded(child: NewsList(articles : articles));

  void initState() {
    super.initState();
    widget.controller.onSync.listen((bool syncState) => setState(() { isLoading = syncState; }));
    _getArticles();
  }

  void _getArticles() async {
    var returnedNews = await widget.controller.fetchArticles();
    setState(() => articles = returnedNews);
  }

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
                    onPressed: () => Navigator.pushNamed(context, Routes.starredPage),
                    child: Text("Starred")
                  )),
                  Container(
                    //margin: EdgeInsets.fromLTRB(0,0,10.0,0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, Routes.favouritePage),
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
                Positioned (
                  top: 0.0,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      innerWidget,
                      Container(height: 140),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _getArticles,
              tooltip: 'Refresh',
              child: const Icon(Icons.refresh),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.blueGrey,
              child: Container(
                child: TextButton(
                  onPressed: () => Navigator.popUntil(context, ModalRoute.withName(Routes.homePage)),
                  child: Icon(Icons.home,
                    color: Colors.white,
                    size: 24.0,
                  ),
                )),
              ),
            );
          }
        }
