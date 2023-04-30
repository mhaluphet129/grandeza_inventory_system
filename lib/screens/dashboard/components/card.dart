import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/utilities/constant.dart';

class CustomCard extends StatelessWidget {
  String title, content;
  IconData icon;
  CustomCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      child: Container(
        width: 330,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20,
            ),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffEDD185),
                  Color(0xffE8BD70),
                ])),
        child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 10, bottom: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff533B10)),
                          ),
                          Text(
                            content,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff533B10)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              icon,
                              size: 40,
                            )),
                      ),
                    ))
                  ],
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_upward_rounded,
                        color: SUCCESS,
                      )),
                      TextSpan(
                          text: "3.14 %", style: TextStyle(color: SUCCESS)),
                      const TextSpan(
                          text: " since last month",
                          style: TextStyle(color: Color(0xff7C7C7C))),
                    ]))
              ],
            )),
      ),
    );
  }
}
