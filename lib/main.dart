
import 'package:flutter/material.dart';
import 'package:turbo/config/router/app_router.dart';
import 'package:turbo/config/router/routes.dart';
import 'package:turbo/core/di.dart';

void main() {
  setupDependencies();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}

