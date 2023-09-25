import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Hero(
                tag: "navigate",
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                    child: Column(children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Profile",
                            style: AppStyle.header3.copyWith(),
                          )).addHeight(10),
                    ])))));
  }
}
