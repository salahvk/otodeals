import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/cart_screen.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/home_screen.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/more_screen.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/profile_screen.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/search_screen.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colormanager.background,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
