import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  InventoryPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InventoryPage();
}

class _InventoryPage extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('Inventory');
  }
}
