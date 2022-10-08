import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/widget/news_list.dart';
import 'package:my_app/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  .then((_) => runApp(
    MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        Routes.homePage: (context) => const MyHomePage(title: 'News Today'),//PageContainer(pageType: PageType.HomePage),
        Routes.firstPage: (context) => const MyHomePage(title: 'News Today'),//PageContainer(pageType: PageType.FirstPage),
        Routes.secondPage: (context) => const MyHomePage(title: 'News Today'),//PageContainer(pageType: PageType.SecondPage),
      },
      home: const MyHomePage(title: 'News Today'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[ Text(widget.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(context, Routes.firstPage),
                  child: Text("Starred")
                ),ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(context, Routes.secondPage),
                  child: Text("Favourites")
                ),
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
                  Expanded(
                    child: NewsList(),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh),
        ),
      );
    }
  }
