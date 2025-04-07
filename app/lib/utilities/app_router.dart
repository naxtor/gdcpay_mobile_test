import 'package:app/utilities/app_constants.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case AppConstants.searchRoute:
        page = Container();
        break;
      case AppConstants.profileRoute:
        page = Container();
        break;
      case AppConstants.repositoryDetailsRoute:
        page = Container();
        break;
      default:
        page = Container();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }
}
