import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo/core/viewmodels/CRUDModel.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatefulWidget {
  final List<ListItem> listItems;

  ListViewWidget({@required this.listItems});

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          addAutomaticKeepAlives: true,
          primary: false,
          shrinkWrap: true,
          itemCount: widget.listItems.length,
          itemBuilder: (context, index) {
            final item = widget.listItems[index];
            if (item is HeadingItem) {
              selectedColor = item.itemColor;
              return ListTile(
                leading: SizedBox(
                  child: item.icon,
                  height: 25,
                  width: 25,
                ),
                title: TextWidget(
                  text: item.heading,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: item.itemColor,
                ),
              );
            } else if (item is MessageItem) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Card(
                  elevation: 2,
                  child: ClipPath(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: TextWidget(
                              textColor: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              text: item.body,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: priorityBadge(item.priority),
                                  width: 4))),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.grey[400], width: 0.8),
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: selectedColor,
                    icon: Icons.delete_forever,
                    onTap: () {
                      if (item is HeadingItem) {
                        print(item.sender.length);
                      }
                      if (item is MessageItem) {
                        print(widget.listItems);
                        widget.listItems.removeAt(index);
                        print(item.documentId);
                        print(widget.listItems);
                      }
                      // setState(() {
                      //   _deleteProductID(context, item.documentId);
                      // });
                      showInSnackBar(context, "Item deleted successfully.");
                    },
                  ),
                ],
              );
            }
            return Text('');
          },
        ),
      ),
    );
  }

  void showInSnackBar(BuildContext context, String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  Color priorityBadge(String priority) {
    if (priority.toLowerCase() == "low") {
      return Colors.yellow[700];
    } else if (priority.toLowerCase() == "high") {
      return Colors.red[900];
    } else if (priority.toLowerCase() == "medium") {
      return Colors.green[900];
    }
    return Colors.white;
  }

  _deleteProductID(context, index) {
    final productProvider = Provider.of<CRUDModel>(context);
    productProvider.removeProduct(index);
  }
}

// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;
  final Image icon;
  final int taskTotalCount;
  final Color itemColor;

  HeadingItem(this.heading, this.icon, this.taskTotalCount, this.itemColor);
}

// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;
  final String priority;
  final String documentId;

  MessageItem(this.sender, this.body, this.priority, this.documentId);
}
