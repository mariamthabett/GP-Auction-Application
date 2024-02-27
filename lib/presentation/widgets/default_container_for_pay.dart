import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';


class DefaultContainerForPay extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final Color borderColor;

  const DefaultContainerForPay({
    Key? key,
    this.child,
    this.width = 0.9,
    this.height = .05,
    this.borderColor = ColorManager.myTeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //  margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .02,
      ),
      width: size.width * width,
      height: size.height * height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: ColorManager.myGrey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        color: const Color(0xFFFDFCFF),
      ),
      child: child,
    );
  }
}
