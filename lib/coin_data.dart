import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
//TODO: Add your imports here.

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

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async{

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);

    } else {
      print(response.statusCode);
    }

  }

}

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'C52B1C86-9A1C-4474-A262-85FB86069B6C';

class CoinData {
  //TODO: Create your getCoinData() method here.
 Future<dynamic> getCoinData() async{
   String url;
   url = '$coinAPIURL/BTC/USD/?apikey=$apiKey';

   NetworkHelper networkHelper = NetworkHelper(url);

   var coinData = await networkHelper.getData();

   return coinData;
 }
}
