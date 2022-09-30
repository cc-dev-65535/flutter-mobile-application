import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    ListView newsContent = ListView.builder(
        shrinkWrap: true,
        itemCount: 50,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(index),
            child: Container(
              height: 50,
              padding: EdgeInsets.all(5.0),
              color: Colors.red,
              child: Container( margin: EdgeInsets.fromLTRB(0, 0, 300.0, 0),
                                color: Colors.blue,
                                child: Image.asset(
                                        'lib/images/politico.jpg',
                                        width: 10.0,
                                        height: 10.0,),
                    ),
            ),
          );
        },
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ Text(widget.title) ],
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
                    child: newsContent,
                  ),
                ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
