import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/res/custom_text_styles.dart';
import 'package:philo_task/core/theming/colors.dart';
// import 'package:tenten_pay/core/res/color_manager.dart';
// import 'package:tenten_pay/core/res/custom_text_styles.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.signal_wifi_off,
              size: 120,
              color: Colors.grey[400],
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'لا يوجد اتصال بالانترنت',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                )),
            // Container(
            //     margin: const EdgeInsets.only(top: 10),
            //     child: Text(
            //       'تأكد من اتصالك بالانترنت',
            //       style: TextStyle(
            //           fontSize: 18,
            //           color: Colors.grey[400],
            //           fontWeight: FontWeight.w400),
            //     )),
            // Container(
            //     margin: const EdgeInsets.only(top: 10),
            //     child: Text(
            //       'اعد الاتصال بالانترنت',
            //       style: TextStyle(
            //           fontSize: 18,
            //           color: Colors.grey[400],
            //           fontWeight: FontWeight.w400),
            //     )),
            Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.w),
                child: Builder(
                    builder: (context) => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text('تا كد من الاتصال بالانترنت  ',
                                  style: getBoldStyle(
                                      fontSize: 20.sp,
                                      color: ColorsManager.white))),
                        )))
          ],
        )));
  }
}
