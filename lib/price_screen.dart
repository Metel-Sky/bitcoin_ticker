import 'package:bitcoin_ticker/services/coinApi.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'BTC';

  final getCoinPrice _getCoinPrice =
      getCoinPrice(); // Ваш клас для отримання ціни

  @override
  void initState() {
    super.initState();
    updatePrice(); // Отримати початкову ціну при ініціалізації
  }

  Future<void> updatePrice() async {
    var priceData = await _getCoinPrice.getPrice(
        'BTC', selectedCurrency); // Виклик методу для отримання ціни
    setState(() {
      actualPrice = priceData['rate']; // Оновити actualPrice з отриманих даних
    });
  }

  DropdownButton<String> androidPicker() {
    //-------випадаючий список для ANDROID
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currenci in currenciesList) {
      var newItem = DropdownMenuItem<String>(
        child: Text(
          currenci,
          style: TextStyle(fontSize: 14),
        ),
        value: currenci,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
        print(selectedCurrency);
        updatePrice(); // Оновити ціну при зміні валюти
        // getCoinPrice().getPrice(btc, selectedCurrency);
      },
    );
  }

  CupertinoPicker IOSPicker() {
    List<Text> pickerItems = [];
    for (String curPicker in currenciesList) {
      pickerItems.add(Text(curPicker));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightGreen,
      itemExtent: 30,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency =
              currenciesList[selectedIndex]; // Оновити selectedCurrency
        });
        updatePrice(); // Оновити ціну при зміні валюти
      },
      children: pickerItems,
    );
  }

  // Widget getPicker(){
  //   if (Platform.isIOS){
  //     return IOSPicker();
  //   }
  //   else if (Platform.isAndroid){
  //     return androidPicker();
  //   }
  //   else return IOSPicker();
  // }

  String btc = 'BTC';
  String eth = 'ETH';
  String bnb = 'BNB';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Coin Ticker',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: InkWell(
              onTap: () {
                //updatePrice();
                getCoinPrice().getPrice(btc, selectedCurrency);
              },
              child: Card(
                color: Colors.grey[300],
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BTC = ${actualPriceBTC.toStringAsFixed(2)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: InkWell(
              onTap: () {
                //updatePrice();
                getCoinPrice().getPrice(eth, selectedCurrency);
              },
              child: Card(
                color: Colors.grey[300],
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 ETH = ${actualPriceETH.toStringAsFixed(2)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: InkWell(
              onTap: () {
                //updatePrice();
                getCoinPrice().getPrice(bnb, selectedCurrency);
              },
              child: Card(
                color: Colors.grey[300],
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BNB = ${actualPriceBNB.toStringAsFixed(2)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightGreen,
            child: Platform.isAndroid
                ? IOSPicker()
                : androidPicker(), //варіант замість іфа, перевіряє одне з двох
          ),
        ],
      ),
    );
  }
}
