import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: ColorManager.myOffWhite,
          shape: const RoundedRectangleBorder(
            // side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'Skip',
          style: TextStyle(
            color: ColorManager.myBlack,
          ),
        ),
      ),
    );
  }
}
