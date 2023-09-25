import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:moniepoint_test/app/widgets/search_result_container.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';
import 'package:moniepoint_test/core/utils/widget_extension.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationcontroller;
  double animationduration = 0.0;
  int totalitems = 4;

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
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: kPurple,
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: FadeIn(
              preferences: const AnimationPreferences(
                  duration: Duration(
                seconds: 2,
              )),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.navigationWidget);
                  },
                  child: const Icon(Icons.arrow_back_ios_sharp))),
          title: Hero(
              tag: "navigate",
              transitionOnUserGestures: true,
              // child:FadeInUp(
              //           preferences: const AnimationPreferences(
              //               duration: Duration(
              //             milliseconds: 250,
              //           )),
              //           child:
              child: GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, AppRoutes.searchScreen);
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: TextFormField(
                        cursorColor: kPurple,
                        cursorWidth: 0.9,
                        enabled: true,
                        style: AppStyle.body.copyWith(color: kGrey),
                        onTap: () {
                          //Navigator.pushNamed(context, AppRoutes.searchScreen);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: kPurple,
                            size: 20,
                          ),

                          suffixIcon: Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.all(6),
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.orange,
                              ),
                              child: const Icon(Icons.book_outlined,
                                  color: kWhite, size: 20)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.transparent),
                          ),
                          isDense: true,
                          fillColor: kWhite,
                          filled: true,
                          contentPadding: const EdgeInsets.all(
                            18,
                          ),
                          hintText: "Enter the receipt number...",
                          hintStyle: AppStyle.body.copyWith(color: kGrey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  width: 0, color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.transparent),
                          ),
                          //: InputBorder.none,
                        ),
                        //   onChanged: (){},
                      ))))),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          FadeInUpBig(
                              preferences: const AnimationPreferences(
                                  duration: Duration(
                                milliseconds: 400,
                              )),
                              child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return SearchContainer(
                                                    id: "#1Z999AA10123456 ",
                                                    title: "Summer",
                                                    endLocation: "Lagos",
                                                    startLocation: " Ogun",
                                                    animationcontroller:
                                                        _animationcontroller,
                                                    index: index,
                                                    duration: animationduration)
                                                .addHeight(6);
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                                width: double.infinity,
                                                child: Divider(
                                                    color: kGrey,
                                                    thickness: 0.2));
                                          },
                                          itemCount: totalitems))))
                        ])))));
  }
}
