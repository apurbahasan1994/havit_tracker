import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_colors.dart';
import 'package:habit_tracker/ui/home/home.dart';
import 'package:habit_tracker/ui/theming/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Helvetica Neue'),
      home: AppTheme(
          data: AppThemeData.defaultWithSwatch(AppColors.red),
          child: HomePage()),
    );
  }
}
