import 'package:get_it/get_it.dart';
import 'package:my_todo/core/services/api.dart';
import 'package:my_todo/core/viewmodels/CRUDModel.dart';
import 'package:my_todo/core/viewmodels/page_state_information.dart';
import 'package:my_todo/core/viewmodels/theme.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('todos'));
  locator.registerLazySingleton(() => CRUDModel());
  locator.registerLazySingleton(() => PageStateInformation());
  locator.registerLazySingleton(() => ThemeChanger());
}
