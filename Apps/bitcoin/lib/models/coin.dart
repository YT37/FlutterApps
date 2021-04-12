import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String sign) async {
    List<double> rates = [];

    for (String crypto in cryptoList) {
      http.Response response = await http.get(
        Uri.https("apiv2.bitcoinaverage.com",
            "convert/global?from=$crypto&to=$sign&amount=1"),
      );

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        rates.add(decodedData['price']);
      } else
        throw 'Problem with the http request';
    }
    return rates;
  }
}
