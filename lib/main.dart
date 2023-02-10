import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:bookly/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Const.appName,
        theme: ThemeData.dark().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: MColors.kScaffoldBGColor),
        home: const SplashView(),
      ),
    );
  }
}
