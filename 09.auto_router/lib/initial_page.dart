import 'package:auto_router/router/router.gr.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Goto Second Page'),
                onPressed: () {
                  Router.navigator
                      .pushNamed(Router.firstPage, arguments: "Prabha");
                },
              ),
              RaisedButton(
                child: Text('Goto Third Page'),
                onPressed: () {
                  Router.navigator.pushNamed(
                    Router.secondPage,
                    arguments: SecondPageArguments(name: "Prabha", x: 32),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
