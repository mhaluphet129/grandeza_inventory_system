// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sales _$SalesFromJson(Map<String, dynamic> json) => Sales(
      id: json['id'] as String,
      itemId: Items.fromJson(json['itemId'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesToJson(Sales instance) => <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
