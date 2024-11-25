import 'package:casa_fruit_scale_codes/screens/home_page_screen.dart';
import 'package:casa_fruit_scale_codes/singletons/database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  DatabaseManager dbManager = DatabaseManager();
  dbManager.loadDatabase();
}

