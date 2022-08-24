import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser_Page extends StatefulWidget {
  const Browser_Page({Key? key}) : super(key: key);

  @override
  State<Browser_Page> createState() => _Browser_PageState();
}

class _Browser_PageState extends State<Browser_Page> {
  final link = "https://www.youtube.com";
  WebViewController? _webViewController;
  bool _showDownloadButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    checkurl();
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController!.canGoBack()) {
          _webViewController!.goBack();
        }
        return false;
      },
      child: Scaffold(
        body:
             WebView(
                initialUrl: link,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  setState(() {
                    _webViewController = controller;
                  });
                },
              ),
        floatingActionButton: _showDownloadButton == false
            ? Container()
            : FloatingActionButton(
                backgroundColor: Colors.pink,
                onPressed: () async {
                  if (kDebugMode) {
                    print(await _webViewController!.currentUrl());
                  }
                  var url = await _webViewController!.currentUrl();
                  var title = await _webViewController!.getTitle();
                  final result = await FlutterYoutubeDownloader.downloadVideo(
                      url!, "$title", 18);
                  print(result);
                },
                child: const Icon(Icons.download),
              ),
      ),
    );
  }

  void checkurl() async {
    if (await _webViewController!.currentUrl() == "https://m.youtube.com/") {
      setState(() {
        _showDownloadButton = false;
      });
    } else {
      setState(() {
        _showDownloadButton = true;
      });
    }
  }
}
