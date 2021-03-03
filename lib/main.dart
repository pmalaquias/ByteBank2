import 'package:bytebank/components/theme.dart';
import 'package:bytebank/screens/counter.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Bytebank());
  //print(Uuid().v4());
  //save(Transaction(200.00, Contact(0, 'Rafa', 2012)))
  //  .then((transaction) => print(transaction));
  //findAll().then((transactions) => print('new transations $transactions'));
  //findAll().then((contacts) => debugPrint(contacts.toString()));
}

class LogObserver extends BlocObserver{

  @override
  void onChange(Cubit cubit, Change change) {
    print("${cubit.runtimeType} > $change");
    super.onChange(cubit, change);
  }
}

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // na pretica evitar log do genbeero, pois pode vazar informações sensiveis para log
    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: bytebankTheme,
      home: DashboardContainer(),
    );
  }
}
