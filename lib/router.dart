import 'package:dressme_up/authentication/LoginScreen/LoginScreen.dart';

import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => const AuthScreen());
    default :
      return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => const Scaffold(
        body: Center(child: Text("page not found"))
        ),
      );
  }
}