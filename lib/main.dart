import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/bottom_nav_bar.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Moniepoint Test",
      theme: ThemeData(primaryColor: kPurple),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: NavigationWidget(),
    );
  }
}
