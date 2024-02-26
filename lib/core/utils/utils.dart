//show ios dialog
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:philo_task/core/navigator/navigator.dart';
import 'package:philo_task/core/res/custom_text_styles.dart';
import 'package:philo_task/core/theming/colors.dart';
import 'package:url_launcher/url_launcher.dart';



void showToast({
  required String message,
  Color? color,
  ToastGravity? gravity,
  Color? textColor,
}) {
  Fluttertoast.showToast(
    textColor: textColor,
    // webPosition: 'center',
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 3,
    gravity: gravity ?? ToastGravity.BOTTOM,
    backgroundColor: color ?? ColorsManager.red,
  );
}

//show snackbar
void showSnackBar({
  required String message,
  Color? color,
  int? duration,
}) {
  ScaffoldMessenger.of(Go.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: getRegularStyle(
          fontSize: 14.sp,
          color: Colors.white,
        ),
      ),
      backgroundColor: color ?? ColorsManager.red,
      duration: Duration(seconds: duration ?? 2),
    ),
  );
}

void launchWebUrl({required String url}) async {
  // print('----------------------------------------------------------------');
  if (!await launchUrl(Uri.parse(url))) {
    showToast(message: 'Could not launch $url');
    // launchWebUrl(url: 'https://www.google.com');
  }
}
