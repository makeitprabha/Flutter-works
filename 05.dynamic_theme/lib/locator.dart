import 'package:dynamic_theme/theme.dart';
import 'package:get_it/get_it.dart'; 

GetIt locator = GetIt.instance;

void setupLocator() { 
  locator.registerLazySingleton(() => ThemeChanger());
}
