import 'package:flutter/material.dart';
import 'package:my_todo/core/models/records.dart';
import 'package:my_todo/core/viewmodels/CRUDModel.dart';
import 'package:provider/provider.dart';

class AddNew extends StatefulWidget {
  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final myController = TextEditingController();
  List<TodoType> todoType = <TodoType>[
    const TodoType('Personal'),
    const TodoType('Meeting'),
    const TodoType('Shopping'),
    const TodoType('Others'),
  ];
  List<TodoPriority> todoPriority = <TodoPriority>[
    const TodoPriority('Low'),
    const TodoPriority('Medium'),
    const TodoPriority('High'),
  ];
  TodoType selectedTodoType;
  TodoPriority selectedTodoriority;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Add New'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<TodoType>(
                    isExpanded: true,
                    hint: Text("Select a todo's type"),
                    value: selectedTodoType,
                    onChanged: (TodoType newValue) {
                      setState(() {
                        selectedTodoType = newValue;
                      });
                    },
                    items: todoType.map((TodoType user) {
                      return DropdownMenuItem<TodoType>(
                        value: user,
                        child: Text(
                          user.type,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  DropdownButton<TodoPriority>(
                    isExpanded: true,
                    hint: Text("Select a todo's priority"),
                    value: selectedTodoriority,
                    onChanged: (TodoPriority newValue) {
                      setState(() {
                        selectedTodoriority = newValue;
                      });
                    },
                    items: todoPriority.map((TodoPriority user) {
                      return DropdownMenuItem<TodoPriority>(
                        value: user,
                        child: Text(
                          user.priority,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: myController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            Records data = Records(
                type: selectedTodoType.type,
                priority: selectedTodoriority.priority,
                description: myController.text);
            productProvider.addProduct(data);
            showInSnackBar("Added data successfully!!!");
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }
}

class TodoType {
  const TodoType(this.type);

  final String type;
}

class TodoPriority {
  const TodoPriority(this.priority);

  final String priority;
}
