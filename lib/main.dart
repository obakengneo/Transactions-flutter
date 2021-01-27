import 'package:flutter/material.dart';
import 'package:topcode_interview_test/locator.dart';
import 'package:topcode_interview_test/ui/router.dart';
import 'package:topcode_interview_test/ui/shared/colors.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TopCode",
      theme: ThemeData(),
      initialRoute: '/home',
      onGenerateRoute: PreferredRoute.generatRoute,
    );
  }

  ThemeData themeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor)),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor)),
        ),
 );
}
}

