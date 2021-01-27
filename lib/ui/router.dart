import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:topcode_interview_test/core/models/account.dart';
import 'package:topcode_interview_test/ui/views/home_view.dart';
import 'package:topcode_interview_test/ui/views/account_view.dart';

class PreferredRoute {
  static Route<dynamic> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());

      case '/account':
        var account = settings.arguments as Account;
        return MaterialPageRoute(builder: (_) => AccountView(account: account));

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child:  Text('No route defined for ${settings.name}'),),
        ));
    }
  }
}