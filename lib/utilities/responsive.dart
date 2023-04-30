import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  return 600 > MediaQuery.of(context).size.width;
}

String getScreenType(double width) {
  if (width <= 600) {
    return "PHONE";
  }

  if (width <= 768 && width > 600) {
    return "TABLET"; //vertical
  }

  if (width <= 992 && width > 768) {
    return "LAPTOP";
  }

  return "LARGE";
}
