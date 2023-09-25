import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:moniepoint_test/app/widgets/available_vehicle_container.dart';
import 'package:moniepoint_test/app/widgets/custom_search_field.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/extensions.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';
import 'package:moniepoint_test/features/home/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
// TODO: implement initState
    super.initState();

// focusNode = FocusNode();

// focusNode?.requestFocus()
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => () => focusNode.requestFocus());
    focusNode.requestFocus();
    SizeConfig.init(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      FadeInDown(
          preferences: const AnimationPreferences(
              duration: Duration(
            milliseconds: 900,
          )),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              color: kPurple,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(36),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/pngs/profile.png"),
                                              fit: BoxFit.cover)),
                                    ).paddingRight(16),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                const Icon(Icons.place,
                                                        size: 12, color: kWhite)
                                                    .paddingRight(2),
                                                Text(
                                                  "Your location",
                                                  style: AppStyle.small
                                                      .copyWith(color: kWhite),
                                                ),
                                              ]).paddingBottom(4),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Lagos, Nigeria",
                                                  style: AppStyle.body.copyWith(
                                                      fontSize: 18,
                                                      color: kWhite),
                                                ).paddingRight(4),
                                                const Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    color: kWhite)
                                              ])
                                        ])
                                  ]),
                              const CircleAvatar(
                                  backgroundColor: kWhite,
                                  child: Icon(Icons.notifications_none_rounded,
                                      color: kPurple))
                            ]).addHeight(20),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                      const SearchScreen()));
                            },
                            child:  const Hero(
                            tag: "navigate",
                            child: CustomSearch())),
                      ])))),
      FadeInUp(
          preferences: const AnimationPreferences(
              duration: Duration(
            milliseconds: 500,
          )),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tracking",
                      style: AppStyle.header.copyWith(fontSize: 18),
                    )).addHeight(10),
                Card(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(children: <Widget>[
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              title: Text(
                                "Shipment Number",
                                style: AppStyle.small.copyWith(color: kGrey),
                              ).addHeight(4),
                              subtitle: Text(
                                "#1Z999AA10123456784",
                                style: AppStyle.header.copyWith(
                                    color: Colors.black, fontSize: 16),
                              ),
                              trailing: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(-20 / 360),
                                  child:
                                      Image.asset("assets/pngs/parcel_3.png"))),
                          const SizedBox(
                              width: double.infinity,
                              child: Divider(color: kGrey, thickness: 0.2)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      CircleAvatar(
                                              backgroundColor:
                                                  Colors.orange.shade50,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Image.asset(
                                                      "assets/pngs/parcel_9.png")))
                                          .paddingRight(10),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Sender",
                                              style: AppStyle.small
                                                  .copyWith(color: kGrey),
                                            ).addHeight(3),
                                            Text(
                                              "Atlanta, 6572",
                                              style: AppStyle.body
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ]),
                                    ]),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Time",
                                        style: AppStyle.small
                                            .copyWith(color: kGrey),
                                      ).addHeight(4),
                                      Row(children: <Widget>[
                                        const CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: Colors.green,
                                        ),
                                        Text(
                                          " 2 days -3 days",
                                          style: AppStyle.body
                                              .copyWith(fontSize: 14),
                                        ),
                                      ]).paddingRight(10),
                                    ]),
                              ]).addHeight(20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      CircleAvatar(
                                              backgroundColor:
                                                  Colors.green.shade50,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Image.asset(
                                                      "assets/pngs/parcel_9.png")))
                                          .paddingRight(10),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Receiver",
                                              style: AppStyle.small
                                                  .copyWith(color: kGrey),
                                            ).addHeight(4),
                                            Text("Atlanta, 6572",
                                                style: AppStyle.body
                                                    .copyWith(fontSize: 14)),
                                          ]),
                                    ]),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Status",
                                        style: AppStyle.small
                                            .copyWith(color: kGrey),
                                      ).addHeight(4),
                                      Text("Waiting to collect",
                                          style: AppStyle.body
                                              .copyWith(fontSize: 14)),
                                    ]),
                              ]),
                          const SizedBox(
                              width: double.infinity,
                              child: Divider(color: kGrey, thickness: 0.2)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(Icons.add, color: Colors.orange),
                                Text(
                                  "Add Stop",
                                  style: AppStyle.body.copyWith(
                                      color: Colors.orange,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ])
                        ]))),
              ]))).addHeight(20),
      FadeInUp(
          preferences: const AnimationPreferences(
              duration: Duration(
            seconds: 1,
          )),
          child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Available Vehicles",
                    style: AppStyle.header.copyWith(fontSize: 18),
                  )))).addHeight(10),
      SizedBox(
          height: 230.h,
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInRight(
                        preferences: const AnimationPreferences(
                            duration: Duration(
                          seconds: 1,
                        )),
                        child: const AvailableVehicleContainer(
                          title: "Ocean Freight",
                          subtitle: "International",
                          image: "assets/pngs/parcel_3.png",
                        ));
                  })))
    ])));
  }
}
