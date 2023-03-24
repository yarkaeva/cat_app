import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({
    super.key,
    required this.wikiUrl,
  });
  final String wikiUrl;

  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  WebViewController get controller => WebViewController()
    ..loadRequest(
      Uri.parse(widget.wikiUrl),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
