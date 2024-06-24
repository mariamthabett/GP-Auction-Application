import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:philo_task/core/navigator/named_routes.dart';
import 'package:philo_task/core/navigator/navigator.dart';
import '../../../core/res/color_manger.dart';
import '../../../core/res/constants.dart';
import '../../../models/boardin_item_model.dart';
import '../../widgets/my_page_indicator.dart';
import '../../widgets/onboarding_button.dart';
import '../../widgets/rounded_button.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  PageController boardController = PageController();
  bool isLast = false;

  Widget _buildOnBoardItem(BoardItem boardItem, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: boardItem.image,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Expanded(
          child: Text(
            overflow: TextOverflow.visible,
            boardItem.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorManager.myBlack,
              fontFamily: 'Familiar Pro',
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05),
            child: Text(
              boardItem.subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorManager.myGrey,
                fontFamily: 'Familiar Pro',
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _goToLoginScreen() {
    Go.toNamed(NamedRoutes.home);
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'M',
            style: TextStyle(
              color: Colors.deepOrange,
              fontFamily: 'Familiar Pro',
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: '-zad',
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Familiar Pro',
              fontSize: 40,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildBoradingItem() {
    return Expanded(
      flex: 2,
      child: PageView.builder(
        onPageChanged: (index) {
          if (index == boardings.length) {
            setState(() {
              isLast = true;
              _goToLoginScreen();
            });
          }
        },
        controller: boardController,
        itemCount: boardings.length,
        itemBuilder: (context, index) =>
            _buildOnBoardItem(boardings[index], context),
      ),
    );
  }

  Widget _buildBottomText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            color: ColorManager.myBlack,
            fontWeight: FontWeight.w600,
            fontFamily: 'Lato',
            fontSize: 18,
            // fontWeight: FontWeightManager.regular,
          ),
        ),
        TextButton(
          onPressed: () {
            Go.offNamed(NamedRoutes.register);
            // Navigator.pushNamed(context, Routes.registerRoute);
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lato',
              fontSize: 18,
              // fontWeight: FontWeightManager.regular,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          _buildBoradingItem(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyPageIndicator(boardController: boardController),
                OnBoardingButton(
                  onPressed: () {
                    _goToLoginScreen();
                  },
                ),
                _buildBottomText(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.myWhite,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.myWhite,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: ColorManager.myWhite,
          elevation: 0.0,
          actions: [
            RoundedButton(
              onPressed: () {
                _goToLoginScreen();
              },
            ),
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }
}
