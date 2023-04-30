import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/screens/damages/Damages.dart';
import 'package:grandeza_inventory_system/screens/dashboard/Dashboard.dart';
import 'package:grandeza_inventory_system/screens/deliveries/Deliveries.dart';
import 'package:grandeza_inventory_system/screens/inventories/Inventory.dart';
import 'package:grandeza_inventory_system/screens/newmenu/NewMenu.dart';
import 'package:grandeza_inventory_system/screens/reports/Reports.dart';
import 'package:grandeza_inventory_system/screens/sold/Sold.dart';
import 'package:grandeza_inventory_system/utilities/constant.dart';
import 'package:grandeza_inventory_system/widgets/tabs.dart';

class DESKTOP_VIEW extends StatelessWidget {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
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
          child: Tabs(
              selectedIndex: 0,
              onChanged: (dynamic e) {
                page.jumpToPage(e);
              },
              tabs: mainMenus),
        ),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: page,
                  children: [
                    DashboardPage(),
                    NewMenuPage(),
                    DeliveriesPage(),
                    DamagesPage(),
                    SoldPage(),
                    InventoryPage(),
                    ReportPage()
                  ],
                )))
      ],
    );
  }
}
