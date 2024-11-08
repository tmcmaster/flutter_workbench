import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_tester/screen_tester.dart';
import 'package:theme_builder/theme_builder.dart';
import 'package:widget_tester/widget_tester.dart';

import 'flutter_workbench_app.dart';

abstract class FlutterWorkbench {
  /// Run a plain container withing FlutterWorkbench application.
  static void runAppContainer({
    required String title,
    ThemeBuilderThemes? styles,
    bool screenshot = false,
    required Widget child,
  }) {
    return _runApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        screenshot: screenshot,
        child: child,
      ),
    );
  }

  /// Run a ScreenTester widget withing FlutterWorkbench application.
  static void runAppScreenTester({
    required String title,
    required ThemeBuilderThemes styles,
    bool screenshot = false,
    required ScreenTesterOptions options,
    required Widget child,
  }) {
    return _runApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        screenshot: screenshot,
        child: ScreenTester(
          options: options,
          child: child,
        ),
      ),
    );
  }

  /// Run a WidgetTester widget withing FlutterWorkbench application.
  static void runAppWidgetTester({
    required String title,
    required ThemeBuilderThemes styles,
    bool screenshot = false,
    required WidgetTesterOptions options,
    required List<Widget> children,
  }) {
    return _runApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        screenshot: screenshot,
        child: WidgetTester(
          options: options,
          children: children,
        ),
      ),
    );
  }

  /// Run a PixelPerfect widget withing FlutterWorkbench application.
  static void runAppPixelPerfect({
    required String title,
    required ThemeBuilderThemes styles,
    bool screenshot = false,
    required String image,
    required double scale,
    required double opacity,
    required Widget child,
  }) {
    return _runApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        screenshot: screenshot,
        child: PixelPerfectContainer(
          image: image,
          scale: scale,
          opacity: opacity,
          child: child,
        ),
      ),
    );
  }

  /// Run a DevicePreview widget withing FlutterWorkbench application.
  static void runAppDevicePreview({
    required String title,
    required ThemeBuilderThemes styles,
    bool screenshot = false,
    required DeviceInfo device,
    required Widget child,
  }) {
    return _runApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        screenshot: screenshot,
        child: DevicePreviewContainer(
          device: device,
          child: child,
        ),
      ),
    );
  }

  /// View component multiple times, with each of the themes applied to it.
  static void runAppAllThemes({
    required String title,
    required ThemeBuilderThemes styles,
    required WidgetTesterOptions options,
    required Widget Function(BuildContext context) builder,
  }) {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      ProviderScope(
        overrides: [
          ThemeBuilderProviders.themes.overrideWithProvider(Provider((_) => styles)),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, child) {
                final themes = ref.read(ThemeBuilderProviders.themes);
                final styleNames = ref.read(ThemeBuilderProviders.styleNames);
                return WidgetTester(
                  options: options,
                  children: styleNames.map((styleName) {
                    final style = themes.getStyle(styleName);
                    return MaterialApp(
                      theme: style.theme,
                      home: Scaffold(
                        body: builder(context),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  static void _runApp(FlutterWorkbenchApp flutterWorkbenchApp) {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(flutterWorkbenchApp);
  }
}
