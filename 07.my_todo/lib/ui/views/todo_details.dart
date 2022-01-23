import 'package:flutter/material.dart';
import 'package:my_todo/core/models/cell_view.dart';
import 'package:my_todo/ui/widgets/list_view.dart';

class ToDoDetails extends StatelessWidget {
  final List<ListItem> groupListItems;
  final int colorPosition;

  ToDoDetails({
    @required this.groupListItems,
    @required this.colorPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: CellView.myTodoTileColor[colorPosition],
      ),
      body: Container(
        child: ListViewWidget(
          listItems: groupListItems,
        ),
      ),
    );
  }
}
