import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/features/calculate/calculate_screen.dart';
import 'package:moniepoint_test/features/profile/profile_screen.dart';
import 'package:moniepoint_test/features/shipment/shipment_history.dart';
import 'package:moniepoint_test/features/home/home_screen.dart';

class NavigationWidget extends StatefulWidget {
  int? loadedTab;

  NavigationWidget({Key? key, this.loadedTab = 0}) : super(key: key);

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0; //default index
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeScreen(),
                CalculateScreen(),
                ShipmentHistory(),
                // ProfileScreen2()

                ProfileScreen()
              ],
            ),
            bottomNavigationBar: SlideInUp(
              preferences: const AnimationPreferences(
                  duration: Duration(
                seconds: 1,
              )),
              child: Visibility(
                  visible: _selectedIndex == 0 || _selectedIndex == 3,
                  child: CustomLineIndicatorBottomNavbar(
                    selectedColor: kPurple,
                    unSelectedColor: kGrey,
                    backgroundColor: Colors.white,
                    selectedIconSize: 30,
                    unselectedIconSize: 28,
                    currentIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      _pageController.jumpToPage(_selectedIndex);
                    },
                    enableLineIndicator: true,
                    lineIndicatorWidth: 4,
                    indicatorType: IndicatorType.Top,
                    customBottomBarItems: [
                      CustomBottomBarItems(
                          label: 'Home', icon: Icons.home_outlined),
                      CustomBottomBarItems(
                          label: "Calculate", icon: Icons.calculate_outlined),
                      CustomBottomBarItems(
                          label: "Shipment", icon: Icons.history_outlined),
                      CustomBottomBarItems(
                          label: "Profile", icon: Icons.person_outline),
                    ],
                  )),
            )));
  }
}
