import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_todo/core/models/cell_view.dart';
import 'package:my_todo/core/models/screen_route.dart';
import 'package:my_todo/core/viewmodels/CRUDModel.dart';
import 'package:my_todo/core/viewmodels/theme.dart';
import 'package:my_todo/ui/views/home_page.dart';
import 'package:my_todo/ui/widgets/list_view.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final String todoDetails;
  final Image iconSet;
  final int todoCount;
  final int position;
  final Color myTodoTileColor;

  ProductCard({
    @required this.todoCount,
    @required this.todoDetails,
    @required this.iconSet,
    @required this.position,
    @required this.myTodoTileColor,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final List<ListItem> groupListItems = new List<ListItem>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getCollectionTypeCount(context);
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          semanticContainer: true,
          color: widget.myTodoTileColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1),
              borderRadius: BorderRadius.circular(8)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.iconSet,
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: widget.todoDetails,
                  textColor: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 30,
                ),
                TextWidget(
                  text: "${widget.todoCount} task(s)",
                  textColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getCollectionTypeCount(BuildContext context) async {
    final productProvider = Provider.of<CRUDModel>(context);
    final _theme = Provider.of<ThemeChanger>(context);
    CollectionReference userReference =
        productProvider.getCollectionReference();
    QuerySnapshot eventsQuery;
    groupListItems.clear();

    eventsQuery = await userReference
        .where("Type", isEqualTo: this.widget.todoDetails)
        .getDocuments();

    if (eventsQuery.documents.length > 0) {
      _theme.darkTheme
          ? groupListItems.add(
              HeadingItem(
                  this.widget.todoDetails,
                  CellView.myTodoIcons[this.widget.position],
                  eventsQuery.documents.length,
                  CellView.myTodoTileColor[this.widget.position]),
            )
          : groupListItems.add(
              HeadingItem(
                  this.widget.todoDetails,
                  CellView.myTodoIconsBlack[this.widget.position],
                  eventsQuery.documents.length,
                  CellView.myTodoTileColor[this.widget.position]),
            );
      eventsQuery.documents.map(
        (DocumentSnapshot values) {
          groupListItems.add(MessageItem(
              widget.todoDetails,
              values.data["Description"],
              values.data["Priority"],
              values.documentID));
        },
      ).toList();
      var args = ScreenArguments(groupListItems, this.widget.position);
      Navigator.pushNamed(context, '/details', arguments: args).then((onValue) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
            (Route<dynamic> route) => false);
      });
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Oops!! Empty list !!")));
    }
  }
}
