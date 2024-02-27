import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({Key? key, required this.text}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      // maxLines: 2,
      text,
      style: const TextStyle(
        color: ColorManager.myLightBlack,
        fontSize: 14,
        fontFamily: 'Familiar Pro',
      ),
    );
  }
}
