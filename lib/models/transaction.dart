import 'package:bytebank/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  ): assert(value > 0);

  Transaction.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() =>
      {
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
