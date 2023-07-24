import 'package:flutter/material.dart';

import '../../constants/screens.dart' as screens;
import '../../data/remote/responses/movies/movies_response.dart';
import '../../data/remote/responses/persons/persons_response.dart';
import '../../data/remote/responses/tv_shows/tv_shows_response.dart';
import '../screens/home/home_layout.dart';

import '../screens/movies/movies_details_screen.dart';
import '../screens/persons/person_details_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/tv_shows/tv_show_details_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.movieDetails:
        final MoviesResults moviesModel = settings.arguments as MoviesResults;
        return MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(moviesModel: moviesModel));
      case screens.tvShowDetails:
        final TVShowsResults tvShowsModel =
            settings.arguments as TVShowsResults;
        return MaterialPageRoute(
            builder: (_) => TVShowDetailsScreen(tvShowsModel: tvShowsModel));
      case screens.personDetails:
        final PersonsResults personsModel =
            settings.arguments as PersonsResults;
        return MaterialPageRoute(
            builder: (_) => PersonDetailsScreen(personsModel: personsModel));
      default:
        return null;
    }
  }
}
