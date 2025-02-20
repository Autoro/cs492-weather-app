import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  final String title = 'CS492 Weather App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: title),
    );
  }
}
