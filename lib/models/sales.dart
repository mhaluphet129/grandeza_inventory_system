import 'items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sales.g.dart';

@JsonSerializable()
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

  factory Sales.fromJson(Map<String, dynamic> json) => _$SalesFromJson(json);

  Map<String, dynamic> toJson() => _$SalesToJson(this);
}
