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
                // appBar: AppBar(
                //   title: Text(title),
                // ),
                drawer: (themes != null
                    ? Drawer(
                        child: ThemeBuilderStyleSelector(),
                      )
                    : null),
                body: Container(
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(10.0),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.purple),
                  // ),
                  child: (screenshot
                      ? Screenshot(
                          controller: screenshotController,
                          child: child,
                        )
                      : child),
                ),
                floatingActionButton: Builder(
                  builder: (context) => Row(
                    mainAxisAlignment:
                        (screenshot && themes != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end),
                    children: [
                      if (screenshot)
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: FloatingActionButton(
                            onPressed: () {
                              print('Taking snapshot');
                              screenshotController
                                  .captureAndSave('/tmp', fileName: 'screenshot.png')
                                  .then((file) async {
                                print('Saved Screenshot: $file');
                              });
                            },
                            // backgroundColor: Colors.green,
                            child: Icon(Icons.camera),
                          ),
                        ),
                      if (themes != null)
                        FloatingActionButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          // backgroundColor: Colors.green,
                          child: Icon(Icons.colorize),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('{"provider": "${provider.name ?? provider.runtimeType}","newValue": "$newValue"}');
  }
}
