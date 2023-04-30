import 'package:grandeza_inventory_system/models/items.dart';

class Sales {
  String id;
  Items itemId;
  int quantity;
  double amount;
  DateTime date;

  Sales(
      {required this.id,
      required this.itemId,
      required this.quantity,
      required this.date,
      required this.amount});

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        id: json['_id'],
        itemId: Items.fromJson(json["itemId"]),
        quantity: int.parse(json['quantity']),
        amount: double.parse(json['amount']),
        date: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "itemId": itemId.toJson(),
        "quantity": quantity,
        "amount": amount,
        "date": date.toIso8601String(),
      };
}
