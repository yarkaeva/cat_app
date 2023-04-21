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
  late final WebViewController controller;
  double loadStatus = 0;

  @override
  void didChangeDependencies() {
    final String wikiUrl = ModalRoute.of(context)?.settings.arguments as String;
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (_) {
            setState(() {
              loadStatus = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadStatus = (progress / 100).toDouble();
            });
          },
          onPageFinished: (_) => setState(() {
                loadStatus = 100;
              })))
      ..loadRequest(Uri.parse(wikiUrl));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (await controller.canGoBack()) {
                controller.goBack();
              }
              controller.goBack();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () async {
              if (await controller.canGoForward()) {
                controller.goForward();
              }
              controller.goBack();
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              controller.reload();
              loadStatus = 0;
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        title: const Text('Wikipedia'),
      ),
      body: Stack(children: [
        WebViewWidget(controller: controller),
        if (loadStatus < 100)
          LinearProgressIndicator(
            value: loadStatus,
          ),
      ]),
    );
  }
}
