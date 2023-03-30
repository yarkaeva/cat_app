import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({
    super.key,
  });

  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  WebViewController _setController(String wikiUrl) {
    WebViewController controller = WebViewController()
      ..loadRequest(
        Uri.parse(wikiUrl),
      );
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final String wikiUrl = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia'),
      ),
      body: WebViewWidget(
        controller: _setController(wikiUrl),
      ),
    );
  }
}
