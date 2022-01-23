import 'package:flutter/material.dart';
import 'package:my_todo/core/viewmodels/CRUDModel.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/core/viewmodels/theme.dart';
import 'package:my_todo/locator.dart';
import 'package:my_todo/ui/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyTodoHome());
}

class MyTodoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
        ChangeNotifierProvider(create: (_) => locator<PageStateInformation>()),
        ChangeNotifierProvider(create: (_) => locator<ThemeChanger>()),
      ],
      child: Consumer<ThemeChanger>(
        builder: (context, ThemeChanger notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            title: 'Product App',
            theme: notifier.darkTheme ? darkTheme : lightTheme,
            onGenerateRoute: Router.generateRoute,
          );
        },
      ),
    );
  }
}
