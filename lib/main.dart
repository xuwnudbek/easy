import 'dart:io';

import 'package:easy/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    // WebView.platform = SurfaceAndroidWebView();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (context) => MainProvider(),
      builder: (context, snapshot) {
        return Consumer<MainProvider>(builder: (context, provider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Color(0xff3537d8),
              body: SafeArea(
                child: WebViewWidget(
                  controller: provider.controller,
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
