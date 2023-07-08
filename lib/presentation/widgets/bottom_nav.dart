import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int newIndex, _) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
              ),
            ],
          ),
          child: BottomNavigationBar(
            selectedLabelStyle:
                getRegularStyle(color: Colormanager.primary, fontSize: 15),
            unselectedLabelStyle:
                getRegularStyle(color: Colors.grey, fontSize: 15),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colormanager.background,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            selectedItemColor: Colormanager.primary,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colormanager.primary),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_4_outlined), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More')
            ],
          ),
        );
      },
    );
  }
}
