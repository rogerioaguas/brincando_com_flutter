import 'package:brincando_com_flutter/view/list/custom_list_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Brincando Com Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new Scaffold(appBar: new AppBar(title: new Text("Coin Market")),body: new CustomListView()) 
    );
  }
}