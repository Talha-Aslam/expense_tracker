import 'package:expense_tracker/widgets/expenses_main_screen.dart';
import 'package:flutter/material.dart';
// import "package:flutter/services.dart";

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn) {"The code of main app should be here"});
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExpensesMainScreen(),
  ));
}
