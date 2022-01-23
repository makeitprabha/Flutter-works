import 'package:flutter/material.dart';
import 'package:my_todo/core/viewmodels/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Consumer<ThemeChanger>(
                builder: (context, ThemeChanger notifier, child) {
                  return SwitchListTile(
                    title: Text('Dark Theme'),
                    value: notifier.darkTheme,
                    onChanged: (val) {
                      notifier.toggleTheme();
                    },
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
