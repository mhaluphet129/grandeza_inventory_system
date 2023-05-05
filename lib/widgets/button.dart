import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/utilities/constant.dart';

class Button extends StatelessWidget {
  String label;
  String? type;
  double? padding;
  double? paddingHorizontal;
  double? paddingVertical;
  Function? onPress;
  double? fontSize;

  Button(
      {Key? key,
      required this.label,
      this.padding,
      this.paddingHorizontal,
      this.paddingVertical,
      this.onPress,
      this.type,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
              color:
                  onPress != null ? defaultColor : defaultColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            splashColor: onPress != null ? Colors.white.withOpacity(.5) : null,
            onTap: onPress != null ? () => onPress!() : null,
            child: Padding(
              padding: padding != null
                  ? EdgeInsets.all(padding!)
                  : EdgeInsets.symmetric(
                      horizontal: paddingHorizontal ?? 0,
                      vertical: paddingVertical ?? 0),
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                    fontFamily: 'Nunito'),
              ),
            ),
          ),
        ));
  }
}
