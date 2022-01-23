import 'package:dynamic_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyTheme());
}

class MyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      child: Consumer<ThemeChanger>(
        builder: (context, ThemeChanger notifier, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? darkTheme : lightTheme,
            home: ThemePage(),
          );
        },
      ),
    );
  }
}

class ThemePage extends StatelessWidget {
  const ThemePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Provider'),
        centerTitle: true,
      ),
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
