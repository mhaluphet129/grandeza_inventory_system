import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoader extends StatelessWidget {
  String path;
  double? width;
  LottieLoader({
    Key? key,
    required this.path,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (width ?? 1),
      child: Lottie.asset(path),
    );
  }
}
