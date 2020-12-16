import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart!'),
            ),
          ),
          Card(
            elevation: 50,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    onChanged: (value) {
                      titleInput = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      amountInput = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      print(amountInput);
                      print(titleInput);
                    },
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TransactionList(),
        ],
      ),
    );
  }
}
