import 'package:grandeza_inventory_system/models/items.dart';
import 'package:grandeza_inventory_system/models/recent_delivery.dart';
import 'package:grandeza_inventory_system/models/sales.dart';

List<Items> items = [
  Items(
      id: '001',
      name: 'Main 1',
      type: "main",
      date: DateTime.now(),
      totalAvailable: 3),
  Items(
      id: '002',
      name: 'Main 2',
      type: "main",
      date: DateTime.now(),
      totalAvailable: 7),
  Items(
      id: '003',
      name: 'Main 3',
      type: "side",
      date: DateTime.now(),
      totalAvailable: 5)
];

List<RecentDelivery> recentDelivery = [
  RecentDelivery(
      id: '001', itemId: items[0], quantity: 3, date: DateTime.now()),
  RecentDelivery(
      id: '002', itemId: items[1], quantity: 2, date: DateTime.now()),
  RecentDelivery(
      id: '003', itemId: items[2], quantity: 1, date: DateTime.now()),
  RecentDelivery(
      id: '004', itemId: items[2], quantity: 1, date: DateTime.now()),
  RecentDelivery(id: '005', itemId: items[2], quantity: 1, date: DateTime.now())
];

List<Sales> salesList = [
  Sales(
      id: "001",
      itemId: items[0],
      quantity: 99,
      amount: 2000,
      date: DateTime.now()),
  Sales(
      id: "002",
      itemId: items[0],
      quantity: 1,
      amount: 1997,
      date: DateTime.now()),
  Sales(
    id: "003",
    itemId: items[1],
    quantity: 26,
    amount: 2023,
    date: DateTime.now(),
  )
];
