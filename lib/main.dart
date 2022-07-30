import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'app.dart';

void main() {
  ServicesLocator.init();
  runApp(const MyApp());
}