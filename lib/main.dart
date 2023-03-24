import 'package:fetching_data_with_cat_api/pages/cat_page.dart';
import 'package:fetching_data_with_cat_api/pages/home_page.dart';
import 'package:fetching_data_with_cat_api/pages/wiki_page.dart';
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
        '/cat_page': (context) => const CatPage(),
        '/cat_page_wiki': (context) => WikiPage(
              wikiUrl: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
