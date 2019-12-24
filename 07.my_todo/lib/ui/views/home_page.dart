import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/ui/views/dash_board.dart';
import 'package:my_todo/ui/views/settings.dart';
import 'package:my_todo/ui/widgets/bottom_navigation.dart';
import 'package:my_todo/ui/widgets/keyboard_hide.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _pageRouters = [
    DashBoard(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final _page = Provider.of<PageStateInformation>(context);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ],
              );
            });
      },
      child: KeyboardHider(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              _page.getIsListClicked
                  ? IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.grid_on),
                      onPressed: () {
                        _page.setIsListClicked = false;
                      },
                    )
                  : IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.list),
                      onPressed: () {
                        _page.setIsListClicked = true;
                      },
                    ),
            ],
            elevation: 0,
            title: TextWidget(
              text: 'My Task',
              textColor: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigator(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/new').then((onValue) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyHome()),
                    (Route<dynamic> route) => false);
              });
            },
            tooltip: 'Add New',
            child: Icon(Icons.note_add),
          ),
          body: _pageRouters[_page.getCurrentPage],
        ),
      ),
    );
  }
}
