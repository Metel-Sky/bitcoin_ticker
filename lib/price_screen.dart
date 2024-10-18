import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  String selectedCurrency = 'USD';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: Text(
          '🤑 Coin Ticker',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightGreen,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.blueGrey,

            //
            child: DropdownButton<String>(//______DropdownButton_____випадаючий список
              value: selectedCurrency,
                items: [
              DropdownMenuItem(
                child: Text('USD'),
                value: 'USD',
              ),
              DropdownMenuItem(
                child: Text('EUR'),
                value: 'EUR',
              ),
              DropdownMenuItem(
                child: Text('GBP'),
                value: 'GBP',
              ),

            ], onChanged: (value){
                setState(() {
                  selectedCurrency = value!;
                });

              print(selectedCurrency);
            }),
          ),
        ],
      ),
    );
  } //123
}

void currency(){
  for(String curr in cryptoList ){

  }
}
