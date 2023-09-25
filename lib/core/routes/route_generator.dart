import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/bottom_nav_bar.dart';
import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/features/calculate/calculate_result_screen.dart';
import 'package:moniepoint_test/features/home/search_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    case AppRoutes.searchScreen:
    return MaterialPageRoute(builder: (_) => const SearchScreen());
      case AppRoutes.calculateResult:
        return MaterialPageRoute(builder: (_) => const CalculateResultScreen());
      case AppRoutes.navigationWidget:
        return MaterialPageRoute(
            builder: (_) =>  NavigationWidget());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
