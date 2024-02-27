import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';

class CustomHeading1 extends StatelessWidget {
  const CustomHeading1({Key? key, required this.text}) : super(key: key);

  final String text;
  _buildTextOfTitle() {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Meta Serif Pro',
        // color: Colors.black54,
        // fontStyle: FontStyle.normal,
        fontSize: 34,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  _buildHelpIcon(context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Help',
          style: TextStyle(
            color: ColorManager.myBlue,
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .02,
        ),
        CircleAvatar(
          radius: 10,
          child: IconButton(
            color: ColorManager.myWhite,
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.question_mark,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextOfTitle(),
        _buildHelpIcon(context),
      ],
    );
  }
}
