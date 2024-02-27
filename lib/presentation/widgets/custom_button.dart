import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.backgroundColor = ColorManager.myBlue, this.onTap})
      : super(key: key);
  final String text;
  final Color backgroundColor;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .06,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: ColorManager.myWhite,
              fontFamily: 'Familiar Pro',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              // fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
