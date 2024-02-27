import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';


class Heading2 extends StatelessWidget {
  const Heading2({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Lato',
        color: ColorManager.myLightBlack,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
