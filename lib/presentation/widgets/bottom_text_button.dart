import 'package:flutter/material.dart';
import 'package:philo_task/core/res/color_manger.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton(
      {Key? key, required this.isLogin, required this.onPressed})
      : super(key: key);
  final bool isLogin;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? 'Doesn\'t have an account?' : 'Has any acoount?',
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w700,
            fontFamily: 'Lato',
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            isLogin ? 'Register here' : 'Sign in here',
            style: const TextStyle(
              color: ColorManager.myBlue,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              fontSize: 16,
              // fontWeight: FontWeightManager.regular,
            ),
          ),
        )
      ],
    );
  }
}
