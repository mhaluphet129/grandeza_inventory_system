// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentDelivery _$RecentDeliveryFromJson(Map<String, dynamic> json) =>
    RecentDelivery(
      id: json['id'] as String,
      itemId: Items.fromJson(json['itemId'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$RecentDeliveryToJson(RecentDelivery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'date': instance.date.toIso8601String(),
    };
