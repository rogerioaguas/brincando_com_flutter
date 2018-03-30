import 'package:brincando_com_flutter/view/list/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
  // debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Brincando Com Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new CustomListView()
    );
  }
}