import 'package:flutter/material.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatelessWidget {
  final _pageTitle = ["ToDo", "Settings"];
  @override
  Widget build(BuildContext context) {
    final _page = Provider.of<PageStateInformation>(context);
    return Container(
      child: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: _page.getCurrentPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: TextWidget(
              text: 'Dash Board',
              textColor: null,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: TextWidget(
              text: 'Settings',
              textColor: null,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
        onTap: (index) {
          _page.setCurrentPage = index;
          _page.setPageTitle = _pageTitle[index];
        },
      ),
    );
  }
}
