import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/res/custom_text_styles.dart';
import 'package:philo_task/core/theming/colors.dart';
import 'package:philo_task/presentation/widgets/custom_textfield.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final Function(String)? onChanged;

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
          children: [
            _buildTitle(),
            16.verticalSpace,
            CustomTextField(
              controller: controller,
              onChanged: onChanged,
              
            ),
          ],
        ),
      ),
      // actions: _buildActions(),
      // leading: _buildLeading(),
    );
  }

  _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Home',
          style: getBoldStyle(fontSize: 24.sp),
        ),
        //clear the cache
        // TextButton(
        //   onPressed: () {
        //     getIt<PostsManager>().removeAllPosts();
        //   },
        //   child: Text('Clear Cache'),
        // )
      ],
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
  Size get preferredSize => Size.fromHeight(120.sp);
}
