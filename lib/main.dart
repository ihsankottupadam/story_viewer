import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_viewer/screens/home_screen.dart';

import 'bindings/initial_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Story viewer',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
