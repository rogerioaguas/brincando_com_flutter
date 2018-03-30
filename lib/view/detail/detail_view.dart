import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailView extends StatelessWidget {
  DetailView({Key key, this.coin_name}) : super(key: key);
  final String coin_name;

  Column columnConstructor(
          {List<Widget> widgets,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center}) =>
      new Column(children: widgets, crossAxisAlignment: crossAxisAlignment);
  Row rowConstructor({List<Widget> widgets}) => new Row(children: widgets);
  Container containerConstructor(
          {Widget child, EdgeInsets padding = const EdgeInsets.all(0.0)}) =>
      new Container(child: child, padding: padding);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(this.coin_name),
        ),
        body: containerConstructor(
            padding: const EdgeInsets.all(32.0),
            child: columnConstructor(widgets: [
              rowConstructor(widgets: [
                new Expanded(
                  child: columnConstructor(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      widgets: [
                        containerConstructor(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            'Oeschinen Lake Campground',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        new Text(
                          'Kandersteg, Switzerland',
                          style: new TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ]),
                ),
                new Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                new Text('41'),
              ])
            ])));
  }
  //   new Container(
  // padding: const EdgeInsets.all(32.0),
  // child: new Column(children: <Widget>[ new Row(
  //   children: [
  //     new Expanded(
  //       child: new Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           new Container(
  //             padding: const EdgeInsets.only(bottom: 8.0),
  //             child: new Text(
  //               'Oeschinen Lake Campground',
  //               style: new TextStyle(
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           new Text(
  //             'Kandersteg, Switzerland',
  //             style: new TextStyle(
  //               color: Colors.grey[500],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     new Icon(
  //       Icons.star,
  //       color: Colors.red[500],
  //     ),
  //     new Text('41'),
  //   ],
  // ),
  // ])
  //   )
  //   );
  // }
}
