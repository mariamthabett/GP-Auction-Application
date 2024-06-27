import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/res/custom_text_styles.dart';
import 'package:philo_task/core/theming/colors.dart';

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  _buildAppBar(BuildContext context) {
    return Container(
      decoration: _setDecoration(),
      child: Padding(
        padding: EdgeInsets.only(right: 30.sp, top: 16.sp, left: 30.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTitle()],
        ),
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Text(
        title,
        style: getBoldStyle(fontSize: 24.sp),
        textAlign: TextAlign.start,
      ),
    );
  }

  _setDecoration() {
    return BoxDecoration(
      color: ColorsManager.white,
      border: Border(
        bottom: BorderSide(
          color: ColorsManager.black.withOpacity(0.1),
          width: 1,
        ),
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32.r),
        bottomRight: Radius.circular(32.r),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.sp);
}
