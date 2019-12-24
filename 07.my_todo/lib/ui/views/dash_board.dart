import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_todo/core/models/cell_view.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/core/viewmodels/theme.dart';
import 'package:my_todo/ui/widgets/error_view.dart';
import 'package:my_todo/ui/widgets/grid_view.dart';
import 'package:my_todo/ui/widgets/list_view.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  DashBoard();
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _setDocumentCount = -1;
  Future<CollectionReference> future;
  Future<void> futureInt;
  Future<void> futurevoid;
  final List<int> tasksCountArry = new List<int>();
  final List<ListItem> groupListItems = new List<ListItem>();
  var _theme;

  @override
  void initState() {
    super.initState();
    future = getCollection();
    refreshToken();
    futureInt = getCollectionTypeCount();
  }

  @override
  Widget build(BuildContext context) {
    var _pageState = Provider.of<PageStateInformation>(context);
    _theme = Provider.of<ThemeChanger>(context);
    if (_setDocumentCount > 0) {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: getCollectionTypeCount,
          child: OrientationBuilder(
            builder: (context, orientation) {
              return FutureBuilder(
                future: futureInt,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return ErrorViewWidget(
                          snapshot: snapshot.error.toString(),
                        );
                      }
                      if (_pageState.getIsListClicked) {
                        return ListViewWidget(
                          listItems: groupListItems,
                        );
                      } else {
                        return GridViewWidget(
                          listItems: tasksCountArry,
                          orientation: orientation,
                        );
                      }
                      break;
                    default:
                      return Text('');
                  }
                },
              );
            },
          ),
        ),
      );
    } else {
      if (_setDocumentCount == -1) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (_setDocumentCount == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset('assets/images/empty.png'),
              SizedBox(
                height: 30,
              ),
              TextWidget(
                text: 'Oops!! Document is empty!!',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textColor: Colors.black,
              )
            ],
          ),
        );
      }
    }
    return ErrorViewWidget(
      snapshot: "Opps!! Missing data information !!",
    );
  }

  Future<void> refreshToken() async {
    if (future == null) {
      setState(() {
        _setDocumentCount = 0;
      });
    } else {
      future.then((onValue) {
        onValue.getDocuments().then((onValue) {
          setState(() {
            _setDocumentCount = onValue.documents.length;
          });
        });
      });
    }
  }

  Future<void> getCollectionTypeCount() async {
    CollectionReference userReference =
        Firestore.instance.collection('todos').reference();
    QuerySnapshot eventsQuery;
    tasksCountArry.clear();
    groupListItems.clear();
    for (int i = 0; i < CellView.myTodoTypes.length; i++) {
      eventsQuery = await userReference
          .where("Type", isEqualTo: CellView.myTodoTypes[i])
          .getDocuments();
      if (eventsQuery.documents.length > 0) {
        _theme.darkTheme
            ? groupListItems.add(
                HeadingItem(CellView.myTodoTypes[i], CellView.myTodoIcons[i],
                    eventsQuery.documents.length, CellView.myTodoTileColor[i]),
              )
            : groupListItems.add(
                HeadingItem(
                    CellView.myTodoTypes[i],
                    CellView.myTodoIconsBlack[i],
                    eventsQuery.documents.length,
                    CellView.myTodoTileColor[i]),
              );
        eventsQuery.documents.map(
          (DocumentSnapshot values) {
            groupListItems.add(MessageItem(
                CellView.myTodoTypes[i],
                values.data["Description"],
                values.data["Priority"],
                values.documentID));
          },
        ).toList();
      }
      tasksCountArry.add(eventsQuery.documents.length);
    }
  }

  Future<CollectionReference> getCollection() async {
    CollectionReference userReference = Firestore.instance.collection('todos');
    return userReference;
  }
}
