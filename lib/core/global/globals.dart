import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigatorState => navigatorKey.currentState;
}
