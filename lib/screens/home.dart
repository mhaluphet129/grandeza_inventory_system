import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/widgets/Profile.dart';

import 'package:grandeza_inventory_system/widgets/tabs.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin {
  double _rotateValue = 0;
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0,
      upperBound: 2,
    )..addListener(() {
        setState(() => _rotateValue = animationController.value);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: const Text(
          "Grandeza Cafe",
          style: TextStyle(
              fontFamily: 'GreatVibes', color: Color(0xffdbad3f), fontSize: 30),
        ),
        actions: [Profile()],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffE8BD70),
                    Color(0xffE8BD70),
                    Color(0xffEDD185)
                  ]),
            ),
            child: Tabs(tabs: const {
              "Dashboard": {
                "label": "Dashboard",
                "icon": 'assets/svg-icons/home.svg',
                "index": 0
              },
              "New Menu": {
                "label": "New Menu",
                "icon": 'assets/svg-icons/new_menu.svg',
                "index": 1
              },
              "Deliveries": {
                "label": "Deliveries",
                "icon": 'assets/svg-icons/delivery.svg',
                "index": 2
              },
              "Damages": {
                "label": "Damages",
                "icon": 'assets/svg-icons/damage.svg',
                "index": 3
              },
              "Sold for the Day": {
                "label": "Sold for the Day",
                "icon": 'assets/svg-icons/sales.svg',
                "index": 4
              },
              "Daily Inventory": {
                "label": "Daily Inventory",
                "icon": 'assets/svg-icons/inventory.svg',
                "index": 5
              },
              "Reports": {
                "label": "Reports",
                "icon": 'assets/svg-icons/reports.svg',
                "index": 6
              },
            }),
          ),
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                  child: Container()))
        ],
      ),
    );
  }
}
