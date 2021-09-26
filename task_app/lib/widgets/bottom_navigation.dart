import 'package:flutter/material.dart';
import 'package:taskapp/constants/colors.dart'; 
import 'package:taskapp/controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_2),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Manage',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Accounts',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: BottomNavigationController.to.index.value,
      selectedItemColor: colorBlue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        BottomNavigationController.to.setBottomNavigationIndex(index);
      },
      elevation: 5,
    );
  }
}
