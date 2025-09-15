import 'package:flutter/material.dart';
import 'package:turbo/config/router/router_transitions.dart';
import 'package:turbo/config/router/routes.dart';
import 'package:turbo/features/auth/modules/login/login_view.dart';
import 'package:turbo/features/home/home_view.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case Routes.login:
        return RouterTransitions.build(LoginView());
      case Routes.home:
      return RouterTransitions.buildHorizontal(HomeView());  
      default: return RouterTransitions.build(Scaffold(
        body:Center(
          child: Text("No Route"),
        ),
      ));
    }
  }
}