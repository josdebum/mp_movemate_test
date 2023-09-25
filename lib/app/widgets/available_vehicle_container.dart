import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/extensions.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';

class AvailableVehicleContainer extends StatefulWidget {
  const AvailableVehicleContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;

  @override
  State<AvailableVehicleContainer> createState() =>
      _AvailableVehicleContainerState();
}

class _AvailableVehicleContainerState extends State<AvailableVehicleContainer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(children: <Widget>[
      Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
              height: 230.h,
              width: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SizedBox(
                height: 100.h,
                width: double.infinity,
              ))),
      Positioned(
        right: 2,
        bottom: 6,
        child: FadeInRight(
          preferences: const AnimationPreferences(
              duration: Duration(
            milliseconds: 1000,
          )),
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-20 / 360),
            child: Hero(
              tag: "",
              child: Image(
                width: 100.w,
                height: 100.h,
                image: AssetImage(widget.image),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          top: 15,
          left: 20,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: AppStyle.header
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(widget.subtitle,
                    style: AppStyle.small.copyWith(color: kGrey))
              ]))
    ]);
  }
}
