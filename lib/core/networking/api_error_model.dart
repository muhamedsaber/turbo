import 'package:flutter/widgets.dart';

class ApiErrorModel {
  final String message;
  final IconData icon;
  final int statusCode;
  

  ApiErrorModel({required this.message, required this.icon, required this.statusCode});

}