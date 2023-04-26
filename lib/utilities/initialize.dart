import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/utilities/lottie_loader.dart';

class Initialize extends StatefulWidget {
  Initialize({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Initialize();
}

class _Initialize extends State<Initialize> {
  String initializeStatus = 'loading';
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        initializeStatus = 'done';
      });

      Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (initializeStatus == 'loading') {
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieLoader(
              path: 'assets/lottie/ani-plane.json',
              width: 0.4,
            ),
            const Text(
              "Grandeza Inventory System",
              style: TextStyle(
                  fontFamily: 'GreatVibes',
                  color: Color(0xffdbad3f),
                  fontSize: 50),
            ),
            LottieLoader(
              path: 'assets/lottie/loading-animator-flutter.json',
              width: 0.05,
            ),
          ],
        ),
      ));
    }
    return Container();
  }
}
