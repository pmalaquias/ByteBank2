import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank());
  //save(Transaction(200.00, Contact(0, 'Rafa', 2012)))
    //  .then((transaction) => print(transaction));
  //findAll().then((transactions) => print('new transations $transactions'));
  //findAll().then((contacts) => debugPrint(contacts.toString()));
}

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
