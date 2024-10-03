import 'package:flutter/material.dart';

import 'screens/main_screen.dart';

class FlagsApp extends StatelessWidget {
  const FlagsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flags App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
