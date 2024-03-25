import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/theme/theme.dart';
import 'package:multi_vendor_app/views/main_screen.dart';

void main() {
  runApp(const MyApp());
}

Widget defaultHome = MainScreen();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Multi Vendor App',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: defaultHome,
        );
      },
    );
  }
}
