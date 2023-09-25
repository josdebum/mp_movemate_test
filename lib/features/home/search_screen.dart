import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:moniepoint_test/app/widgets/custom_search_field.dart';
import 'package:moniepoint_test/app/widgets/search_result_container.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';

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
          title: const Hero(tag: "navigate", child: CustomSearch()),
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
                                          horizontal: 16, vertical: 10),
                                      child: AnimationLimiter(
                                        child: ListView.separated(
                                          itemCount: 6,
                                          shrinkWrap: true,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                                width: double.infinity,
                                                child: Divider(
                                                    color: kGrey,
                                                    thickness: 0.2));
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              child: SlideAnimation(
                                                  verticalOffset: 20.0,
                                                  curve: Curves.easeIn,
                                                  child: SearchContainer(
                                                      id: "#1Z999AA10123456 ",
                                                      title: "Summer",
                                                      endLocation: "Lagos",
                                                      startLocation: " Ogun",
                                                      animationcontroller:
                                                          _animationcontroller,
                                                      index: index,
                                                      duration:
                                                          animationduration)),
                                            );
                                          },
                                        ),
                                      ))))
                        ])))));
  }
}
