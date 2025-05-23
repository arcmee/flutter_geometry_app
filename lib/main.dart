import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
    runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}



