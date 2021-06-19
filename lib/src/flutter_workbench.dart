import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screen_tester/screen_tester.dart';
import 'package:theme_builder/theme_builder.dart';
import 'package:widget_tester/widget_tester.dart';

import 'flutter_workbench_app.dart';

abstract class FlutterWorkbench {
  static void runScreenTesterApp({
    required String title,
    required ThemeBuilderThemes styles,
    required ScreenTesterOptions options,
    required Widget child,
  }) {
    return _runFlutterWorkbenchApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        child: ScreenTester(
          options: options,
          child: child,
        ),
      ),
    );
  }

  static void runWidgetTesterApp({
    required String title,
    required ThemeBuilderThemes styles,
    required WidgetTesterOptions options,
    required List<Widget> children,
  }) {
    return _runFlutterWorkbenchApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        child: WidgetTester(
          options: options,
          children: children,
        ),
      ),
    );
  }

  static void runPixelPerfectApp({
    required String title,
    required ThemeBuilderThemes styles,
    required String image,
    required double scale,
    required Widget child,
  }) {
    return _runFlutterWorkbenchApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        child: PixelPerfectContainer(
          image: image,
          scale: scale,
          child: child,
        ),
      ),
    );
  }

  static void runDevicePreviewApp({
    required String title,
    required ThemeBuilderThemes styles,
    required DeviceInfo device,
    required Widget child,
  }) {
    return _runFlutterWorkbenchApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        child: DevicePreviewContainer(
          device: device,
          child: child,
        ),
      ),
    );
  }

  static void _runFlutterWorkbenchApp(FlutterWorkbenchApp flutterWorkbenchApp) {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(flutterWorkbenchApp);
  }
}
