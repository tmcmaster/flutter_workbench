import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';
import 'package:theme_builder/theme_builder.dart';

class FlutterWorkbenchApp extends StatelessWidget {
  final String title;
  final ThemeBuilderThemes? themes;
  final bool logging;
  final bool screenshot;
  final Widget child;
  final screenshotController = ScreenshotController();

  FlutterWorkbenchApp({
    Key? key,
    required this.title,
    required this.themes,
    this.logging = false,
    this.screenshot = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (themes != null) ThemeBuilderProviders.themes.overrideWithProvider(Provider((_) => themes!)),
      ],
      observers: [
        if (logging) _Logger(),
      ],
      child: ThemeBuilder(
        builder: (BuildContext context, ThemeBuilderStyle style) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            theme: style.theme,
            darkTheme: style.darkTheme,
            home: SafeArea(
              child: Scaffold(
                drawer: (themes != null || screenshot
                    ? Drawer(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              if (themes != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Change Theme',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    ThemeBuilderStyleSelector(),
                                  ],
                                ),
                              if (screenshot) ScreenshotButton(screenshotController: screenshotController)
                            ],
                          ),
                        ),
                      )
                    : null),
                body: Container(
                  child: (screenshot
                      ? Screenshot(
                          controller: screenshotController,
                          child: child,
                        )
                      : child),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScreenshotButton extends StatelessWidget {
  const ScreenshotButton({
    Key? key,
    required this.screenshotController,
  }) : super(key: key);

  final ScreenshotController screenshotController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        screenshotController.captureAndSave('/tmp', fileName: 'screenshot.png').then((file) async {});
      },
      child: Text('Take a Screenshot'),
    );
  }
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    // void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('{"provider": "${provider.name ?? provider.runtimeType}","newValue": "$newValue"}');
  }
}
