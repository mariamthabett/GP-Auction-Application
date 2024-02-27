import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomImageAppBar extends StatelessWidget {
  const CustomImageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(1.0), BlendMode.dstATop),
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/appBarBackGround.png'),
          ),
        ),
      ),
    );
  }
}
