import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<DropdownMenuItem<String>> getDropDownItems() {
    // Створюємо функцію, яка повертає список типу List<DropdownMenuItem<String>>.
    // Це означає, що функція поверне список елементів, які можна використовувати
    // у випадаючому меню (DropdownButton) з рядковими значеннями.

    List<DropdownMenuItem<String>> dropdownItem = [];
    // Створюємо порожній список змінної dropdownItem,
    // який буде зберігати елементи типу DropdownMenuItem<String>.

    //for (int i = 0; i < currenciesList.length; i++) {
    for (String currenci in currenciesList) {
      // Проходимо по кожному елементу в списку currenciesList за допомогою циклу for.
      // i - індекс поточного елемента. Цикл буде виконуватися доти, доки індекс менший за довжину списку.

      //String currenci = currenciesList[i];
      // Зберігаємо поточний елемент зі списку currenciesList як змінну currenci типу String.

      var newItem = DropdownMenuItem<String>(
        // Створюємо новий елемент DropdownMenuItem з типом String.

        child: Text(currenci),
        // child - це віджет, який буде відображатись у випадаючому меню.
        // У цьому випадку це текст, що містить значення змінної currenci.

        value: currenci,
        // value - це значення, яке буде зберігатися при виборі цього елемента з випадаючого списку.
        // Тут це також рядок currenci.
      );

      dropdownItem.add(newItem);
      // Додаємо створений DropdownMenuItem у список dropdownItem.
    }

    return dropdownItem;
    // Повертаємо заповнений список dropdownItem.
    // Цей список можна використовувати як параметр items у DropdownButton.
  }

  List<Text> getPickerItems() {
    //---прокручуваний список з бібліотеки купертіно
    List<Text> pickerItems = [];
    for (String curPicker in currenciesList) {
      pickerItems.add(Text(curPicker));
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    getDropDownItems();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
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
              color: Colors.limeAccent,
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
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightGreen,
            //--------------------------------------------------------
            child: CupertinoPicker(
              backgroundColor: Colors.lightGreen,
                itemExtent: 32,
                onSelectedItemChanged: (selectedIndex) {
                  print(selectedIndex);
                },
                children: getPickerItems(),),
            //---------------------------------------------------------
            // child: DropdownButton<String>(
            //     //______DropdownButton_____випадаючий список
            //     value: selectedCurrency,
            //     items: getDropDownItems(),
            //     onChanged: (value) {
            //       setState(() {
            //         selectedCurrency = value!;
            //       });
            //       print(selectedCurrency);
            //     }),
            //--------------------------------------------------------
          ),
        ],
      ),
    );
  } //1234
}

// child: DropdownButton<String>(
// //______DropdownButton_____випадаючий список
// value: selectedCurrency,
// items: getDropDownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value!;
// });
// print(selectedCurrency);
// }),//111
