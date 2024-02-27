import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/theming/colors.dart';

ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: ColorsManager.backgroundColor,
    useMaterial3: true,
    primaryColor: ColorsManager.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.white,
      iconTheme: IconThemeData(color: ColorsManager.primary),
    ),
    // App bar background color),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorsManager.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r))),
          foregroundColor:
              MaterialStateProperty.all<Color>(ColorsManager.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorsManager.primary)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.r),
        borderSide: BorderSide(
          color: ColorsManager.greyLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.r),
        borderSide: BorderSide(
          color: ColorsManager.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.r),
        borderSide: BorderSide(
          color: ColorsManager.greyLight,
        ),
      ),
    ));
      // inputDecorationTheme: InputDecorationTheme(
          // isDense: true,
      //     contentPadding: EdgeInsets.symmetric(
      //         vertical: AppPadding.pH16, horizontal: AppPadding.pH16),
      //     enabledBorder: OutlineInputBorder(
      //         borderSide: BorderSide.none,
      //         borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
      //     focusedBorder: OutlineInputBorder(
      //         borderSide: BorderSide.none,
      //         borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
      //     disabledBorder: OutlineInputBorder(
      //         borderSide: BorderSide.none,
      //         borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
      //     errorBorder: OutlineInputBorder(
      //         borderSide: BorderSide.none,
      //         borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
      //     focusedErrorBorder: OutlineInputBorder(
      //         borderSide: BorderSide.none,
              // borderRadius: BorderRadius.circular(AppBorderRadius.r16))),

      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: ColorsManager.grey2,
      //   selectedItemColor: ColorsManager.black,

      //   unselectedItemColor:
      //       ColorsManager.grey500, // Navigation bar background color
      // ),
      
    

// ThemeData get darkThemeColor => ThemeData.dark(useMaterial3: true).copyWith(
//       scaffoldBackgroundColor: ColorsManager.blackBackground,
//       hintColor: ColorsManager.textGrey,
//       appBarTheme:
//           const AppBarTheme(backgroundColor: ColorsManager.blackBackground),
//       // App bar background color),
//       textTheme: const TextTheme(
//         labelLarge: TextStyle(color: ColorsManager.white),
//         labelMedium: TextStyle(color: ColorsManager.white),
//         labelSmall: TextStyle(color: ColorsManager.white),
//         bodyLarge: TextStyle(color: ColorsManager.white),
//         bodyMedium: TextStyle(color: ColorsManager.white),
//         bodySmall: TextStyle(color: ColorsManager.white),
//         displayLarge: TextStyle(color: ColorsManager.white),
//         displayMedium: TextStyle(color: ColorsManager.white),
//         displaySmall: TextStyle(color: ColorsManager.white),
//         headlineLarge: TextStyle(color: ColorsManager.white),
//         headlineMedium: TextStyle(color: ColorsManager.white),
//         headlineSmall: TextStyle(color: ColorsManager.white),
//         titleLarge: TextStyle(color: ColorsManager.white),
//         titleMedium: TextStyle(color: ColorsManager.white),
//         titleSmall: TextStyle(color: ColorsManager.white),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: const Color(0xff353535),
//           isDense: true,
//           contentPadding: EdgeInsets.only(
//               top: AppPadding.pH16,
//               bottom: AppPadding.pH16,
//               left: AppPadding.pH16,
//               right: AppPadding.pH16),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
//           disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
//           errorBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(AppBorderRadius.r16)),
//           focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(AppBorderRadius.r16))),
//       iconTheme: const IconThemeData(color: ColorsManager.white),
//       // Icon color
//       bottomSheetTheme: const BottomSheetThemeData(
//         backgroundColor: ColorsManager.buttonColorDark,
//         modalBackgroundColor: ColorsManager.buttonColorDark,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         elevation: 0,
//       ),
//       // //bottom navigation bar
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         elevation: 0,
//         backgroundColor: ColorsManager.buttonColorDark,
//         selectedItemColor: ColorsManager.grey500,
//         unselectedItemColor: ColorsManager.white,
//       ),
//       switchTheme: SwitchThemeData(
//         thumbColor: MaterialStateProperty.resolveWith((Set states) {
//           if (states.contains(MaterialState.selected)) {
//             return ColorsManager.primary;
//           }
//           return ColorsManager.grey3;
//         }),
//       ),
//       // elevatedButtonTheme: ElevatedButtonThemeData(
//       //   style: ButtonStyle(
//       //       foregroundColor:
//       //           MaterialStateProperty.all<Color>(ColorsManager.white),
//       //       backgroundColor:
//       //           MaterialStateProperty.all<Color>(ColorsManager.primary)),
//       // ),
//     );
