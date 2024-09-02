import 'package:calendar_ui/presentation/providers/medicine_list_provider.dart';
import 'package:calendar_ui/tabs.dart';
import 'package:calendar_ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MedicineListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const Tabs(),
    );
  }
}
