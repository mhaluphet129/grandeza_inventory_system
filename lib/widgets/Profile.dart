import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:grandeza_inventory_system/widgets/IconTextButton.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> with TickerProviderStateMixin {
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
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Colors.grey[100],
              child: Image(
                width: 35,
                height: 35,
                fit: BoxFit.cover,
                image: const NetworkImage('https://picsum.photos/400'),
                errorBuilder: ((context, error, stackTrace) => Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)),
                    )),
              ),
            )),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "User Admin",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
        Transform.rotate(
          angle: (math.pi / 4) * _rotateValue,
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: PopupMenuButton(
                onOpened: () => animationController.forward(),
                onCanceled: () => animationController.reverse(),
                offset: const Offset(0, 50),
                icon: const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("My Account"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Logout"),
                    ),
                  ];
                },
                onSelected: (value) {
                  animationController.reverse();
                  switch (value) {
                    case 1:
                      {
                        showGeneralDialog(
                            context: context,
                            barrierLabel: "Barrier",
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.35),
                            transitionDuration:
                                const Duration(milliseconds: 100),
                            pageBuilder: (_, __, ___) {
                              return Center(
                                  child: Container(
                                      height: 150,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const DefaultTextStyle(
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                ),
                                                child: Text(
                                                  'Logout Confirmation',
                                                )),
                                            SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  IconTextButton(
                                                    label: "LOGOUT",
                                                    type: "danger",
                                                    icon: Icons.logout_rounded,
                                                    onPress: () {
                                                      Navigator.pushNamed(
                                                          context, '/auth');
                                                    },
                                                  ),
                                                  IconTextButton(
                                                    label: "CANCEL",
                                                    onPress: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )));
                            });
                        break;
                      }

                    default:
                      return;
                  }
                }),
          ),
        )
      ]),
    );
  }
}
