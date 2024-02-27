import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Divider(
            endIndent: MediaQuery.of(context).size.width * .05,
            color: ColorManager.myGrey,
            //   height: 10,
            thickness: .2,
          ),
        ),
        const Text(
          'Or',
          style: TextStyle(
            color: ColorManager.myLightBlack,
            fontFamily: 'Lato',
          ),
        ),
        Expanded(
          child: Divider(
            indent: MediaQuery.of(context).size.width * .05,
            color: ColorManager.myGrey,
            //   height: 10,
            thickness: .2,
          ),
        ),
      ],
    );
  }
}
