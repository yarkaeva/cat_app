import 'package:cat_app/features/cats/presentation/pages/breed_page.dart';
import 'package:cat_app/features/cats/presentation/pages/home_page.dart';
import 'package:cat_app/features/cats/presentation/pages/wiki_page.dart';
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
      routes: {
        '/': (context) => const HomePage(),
        '/cat-page': (context) => const CatPage(),
        '/cat-page-wiki': (context) => const WikiPage(),
      },
    );
  }
}
