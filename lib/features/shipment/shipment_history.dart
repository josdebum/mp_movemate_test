import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';

import 'package:moniepoint_test/core/utils/widget_extension.dart';
import 'package:moniepoint_test/features/shipment/all_shipment.dart';
import 'package:moniepoint_test/features/shipment/pending_shipments.dart';
import '../../core/constants/color_constant.dart';

const double borderRadius = 25.0;

class ShipmentHistory extends StatefulWidget {
  const ShipmentHistory({super.key});

  @override
  _ShipmentHistoryState createState() {
    return _ShipmentHistoryState();
  }
}

class _ShipmentHistoryState extends State<ShipmentHistory>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPurple,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: AppStyle.body.copyWith(color: kWhite, fontSize: 18),
            automaticallyImplyLeading: true,
            leading: FadeInLeft(
                preferences: const AnimationPreferences(
                    duration: Duration(
                  seconds: 1,
                )),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.navigationWidget);
                    },
                    child: const Icon(Icons.arrow_back_ios_sharp))),
            title: FadeInRight(
              preferences: const AnimationPreferences(
                  duration: Duration(
                seconds: 1,
              )),
              child: const Text("Shipment History"),
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _menuBar(),
                  // _menuBar2(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height +200,
                    child: PageView(
                      controller: _pageController,
                     // padEnds: false,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          activePageIndex = i;
                        });
                      },
                      children: [
                        AllShipment(
                          controller: controller,
                        ),
                        PendingShipment(
                          status: "completed",
                          count: 2,
                          controller: controller,
                        ),
                        PendingShipment(
                          status: "in-progress",
                          count: 6,
                          controller: controller,
                        ),
                        PendingShipment(
                            controller: controller,
                            status: "pending",
                            count: 10),
                        PendingShipment(
                            controller: controller,
                            status: "cancelled",
                            count: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _menuBar() {
    return Container(
        width: double.infinity,
        //height: 46,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        color: kPurple,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                InkWell(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                    onTap: _onAll,
                    child: Column(children: <Widget>[
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          "All ",
                          style: AppStyle.body.copyWith(
                              color:
                                  activePageIndex == 0 ? kWhite : kPurpleLight2,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                color: activePageIndex == 0
                                    ? Colors.orange
                                    : kPurpleLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "4",
                              style: TextStyle(
                                  color: activePageIndex == 0
                                      ? kWhite
                                      : kPurpleLight2),
                            )))
                      ]).addHeight(6),
                      activePageIndex == 0
                          ? const SizedBox(
                              width: 62,
                              height: 6,
                              child:
                                  Divider(color: Colors.orange, thickness: 3))
                          : const SizedBox(
                              height: 6,
                            ).paddingRight(30),
                    ])).paddingRight(30),
                InkWell(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                    onTap: _onCompleted,
                    child: Column(children: <Widget>[
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          "Completed ",
                          style: AppStyle.body.copyWith(
                              color:
                                  activePageIndex == 1 ? kWhite : kPurpleLight2,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                color: activePageIndex == 1
                                    ? Colors.orange
                                    : kPurpleLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "2",
                              style: AppStyle.small.copyWith(
                                  color: activePageIndex == 1
                                      ? kWhite
                                      : kPurpleLight2),
                            )))
                      ]).addHeight(6),
                      activePageIndex == 1
                          ? const SizedBox(
                              width: 124,
                              height: 6,
                              child:
                                  Divider(color: Colors.orange, thickness: 3))
                          : const SizedBox(
                              height: 6,
                            ),
                    ])).paddingRight(30),
                InkWell(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                    onTap: _onInProgress,
                    child: Column(children: <Widget>[
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          "In progress ",
                          style: AppStyle.body.copyWith(
                              color:
                                  activePageIndex == 2 ? kWhite : kPurpleLight2,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                color: activePageIndex == 2
                                    ? Colors.orange
                                    : kPurpleLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "6",
                              style: AppStyle.small.copyWith(
                                  color: activePageIndex == 2
                                      ? kWhite
                                      : kPurpleLight2),
                            )))
                      ]).addHeight(6),
                      activePageIndex == 2
                          ? const SizedBox(
                              width: 124,
                              height: 6,
                              child:
                                  Divider(color: Colors.orange, thickness: 3))
                          : const SizedBox(
                              height: 6,
                            ),
                    ])).paddingRight(30),
                InkWell(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                    onTap: _onPending,
                    child: Column(children: <Widget>[
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          "Pending order",
                          style: AppStyle.body.copyWith(
                              color:
                                  activePageIndex == 3 ? kWhite : kPurpleLight2,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                color: activePageIndex == 3
                                    ? Colors.orange
                                    : kPurpleLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "10",
                              style: AppStyle.small.copyWith(
                                  color: activePageIndex == 3
                                      ? kWhite
                                      : kPurpleLight2),
                            ))),
                      ]).addHeight(6),
                      activePageIndex == 3
                          ? const SizedBox(
                              width: 142,
                              height: 6,
                              child:
                                  Divider(color: Colors.orange, thickness: 3))
                          : const SizedBox(
                              height: 6,
                            ),
                    ])).paddingRight(30),
                InkWell(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                    onTap: _onCancelled,
                    child: Column(children: <Widget>[
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        Text(
                          "Cancelled ",
                          style: AppStyle.body.copyWith(
                              color:
                                  activePageIndex == 4 ? kWhite : kPurpleLight2,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                                color: activePageIndex == 4
                                    ? Colors.orange
                                    : kPurpleLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "1",
                              style: AppStyle.small.copyWith(
                                  color: activePageIndex == 4
                                      ? kWhite
                                      : kPurpleLight2),
                            )))
                      ]).addHeight(6),
                      activePageIndex == 4
                          ? const SizedBox(
                              width: 110,
                              height: 6,
                              child:
                                  Divider(color: Colors.orange, thickness: 3))
                          : const SizedBox(
                              height: 6,
                            ),
                    ])).paddingRight(10),
              ],
            )));
  }

  void _onAll() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onCompleted() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onInProgress() {
    _pageController.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onPending() {
    _pageController.animateToPage(3,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onCancelled() {
    _pageController.animateToPage(4,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
