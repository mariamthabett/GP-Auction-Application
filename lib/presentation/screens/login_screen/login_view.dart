import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/navigator/named_routes.dart';
import 'package:philo_task/core/navigator/navigator.dart';

import '../../../core/res/color_manger.dart';
import '../../widgets/bottom_text_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_heading1.dart';
import '../../widgets/heading2.dart';
import '../../widgets/phone_number_and_country_textfield.dart';
import '../../widgets/policy_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  _buildBody(context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, bottom: 32.0, top: 16.0),

      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading2(text: 'Welcome to Fashion Daily'),
        const CustomHeading1(text: 'Sign in'),
        16.verticalSpace,
        const PhoneCountryTextField(),
        16.verticalSpace,
        CustomButton(
          text: 'Sign in',
          onTap: () {
            Go.offNamed(NamedRoutes.home);
          },
        ),
        8.verticalSpace,
        // const CustomDivider(),
        // 8.verticalSpace,
        // const GoogleButton(),
        16.verticalSpace,
        BottomTextButton(
          isLogin: true,
          onPressed: () {
            Go.offNamed(NamedRoutes.register);
            // Navigator.pushNamed(context, Routes.registerRoute);
          },
        ),
        const PolicyText(
          text:
              'Use the application according to policy rules. Any kind of violation will be subject to sanctions',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.myWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: CustomImageAppBar(),
      ),
      body: _buildBody(context),
    );
  }
}
