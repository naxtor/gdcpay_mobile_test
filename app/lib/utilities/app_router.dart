import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/repository_details_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case AppConstants.searchRoute:
        page = const SearchScreen();
        break;
      case AppConstants.profileRoute:
        final args = settings.arguments as Map<String, String>;

        page = ProfileScreen(
          username: args["username"]!,
        );
        break;
      case AppConstants.repositoryDetailsRoute:
        final args = settings.arguments as Map<String, String>;

        page = RepositoryDetailsScreen(
          url: args["url"]!,
        );
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
