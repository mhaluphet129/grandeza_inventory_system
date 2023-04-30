import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  String label;
  String? type;
  IconData? icon;
  Function? onPress;
  IconTextButton(
      {Key? key, required this.label, this.icon, this.onPress, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: type == 'danger'
            ? Colors.red.withOpacity(0.5)
            : Colors.black.withOpacity(0.5),
        onTap: () {
          onPress!();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (icon != null)
                Center(
                  child: Icon(icon,
                      color: type == 'danger' ? Colors.red : Colors.black),
                ),
              DefaultTextStyle(
                  style: TextStyle(
                      color: type == 'danger' ? Colors.red : Colors.black),
                  child: Text(label))
            ],
          )),
        ),
      ),
    );
  }
}
