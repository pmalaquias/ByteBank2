import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    //print(response.body);
    //List<Transaction> transactions = _toTransactions(response);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    //print('decoded Json: $decodedJson');
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);

    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson,
    );

    return Transaction.fromJson(jsonDecode(response.body));
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions =
        decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    // final List<Transaction> transactions = List();
    // for (Map<String, dynamic> transactionJson in decodedJson) {
    //   transactions.add(Transaction.fromJson(transactionJson));
    // }
    return transactions;
  } //Esta função foi retirada do codigo, está aqui a fins didaticos

  Transaction _toTansaction(Response response) {
    return Transaction.fromJson(jsonDecode(response.body));
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber
      }
    };
    return transactionMap;
  }
} //esta função foi retirada do projeto, ela está aqui a fins didaticos
