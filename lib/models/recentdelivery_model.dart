import 'package:grandeza_inventory_system/models/items.dart';

class RecentDelivery {
  RecentDelivery(
      {required this.id,
      required this.itemId,
      required this.quantity,
      required this.date});

  String id;
  Items itemId;
  int quantity;
  DateTime date;

  factory RecentDelivery.fromJson(Map<String, dynamic> json) => RecentDelivery(
      id: json['_id'],
      itemId: Items.fromJson(json["itemId"]),
      quantity: int.parse(json['quantity']),
      date: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toJson() => {
        "id": id,
        "itemId": itemId.toJson(),
        "quantity": quantity,
        "date": date.toIso8601String()
      };
}
