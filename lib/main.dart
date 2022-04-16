import 'package:decor_app/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils/router.dart';
import 'views/landing.dart';

Future main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      onGenerateRoute: onGenerateRoute,
      home: Landing(),
      debugShowCheckedModeBanner: false,
    );
  }
}
