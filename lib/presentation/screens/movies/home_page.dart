import 'package:cinemapedia/presentation/views/movies/favorites_view.dart';
import 'package:cinemapedia/presentation/views/movies/home_view.dart';
import 'package:cinemapedia/presentation/widgets/shared/button_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int pageIndex;
  const HomePage({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[HomeView(), SizedBox(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonNavigation(currentIndex: pageIndex),
      body: Center(
        child: IndexedStack(
          index: pageIndex,
          children: viewRoutes,
        ),
      ),
    );
  }
}
