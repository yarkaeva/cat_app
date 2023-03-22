import 'package:fetching_data_with_cat_api/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'core/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
