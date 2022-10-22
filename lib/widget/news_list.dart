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
            child: Row(
              children: <Widget>[Container(
                //margin: EdgeInsets.all(3.0),
                //color: Colors.white,
                child: Image.asset(
                  'lib/images/politico.jpg',
                  width: 80.0,
                  height: 150.0,
                ),
              ),Container(
                //margin: EdgeInsets.fromLTRB(5.0,0,0,0),
                //color: Colors.white,
                child: Expanded( child: Text("Lorem ipsumfdfjjjjjjjjjfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ffffffffffffffff", style: TextStyle(height: 2, fontSize: 8)),)
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
