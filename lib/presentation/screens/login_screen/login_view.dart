import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/helpers/firebase_firestore_helper.dart';
import 'package:philo_task/core/navigator/named_routes.dart';
import 'package:philo_task/core/navigator/navigator.dart';
import 'package:philo_task/presentation/widgets/custom_textfield_personal.dart';

import '../../../core/res/color_manger.dart';
import '../../../models/user_model.dart';
import '../../widgets/bottom_text_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_heading1.dart';
import '../../widgets/heading2.dart';
import '../../widgets/policy_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //formkey
  final _formKey = GlobalKey<FormState>();
  _buildBody(context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 32.0, top: 16.0),

        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading2(text: 'Welcome to MZAD'),
          const CustomHeading1(text: 'Sign in'),
          16.verticalSpace,
          // const PhoneCountryTextField(),
          PersonalTextField(
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Email is required';
              }
              if (!p0.contains('@')) {
                return 'Invalid email';
              }
              return null;
            },
            controller: emailController,
            hintText: 'email',
            widget: Text(
              'email',
              style: TextStyle(
                color: ColorManager.myLightBlack,
                fontFamily: 'Familiar Pro',
              ),
            ),
          ),
          16.verticalSpace,
          PersonalTextField(
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Password is required';
              }
              if (p0.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            controller: passwordController,
            hintText: 'Password',
            widget: Text(
              'Password',
              style: TextStyle(
                color: ColorManager.myLightBlack,
                fontFamily: 'Familiar Pro',
              ),
            ),
          ),
          16.verticalSpace,
          CustomButton(
            text: 'Sign in',
            onTap: () async {
              // Go.offNamed(NamedRoues.home);
              if (_formKey.currentState!.validate()) {
                List<UserModel> users = await DatabaseHelper.getUsers();
                List<String?> emails = users.map((e) => e.email).toList();
                List<String?> passwords = users.map((e) => e.password).toList();
                if (emails.contains(emailController.text) &&
                    passwords.contains(passwordController.text)) {
                  Go.offNamed(NamedRoutes.navigationBar);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid email or password'),
                    ),
                  );
                }
              }
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
      ),
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
