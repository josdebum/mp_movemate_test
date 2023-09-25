import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/extensions.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({
    Key? key,
    required this.title,
    required this.id,
    required this.startLocation,
    required this.endLocation,
    required this.index,
    required this.animationcontroller,
    required this.duration,
  }) : super(key: key);

  final String title;
  final String id;
  final String startLocation;

  final String endLocation;
  final int index;
  final AnimationController animationcontroller;
  final double duration;

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  Animation? _animation;
  double? start;
  double? end;

  @override
  void initState() {
    super.initState();
    start = (widget.duration * widget.index).toDouble();
    end = start! + widget.duration;
    _animation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: widget.animationcontroller,
        curve: Interval(
          start!,
          end!,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Opacity(
        opacity: 1,
        child:
            // Text("2")

            ListTile(
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          minLeadingWidth: 0,
          leading: CircleAvatar(
              backgroundColor: Colors.green.shade50,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                  child: Image.asset("assets/pngs/parcel_1.jpeg"))),
          title: Text(
            widget.title,
            style: AppStyle.header.copyWith(fontSize: 17.sp),
          ).addHeight(4),
          subtitle: Row(children: <Widget>[
            Text(
              widget.id,
              style: AppStyle.small.copyWith(fontSize: 17.sp),
            ).paddingRight(2),
            const CircleAvatar(
              radius: 3,
              backgroundColor: kGrey,
            ).paddingRight(2),
            Text(
              widget.startLocation,
              style: AppStyle.small.copyWith(),
            ).paddingRight(2),
            Icon(
              Icons.arrow_forward_rounded,
              size: 16.sp,
            ).paddingRight(2),
            Text(
              widget.endLocation,
              style: AppStyle.small.copyWith(),
            )
          ]),
        ));
  }
}
