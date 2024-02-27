
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:philo_task/core/res/assets_manager.dart';

import '../../models/boardin_item_model.dart';
import 'color_manger.dart';

List<BoardItem> boardings = [
  BoardItem(
      Lottie.asset(ImageAssets.onboardingLogo1),
      'Welcome to MarketConnect!',
      'Discover a vibrant marketplace where sellers and buyers converge to explore, engage, and trade.'),
  BoardItem(
      Lottie.asset(ImageAssets.onboardingLogo2),
      "Unlock Your Selling Potential!",
      'Empower your sales journey by connecting with eager buyers and showcasing your items to a community of interested bidders.'),
  BoardItem(
      Lottie.asset(ImageAssets.onboardingLogo3),
      'Dive into Seamless Transactions!',
      'Immerse yourself in a platform designed for effortless interactions, where sellers meet buyers and transactions unfold seamlessly.')
];

const textInButtonStyle = TextStyle(
  color: ColorManager.myWhite,
  fontFamily: 'Poppins',
  fontSize: 18,
  // fontWeight: FontWeight.w600,
  letterSpacing: 1,
);

const TextStyle questionTextStyle = TextStyle(
  color: ColorManager.myBlack,
  fontWeight: FontWeight.w600,
  fontFamily: 'Poppins',
  fontSize: 18,
  // fontWeight: FontWeightManager.regular,
);
