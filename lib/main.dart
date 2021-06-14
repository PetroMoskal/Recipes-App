import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/recipes_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Recipes App';

    return ChangeNotifierProvider(
      create: (ctx) => Items(),
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(appTitle),
      ),
    );
  }
}
