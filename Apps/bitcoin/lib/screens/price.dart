import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/coin.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData priceData = CoinData();

  String sign = "AUD";
  List<double> rates = [0, 0, 0];

  void getData() async {
    try {
      var data = await CoinData().getCoinData(sign);
      setState(() => rates = data);
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  CupertinoPicker picker() {
    List<Widget> pi = [];

    for (String sign in currenciesList) {
      pi.add(Text(sign));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (item) {
        sign = currenciesList[item];
        getData();
      },
      children: pi,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('🤑 Bitcoin Tracker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                  child: Text(
                    '1 BTC = ${rates[0]} $sign',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                  child: Text(
                    '1 ETH = ${rates[1]} $sign',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                  child: Text(
                    '1 LTC = ${rates[2]} $sign',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30),
              color: Colors.lightBlue,
              child: picker(),
            ),
          ],
        ),
      ),
    );
  }
}
