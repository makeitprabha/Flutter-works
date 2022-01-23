import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_router/first_page.dart';
import 'package:auto_router/initial_page.dart';
import 'package:auto_router/second_page.dart';

@autoRouter
class $Router {
  @initial
  InitialPage initialPage;
  FirstPage firstPage;
  SecondPage secondPage;
}
