import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material application',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyScafoldApp(),
    );
  }
}

class MyScafoldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scafold Widget Application'),
      ),
      body: Builder(builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Snack Bar',
                  textAlign: TextAlign.left,
                ),
                backgroundColor: Colors.blue,
                action: SnackBarAction(
                  label: 'Undo',
                  textColor: Colors.black,
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Cliked Undo",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
              ));
            },
          ),
        );
      }),
    );
  }
}
