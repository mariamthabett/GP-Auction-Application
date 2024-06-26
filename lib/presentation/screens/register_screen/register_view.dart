import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/helpers/firebase_firestore_helper.dart';
import 'package:philo_task/core/navigator/named_routes.dart';
import 'package:philo_task/core/navigator/navigator.dart';
import 'package:philo_task/core/res/color_manger.dart';
import 'package:philo_task/models/user_model.dart';
import 'package:philo_task/providers/chat_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottom_text_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_heading1.dart';
import '../../widgets/custom_textfield_personal.dart';
import '../../widgets/google_button.dart';
import '../../widgets/heading2.dart';
import '../../widgets/phone_number_and_country_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  //username
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //phone
  TextEditingController phoneController = TextEditingController();
  //formkey
  final _formKey = GlobalKey<FormState>();

  _buildBody(context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 32.0, top: 16.0),

        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading2(text: 'Welcome to Mzad'),
          const CustomHeading1(text: 'Register'),
          8.verticalSpace,
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
            hintText: 'Eg . example@email.com',
            widget: Text(
              'Email',
              style: TextStyle(
                  color: ColorManager.myLightBlack, fontFamily: 'Familiar Pro'),
            ),
          ),
          16.verticalSpace,
          PersonalTextField(
            controller: usernameController,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Username is required';
              }
              return null;
            },
            hintText: 'user name',
            widget: Text(
              'Username',
              style: TextStyle(
                  color: ColorManager.myLightBlack, fontFamily: 'Familiar Pro'),
            ),
          ),
          16.verticalSpace,
          PhoneCountryTextField(
            controller: phoneController,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Phone number is required';
              }
              if (p0.length < 10) {
                return 'Invalid phone number';
              }
              return null;
            },
          ),
          16.verticalSpace,
          PersonalTextField(
            controller: passwordController,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Password is required';
              }
              if (p0.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            hintText: 'Password',
            widget: Text(
              'Password',
              style: TextStyle(
                color: ColorManager.myLightBlack,
                fontFamily: 'Familiar Pro',
              ),
            ),
            obscureText: true,
          ),
          16.verticalSpace,
          PersonalTextField(
            controller: confirmPasswordController,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Password is required';
              }
              if (p0.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            hintText: 'Confirm Password',
            widget: Text(
              'Confirm Password',
              style: TextStyle(
                color: ColorManager.myLightBlack,
                fontFamily: 'Familiar Pro',
              ),
            ),
            obscureText: true,
            suffixIcon: Icon(
              Icons.visibility,
              color: ColorManager.myBlack,
            ),
          ),
          16.verticalSpace,
          CustomButton(
              text: 'Register',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  DatabaseHelper.createUser(
                    UserModel(
                      id: '1',
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                      name: usernameController.text,
                    ),
                  );
                  // Provider.of<ChatProvider>(context, listen: false).userModel =
                  //     UserModel(
                  //   id: '1',
                  //   email: emailController.text,
                  //   password: passwordController.text,
                  //   confirmPassword: confirmPasswordController.text,
                  //   name: usernameController.text,
                  // );
                }
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          BottomTextButton(
            isLogin: false,
            onPressed: () {
              Go.offNamed(NamedRoutes.login);
              // Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'By regestering your account, you are agree to our ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.myLightBlack,
                  fontSize: 13,
                  fontFamily: 'Familiar Pro',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Center(
                    child: Text(
                  'terms and condition',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                  ),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.myWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomImageAppBar(),
      ),
      body: _buildBody(context),
    );
  }
}
