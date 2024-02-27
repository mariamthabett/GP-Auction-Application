import 'package:flutter/material.dart';

import '../../core/res/color_manger.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.myWhite,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: ColorManager.myBlue,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .053,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
                child:
                    Image.asset('assets/images/google.png', fit: BoxFit.cover),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .01,
              ),
              const Text('Sign with by google ',
                  style: TextStyle(
                    color: ColorManager.myBlue,
                    fontFamily: 'Familiar Pro',
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
