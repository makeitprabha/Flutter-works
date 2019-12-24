import 'package:flutter/material.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/core/viewmodels/theme.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatelessWidget {
  final _pageTitle = ["ToDo", "Settings"];
  @override
  Widget build(BuildContext context) {
    final _page = Provider.of<PageStateInformation>(context);
    final _theme = Provider.of<ThemeChanger>(context);

    return Container(
      child: BottomNavigationBar(
        backgroundColor: _theme.darkTheme ? Colors.grey[800] : Colors.blue[900],
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: _page.getCurrentPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: TextWidget(
              text: 'Dashboard',
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
          if (index == 1) {
            _page.setIsSettingsActivate = true;
          } else {
            _page.setIsSettingsActivate = false;
          }
        },
      ),
    );
  }
}
