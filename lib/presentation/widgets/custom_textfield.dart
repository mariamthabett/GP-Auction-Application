import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/theming/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onChanged, this.controller});
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return _buildSearchTextfield(context);
  }

  _buildSearchTextfield(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          color: ColorsManager.grey, borderRadius: BorderRadius.circular(16.r)),
      child: TextFormField(
controller: controller,
        onChanged: onChanged,


        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
