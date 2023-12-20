import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outline), label: 'Categorias'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Favorites')
      ],
    );
  }
}
