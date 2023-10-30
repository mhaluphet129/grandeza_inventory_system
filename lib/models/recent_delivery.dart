import 'items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_delivery.g.dart';

@JsonSerializable()
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

  factory RecentDelivery.fromJson(Map<String, dynamic> json) =>
      _$RecentDeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$RecentDeliveryToJson(this);
}
