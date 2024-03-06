import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';

class PhoneCountryTextField extends StatelessWidget {
  const PhoneCountryTextField({Key? key, this.controller, this.validator}) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(
            fontFamily: 'Lato',
            color: ColorManager.myLightBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFDFCFF),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: ColorManager.myGrey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(3)),
          ),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              child: TextFormField(
                controller: controller,
                validator: validator,

              )),
        ),
      ],
    );
  }
}
