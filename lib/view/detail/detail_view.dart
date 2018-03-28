import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailView extends StatelessWidget {
  DetailView({Key key, this.coin_name}) : super(key: key);
  final String coin_name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.coin_name),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('Go back!'),
        ),
      ),
    );
  }
}