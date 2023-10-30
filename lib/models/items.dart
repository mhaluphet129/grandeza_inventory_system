import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  Items(
      {required this.id,
      required this.name,
      required this.type,
      required this.date,
      required this.totalAvailable});

  String id;
  String name;
  String type;
  DateTime date;
  int totalAvailable;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
