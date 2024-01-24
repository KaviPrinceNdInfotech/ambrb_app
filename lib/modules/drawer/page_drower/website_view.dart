import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPswebsite extends StatefulWidget {
  const WebViewPswebsite({Key? key}) : super(key: key);

  @override
  State<WebViewPswebsite> createState() => _WebViewPswebsiteState();
}

class _WebViewPswebsiteState extends State<WebViewPswebsite> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await inAppWebViewController.canGoBack();
        if (isLastPage) {
          inAppWebViewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Ambrd APP'),
          backgroundColor: MyTheme.ambapp5,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest:
                  URLRequest(url: Uri.parse("https://ambrd.in/")),
              onWebViewCreated: (InAppWebViewController controller) {
                inAppWebViewController = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
            _progress < 1
                ? Container(
                    child: LinearProgressIndicator(
                      value: _progress,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
