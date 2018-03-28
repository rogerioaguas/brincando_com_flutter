import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewCoinMarket extends StatefulWidget {
  ListViewCoinMarket({Key key, this.data}) : super(key: key);
  final data;
  @override
  createState() => new _ListViewCoinMarketState();
}

class _ListViewCoinMarketState extends State<ListViewCoinMarket> {
  
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: widget.data.length * 2,
      itemBuilder: (ctx, i) {
        if (i.isOdd) return new Divider();
        int index = i ~/ 2;
        Map coin = widget.data[index];
        return  new ListTile(
            onTap: (){print(coin['name']);},
            subtitle: new Text("\$ ${coin['price_usd']}"),
            title: new Text(coin['name']),
            trailing: new Text("${coin['price_btc']} BTC"));
      }
    );
  }
}
