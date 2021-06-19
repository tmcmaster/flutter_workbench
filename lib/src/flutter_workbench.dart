import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workbench/src/flutter_workbench_app.dart';
import 'package:screen_tester/screen_tester.dart';
import 'package:screen_tester/widgets/device_preview_container.dart';
import 'package:screen_tester/widgets/pixel_perfect_container.dart';
import 'package:screen_tester/widgets/screen_tester_options.dart';
import 'package:theme_builder/theme_builder_themes.dart';
import 'package:widget_tester/widget_tester.dart';
import 'package:widget_tester/widget_tester_options.dart';

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
    required Image image,
    required Widget child,
  }) {
    return _runFlutterWorkbenchApp(
      FlutterWorkbenchApp(
        title: title,
        themes: styles,
        child: PixelPerfectContainer(
          image: image,
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
