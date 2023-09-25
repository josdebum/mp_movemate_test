import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class CalculateResultScreen extends StatefulWidget {
  const CalculateResultScreen({super.key});

  @override
  State<CalculateResultScreen> createState() => _CalculateResultScreenState();
}

class _CalculateResultScreenState extends State<CalculateResultScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: ZoomIn(
      preferences: const AnimationPreferences(
          duration: Duration(
        seconds: 3,
      )),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "MoveMate",
                        style: AppStyle.title.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800),
                      ).paddingRight(10),
                      const Icon(Icons.delivery_dining_outlined,
                          size: 38, color: Colors.orange),
                    ]),
                Padding(
                    padding: const EdgeInsets.all(40),
                    child: Image.asset("assets/pngs/parcel_9.png",
                        width: 170, height: 170)),
                Text(
                  "Total Estimated Amount",
                  style: AppStyle.header2.copyWith(fontSize: 25),
                ).addHeight(6),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("\$",
                          style: AppStyle.header3
                              .copyWith(fontSize: 25, color: Colors.green)),
                      BounceIn(
                          preferences: const AnimationPreferences(
                              duration: Duration(
                            seconds: 1,
                          )),
                          child: Countup(
                            begin: 0,
                            end: 4500,
                            duration: const Duration(seconds: 3),
                            separator: ',',
                            style: AppStyle.header3
                                .copyWith(fontSize: 25, color: Colors.green),
                          )),
                      Text(" USD",
                          style: AppStyle.header3
                              .copyWith(fontSize: 18, color: Colors.green))
                    ]).addHeight(3),
                Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Text(
                            "This amount is estimated this will vary if you change your location or weight.",
                            textAlign: TextAlign.center,
                            style: AppStyle.body.copyWith(color: kGrey)))
                    .addHeight(40),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.navigationWidget);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.orange),
                        width: double.infinity,
                        height: 60,
                        child: Center(
                            child: Text("Back to home",
                                style: AppStyle.body
                                    .copyWith(color: kWhite, fontSize: 18)))))
              ])),
    ));
  }
}
