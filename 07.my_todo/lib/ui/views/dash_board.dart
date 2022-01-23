import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_todo/core/models/cell_view.dart';
import 'package:my_todo/core/services/firebase_auth_helper.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/core/viewmodels/theme.dart';
import 'package:my_todo/ui/widgets/empty_record.dart';
import 'package:my_todo/ui/widgets/error_view.dart';
import 'package:my_todo/ui/widgets/grid_view.dart';
import 'package:my_todo/ui/widgets/list_view.dart';
import 'package:my_todo/utilities/helper.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  DashBoard();
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //int _setDocumentCount = -1;
  List<int> tasksCountArry = new List<int>();
  final Map<String, dynamic> tasksPriorityCountArry =
      new Map<String, dynamic>();
  final List<ListItem> groupListItems = new List<ListItem>();
  var _theme;

  @override
  void initState() {
    super.initState();
    //getCollection();
    // getPriorityTypeCount();
  }

  @override
  Widget build(BuildContext context) {
    var _pageState = Provider.of<PageStateInformation>(context);
    _theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: FutureBuilder<List<int>>(
        future: getCollectionTypeCount(),
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            print("test");
            if (snapshot.hasError) {
              return ErrorViewWidget(
                snapshot: snapshot.error.toString(),
              );
            }
            if (tasksCountArry.isEmpty) {
              return EmptyRecord();
            } else {
              if (_pageState.getIsListClicked) {
                return ListViewWidget(
                  listItems: groupListItems,
                );
              } else {
                return GridViewWidget(
                  priorityCount: tasksPriorityCountArry,
                  listItems: tasksCountArry,
                  orientation: Orientation.portrait,
                );
              }
            }
          }
        },
      ),
    );

    // else {
    //   if (_setDocumentCount == -1) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   } else if (_setDocumentCount == 0) {
    //     return EmptyRecord();
    //   }
    // }
    // return ErrorViewWidget(
    //   snapshot: "Opps!! Missing data information !!",
    // );
  }

  // Future<void> refreshToken(CollectionReference future) async {
  //   if (future == null) {
  //     setState(() {
  //       _setDocumentCount = 0;
  //     });
  //   } else {
  //     if (future != null && future.getDocuments() != null) {
  //       await future.getDocuments().then((onValue) {
  //         setState(() {
  //           _setDocumentCount = onValue.documents.length;
  //         });
  //       });
  //     }
  //   }
  // }

  Future<List<int>> getCollectionTypeCount() async {
    tasksCountArry.clear();
    groupListItems.clear();
    CollectionReference collectionRef;
    QuerySnapshot collectionSnapshot;
    var i = 0;
    var map = Map();
    await FirebaseAuthHelper().getCurrentUser().then((value) async {
      collectionRef = Firestore.instance.collection(value.uid);
      await Future.forEach(CellView.myTodoTypes, (str) async {
        if (collectionRef.where("Type", isEqualTo: str) != null) {
          collectionSnapshot =
              await collectionRef.where("Type", isEqualTo: str).getDocuments();
          print(collectionSnapshot.documents.length);
          if (collectionSnapshot.documents.length > 0) {
            _theme.darkTheme
                ? groupListItems.add(
                    HeadingItem(
                        CellView.myTodoTypes[i],
                        CellView.myTodoIcons[i],
                        collectionSnapshot.documents.length,
                        CellView.myTodoTileColor[i]),
                  )
                : groupListItems.add(
                    HeadingItem(
                        CellView.myTodoTypes[i],
                        CellView.myTodoIconsBlack[i],
                        collectionSnapshot.documents.length,
                        CellView.myTodoTileColor[i]),
                  );
            collectionSnapshot.documents.map(
              (DocumentSnapshot values) {
                if (!map.containsKey(values.data["Priority"])) {
                  map[values.data["Priority"]] = 1;
                } else {
                  map[values.data["Priority"]] += 1;
                }
                groupListItems.add(
                  MessageItem(
                    CellView.myTodoTypes[i],
                    values.data["Description"],
                    values.data["Priority"],
                    values.documentID,
                  ),
                );
              },
            ).toList();
          }
          tasksPriorityCountArry[CellView.myTodoTypes[i]] =
              Map.fromEntries(map.entries);
          tasksCountArry.add(collectionSnapshot.documents.length);
          //print("task count array====> $tasksCountArry");
          //print("===priority===>>> $tasksPriorityCountArry");
          i++;
        }
      });
    });
    return tasksCountArry;
  }

  // Future<void> getCollection() async {
  //   CollectionReference userReference;
  //   FirebaseAuthHelper().getCurrentUser().then((value) async {
  //     userReference = Firestore.instance.collection(value.uid);
  //     await refreshToken(userReference);
  //   });
  // }
}
