import 'package:flutter/material.dart';
import 'package:my_todo/core/models/cell_view.dart';
import 'package:my_todo/ui/widgets/product_card.dart';

class GridViewWidget extends StatefulWidget {
  final List<int> listItems;
  final Orientation orientation;

  GridViewWidget({
    @required this.listItems,
    @required this.orientation,
  });

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (widget.orientation == Orientation.portrait) ? 2 : 3),
      itemCount: CellView.myTodoIcons.length,
      itemBuilder: (context, index) {
        return ProductCard(
          myTodoTileColor: CellView.myTodoTileColor[index],
          position: index,
          todoCount: widget.listItems[index],
          iconSet: CellView.myTodoIcons[index],
          todoDetails: CellView.myTodoTypes[index],
        );
      },
    );
  }
}
