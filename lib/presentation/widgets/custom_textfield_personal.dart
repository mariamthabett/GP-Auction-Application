import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/color_manger.dart';

class PersonalTextField extends StatelessWidget {
  const PersonalTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    required this.widget,
    this.width = 0.92,
    this.height = 0.06,
    this.borderColore = ColorManager.myLightTeal,
    this.suffixIcon, this.validator,
    this.isPassword = false,
  }) : super(key: key);
  final double height;
  final double width;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Widget widget;
  final Color borderColore;
  final String? Function(String?)? validator;
  final bool isPassword ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget,
        8.verticalSpace,
        // SizedBox(height: MediaQuery.of(context).size.height * .01),
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
          child: TextFormField(
            validator: validator,
            textAlign: TextAlign.left,
            controller: controller,
            obscureText:isPassword ,
            decoration: InputDecoration(
              // contentPadding: const EdgeInsets.only(left: 15, top: 17),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: ColorManager.myGrey,
                fontFamily: 'Lato',
                fontSize: 16,
              ),
              alignLabelWithHint: false,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
