import 'package:flutter/material.dart';
import 'package:internet_feature_apps/homepage.dart';
import 'package:internet_feature_apps/transaction_history.dart';
import 'package:internet_feature_apps/theme/theme_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        '/transaction_history': (context) => TransactionHistoryPage(),
      },
    );
  }
}
