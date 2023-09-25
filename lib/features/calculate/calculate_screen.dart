import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final List<String> categories = [
      "Document",
      "Glass",
      "Liquid",
      "Food",
      "Electronic",
      "Product",
      "Others"
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPurple,
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: FadeInDown(
              preferences: const AnimationPreferences(
                  duration: Duration(
                seconds: 2,
              )),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.navigationWidget);
                  },
                  child: const Icon(Icons.arrow_back_ios_sharp))),
          centerTitle: true,
          title: FadeInDown(
              preferences: const AnimationPreferences(
                  duration: Duration(
                seconds: 2,
              )),
              child: const Text("Calculate")),
        ),
        body: ZoomIn(
            preferences: const AnimationPreferences(
                duration: Duration(
              milliseconds: 1,
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                SlideInDown(
                    preferences: const AnimationPreferences(
                        duration: Duration(
                      milliseconds: 600,
                    )),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Destination",
                          style: AppStyle.header.copyWith(fontSize: 18)),
                    )).addHeight(10),
                SlideInDown(
                    preferences: const AnimationPreferences(
                        duration: Duration(
                      milliseconds: 1200,
                    )),
                    child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      cursorColor: kPurple,
                                      cursorWidth: 0.9,
                                      style: AppStyle.body.copyWith(
                                          color: Colors.black, fontSize: 20),
                                      onTap: () {},
                                      enabled: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Icon(
                                                Icons.book_outlined,
                                                color: kGrey,
                                                size: 24,
                                              ).paddingRight(6).paddingLeft(10),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: kGrey,
                                              ).paddingRight(10),
                                            ]),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        isDense: true,
                                        fillColor: kGrey.withOpacity(0.08),
                                        filled: true,
                                        contentPadding: const EdgeInsets.all(
                                          18,
                                        ),
                                        hintText: "Sender location",
                                        hintStyle: AppStyle.body.copyWith(
                                            color: kGrey, fontSize: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Colors.transparent)),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        //: InputBorder.none,
                                      ),
                                      //   onChanged: (){},
                                    )).addHeight(10),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      cursorColor: kPurple,
                                      cursorWidth: 0.9,
                                      style: AppStyle.body.copyWith(
                                          color: Colors.black, fontSize: 20),
                                      onTap: () {},
                                      enabled: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Icon(
                                                Icons.book_outlined,
                                                color: kGrey,
                                                size: 24,
                                              ).paddingRight(6).paddingLeft(10),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: kGrey,
                                              ).paddingRight(10),
                                            ]),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        isDense: true,
                                        fillColor: kGrey.withOpacity(0.08),
                                        filled: true,
                                        contentPadding: const EdgeInsets.all(
                                          18,
                                        ),
                                        hintText: "Receiver location",
                                        hintStyle: AppStyle.body.copyWith(
                                            color: kGrey, fontSize: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Colors.transparent)),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        //: InputBorder.none,
                                      ),
                                      //   onChanged: (){},
                                    )).addHeight(10),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      cursorColor: kPurple,
                                      cursorWidth: 0.9,
                                      style: AppStyle.body.copyWith(
                                          color: Colors.black, fontSize: 20),
                                      onTap: () {},
                                      enabled: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Icon(
                                                Icons.book_outlined,
                                                color: kGrey,
                                                size: 24,
                                              ).paddingRight(6).paddingLeft(10),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: kGrey,
                                              ).paddingRight(10),
                                            ]),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        isDense: true,
                                        fillColor: kGrey.withOpacity(0.08),
                                        filled: true,
                                        contentPadding: const EdgeInsets.all(
                                          18,
                                        ),
                                        hintText: "Approx weight",
                                        hintStyle: AppStyle.body.copyWith(
                                            color: kGrey, fontSize: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Colors.transparent)),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                        ),
                                        //: InputBorder.none,
                                      ),
                                      //   onChanged: (){},
                                    ))
                              ],
                            )))).addHeight(20),
                ZoomIn(
                    preferences: const AnimationPreferences(
                        duration: Duration(
                      milliseconds: 2000,
                    )),
                    child: Column(children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Packaging",
                            style: AppStyle.header.copyWith(fontSize: 18),
                          )).addHeight(2),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "What are you sending",
                            style: AppStyle.body.copyWith(color: kGrey),
                          ).addHeight(20)),
                      Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                cursorColor: kPurple,
                                cursorWidth: 0.9,
                                style: AppStyle.body.copyWith(
                                    color: Colors.black, fontSize: 20),
                                onTap: () {},
                                enabled: true,
                                decoration: InputDecoration(
                                  prefixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Icon(
                                          Icons.book_outlined,
                                          color: kGrey,
                                          size: 24,
                                        ).paddingRight(6).paddingLeft(10),
                                        Container(
                                          height: 30,
                                          width: 1,
                                          color: kGrey,
                                        ).paddingRight(10),
                                      ]),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  isDense: true,
                                  fillColor: kWhite,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(
                                    18,
                                  ),
                                  suffixIcon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 24,
                                      color: kGrey),
                                  hintText: "Box",
                                  hintStyle: AppStyle.body.copyWith(
                                      color: Colors.black, fontSize: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.transparent)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  //: InputBorder.none,
                                ),
                                //   onChanged: (){},
                              ))).addHeight(10),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Categories",
                            style: AppStyle.header.copyWith(fontSize: 18),
                          )).addHeight(2),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "What are you sending",
                            style: AppStyle.body.copyWith(color: kGrey),
                          )).addHeight(20),
                      ZoomInRight(
                          preferences: const AnimationPreferences(
                              duration: Duration(
                            milliseconds: 10,
                          )),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Wrap(
                                spacing: 10,
                                children: List<Widget>.generate(
                                  categories.length,
                                  (int index) {
                                    return ChoiceChip(
                                      selectedColor: Colors.black,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              width: 1, color: kGrey)),
                                      //StadiumBorder(side: BorderSide(), ),

                                      label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Visibility(
                                                visible:
                                                    _selectedIndex == index,
                                                child: const Icon(
                                                  Icons.check_outlined,
                                                  color: kWhite,
                                                )),
                                            Text(
                                              categories[index],
                                              style: AppStyle.body.copyWith(
                                                  color: _selectedIndex == index
                                                      ? kWhite
                                                      : null),
                                            )
                                          ]),
                                      selected: _selectedIndex == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _selectedIndex =
                                              (selected ? index : null)!;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              )))
                    ])).addHeight(60),
                SlideInUp(
                        preferences: const AnimationPreferences(
                            duration: Duration(
                          seconds: 1,
                        )),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.calculateResult);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.orange),
                                width: double.infinity,
                                height: 60,
                                child: Center(
                                    child: Text("Calculate",
                                        style: AppStyle.body.copyWith(
                                            color: kWhite, fontSize: 18))))))
                    .addHeight(20)
              ])),
            )));
  }
}
