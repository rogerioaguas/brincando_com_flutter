import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailView extends StatelessWidget {
  DetailView({Key key, this.coinName}) : super(key: key);
  final String coinName;
  final httpClient = new HttpClient();
  final URL_API_COIN_MARKET_CAP = "api.coinmarketcap.com";
  final PATH_COIN_MARKET_CAP = "/v1/ticker/";

  Future<List> getCoinDetail(coinName) async {
    var httpClient = new HttpClient();
    var uri =
        new Uri.http(URL_API_COIN_MARKET_CAP, PATH_COIN_MARKET_CAP + coinName);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    return JSON.decode(await response.transform(UTF8.decoder).join());
  }

  final _textStyle = new TextStyle(fontSize: 16.0);
  final _textStyleSection = new TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold);
  Widget customListTile({String title, String trailing}) {
    return new Container(
        padding: new EdgeInsets.only(bottom: 4.0, top: 4.0),
        child: new Row(children: <Widget>[
          new Expanded(
            child: new Text(
              title,
              style: _textStyle,
            ),
          ),
          new Text(
            trailing,
            style: _textStyle,
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(this.coinName)),
        body: new FutureBuilder(
            future: getCoinDetail(this.coinName),
            builder: (ctx, snapshot) {
              print(snapshot.hasData);
              if (!snapshot.hasData) {
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              }
              var data = snapshot.data[0];
              return new Container(
                  padding: new EdgeInsets.all(16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "#${data['rank']} - ${data['name']}",
                        style: new TextStyle(
                            fontSize: 30.0, fontStyle: FontStyle.italic),
                      ),
                      new Container(
                        padding: new EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Variação",
                          style: _textStyleSection,
                        ),
                      ),
                      customListTile(
                          title: "1 hora:",
                          trailing: "${data['percent_change_1h']}%"),
                      customListTile(
                          title: "24 horas:",
                          trailing: "${data['percent_change_24h']}%"),
                      customListTile(
                          title: "1 Semana:",
                          trailing: "${data['percent_change_7d']}%"),
                      new Container(
                          padding: new EdgeInsets.only(top: 8.0),
                          child: new Text("Informações",
                              style: _textStyleSection)),
                      customListTile(
                          title: "Volume USD - 24h",
                          trailing: "\$ ${data['24h_volume_usd']}"),
                      customListTile(
                          title: "Market Cap - USD",
                          trailing: "\$ ${data['market_cap_usd']}"),
                    ],
                  ));
            }));
  }
}
