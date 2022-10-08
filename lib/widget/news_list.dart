import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(index),
          child: Container(
            height: 50,
            padding: EdgeInsets.all(5.0),
            color: Colors.grey,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 300.0, 0),
              //color: Colors.white,
              child: Image.asset(
                'lib/images/politico.jpg',
                width: 10.0,
                height: 10.0,),
              ),
            ),
          );
        },
      );
    }
  }
