import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/screens/desktopView.dart';
import 'package:grandeza_inventory_system/utilities/responsive.dart';
import 'package:grandeza_inventory_system/widgets/Profile.dart';

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
  void dispose() {
    animationController.dispose();
    super.dispose();
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
      body: isMobile(context)
          ? Center(
              child: Container(child: const Text('Mobile View')),
            )
          : DESKTOP_VIEW(),
    );
  }
}
