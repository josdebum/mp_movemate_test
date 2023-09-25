import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/widgets/shipment_container.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class PendingShipment extends StatefulWidget {
  const PendingShipment({Key? key, required this.status, required this.count})
      : super(key: key);
  final String status;
  final int count;

  @override
  _PendingShipmentState createState() => _PendingShipmentState();
}

class _PendingShipmentState extends State<PendingShipment>
    with TickerProviderStateMixin {
  late AnimationController _animationcontroller;
  double animationduration = 0.0;

  @override
  void initState() {
    super.initState();
    const int totalduration = 4000;
    _animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: totalduration));
    animationduration = totalduration / (100 * (totalduration / widget.count));
    _animationcontroller.forward();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // listview builder
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Shipments",
                    style: AppStyle.header.copyWith(),
                  )).addHeight(10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.count,
                itemBuilder: (BuildContext context, int index) {
                  return ShipmentContainer(
                      title: "Arrived today!",
                      subtitle:
                          "The delivery #1Z999AA10123456784 from atlanta today.",
                      amount: "\$425000 USD ",
                      status: widget.status,
                      date: "Sep 20, 2023",
                      animationcontroller: _animationcontroller,
                      index: index,
                      duration: animationduration);
                },
              )
            ]))));
  }
}
