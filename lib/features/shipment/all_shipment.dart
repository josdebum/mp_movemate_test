import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/widgets/shipment_container.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class AllShipment extends StatefulWidget {
  const AllShipment({Key? key}) : super(key: key);

  @override
  _AllShipmentState createState() => _AllShipmentState();
}

class _AllShipmentState extends State<AllShipment>
    with TickerProviderStateMixin {
  late AnimationController _animationcontroller;
  double animationduration = 0.0;
  int totalitems = 10;

  @override
  void initState() {
    super.initState();
    const int totalduration = 2000;
    _animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: totalduration));
    animationduration = totalduration / (100 * (totalduration / totalitems));
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
                itemCount: totalitems,
                itemBuilder: (BuildContext context, int index) {
                  return ShipmentContainer(
                      title: "Arrived today!",
                      subtitle:
                          "The delivery #1Z999AA10123456784 from atlanta today.",
                      amount: "\$425000 USD ",
                      status: index == 0
                          ? " in-progress"
                          : index == 4
                              ? "loading"
                              : "pending",
                      date: "Sep 20, 2023",
                      animationcontroller: _animationcontroller,
                      index: index,
                      duration: animationduration);
                },
              )
            ]))));
  }
}
