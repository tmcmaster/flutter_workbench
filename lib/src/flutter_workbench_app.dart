import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder.dart';

class FlutterWorkbenchApp extends StatelessWidget {
  final String title;
  final ThemeBuilderThemes themes;
  final Widget child;

  FlutterWorkbenchApp({
    Key? key,
    required this.title,
    required this.themes,
    required this.child,
  }) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        ThemeBuilderProviders.themes.overrideWithProvider(Provider((_) => themes)),
      ],
      observers: [
        _Logger(),
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
                drawer: Drawer(
                  child: ThemeBuilderStyleSelector(),
                ),
                body: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                  ),
                  child: child,
                ),
                floatingActionButton: Builder(
                  builder: (context) => FloatingActionButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    // backgroundColor: Colors.green,
                    child: Icon(Icons.colorize),
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
