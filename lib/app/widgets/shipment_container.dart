import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/extensions.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class ShipmentContainer extends StatefulWidget {
  const ShipmentContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.status,
      required this.amount,
      required this.index,
      required this.animationcontroller,
      required this.duration,
      required this.date})
      : super(key: key);

  final String title;
  final String subtitle;
  final String status;
  final String amount;
  final String date;
  final int index;
  final AnimationController animationcontroller;
  final double duration;

  @override
  State<ShipmentContainer> createState() => _ShipmentContainerState();
}

class _ShipmentContainerState extends State<ShipmentContainer> {
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
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationcontroller,
        curve: Interval(
          start!,
          end!,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Opacity(
        opacity: _animation!.value,
        child: Card(
            elevation: 0,
            child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.fromLTRB(20, 14, 0, 14),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.blue.withOpacity(0.05)),
                                child: Center(
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                      Icon(
                                        widget.status == "pending"
                                            ? Icons.history_outlined
                                            : widget.status == "loading"
                                                ? Icons.downloading_outlined
                                                : Icons.rotate_left_outlined,
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      Text(
                                        widget.status,
                                        style: AppStyle.small.copyWith(
                                            color: widget.status == "pending"
                                                ? Colors.orange
                                                : kGrey),
                                      )
                                    ]))).addHeight(4),
                            Text(
                              widget.title,
                              style: AppStyle.header.copyWith(fontSize: 17),
                            ).addHeight(4),
                            SizedBox(width: 230.w, child: Text(widget.subtitle))
                                .addHeight(20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(widget.amount,
                                      style: AppStyle.body.copyWith(
                                          fontSize: 14,
                                          color: kPurple,
                                          fontWeight: FontWeight.w600)),
                                  const CircleAvatar(
                                          radius: 2, backgroundColor: kGrey)
                                      .paddingRight(4),
                                  Text(widget.date, style: AppStyle.small),
                                ])
                          ]),
                      SizedBox(
                          width: 90.w,
                          height: 70.h,
                          child: Image.asset("assets/pngs/parcel_1.jpeg")),
                      // Padding(
                      //     padding: EdgeInsets.all(40),
                      //     child:Image.asset("assets/pngs/parcel_1.jpeg") )
                    ]))));
  }
}
