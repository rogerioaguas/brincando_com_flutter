import 'package:brincando_com_flutter/components/list_view_coin_market.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class CustomListView extends StatefulWidget {
  @override
  createState() => new CustomListViewState();
}

class CustomListViewState extends State<CustomListView> {
  final URL_API_COIN_MARKET_CAP = "api.coinmarketcap.com";
  final PATH_COIN_MARKET_CAP = "/v1/ticker/";

  Future<List> getCoinMarketList() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(URL_API_COIN_MARKET_CAP, PATH_COIN_MARKET_CAP);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    return JSON.decode(await response.transform(UTF8.decoder).join());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Coin Market",
                style: new TextStyle(color: Colors.white))),
        body: new FutureBuilder(
          future: getCoinMarketList(),
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) return new Container();
            return new ListViewCoinMarket(data: snapshot.data);
          },
        ));
  }
}
